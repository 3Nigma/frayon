/*
Copyright © 2011-2012 Clint Bellanger
Copyright © 2012-2013 Stefan Beller
Copyright © 2013 Henrik Andersson

This file is part of FLARE.

FLARE is free software: you can redistribute it and/or modify it under the terms
of the GNU General Public License as published by the Free Software Foundation,
either version 3 of the License, or (at your option) any later version.

FLARE is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
FLARE.  If not, see http://www.gnu.org/licenses/
*/


#include "Map.h"

#include "FileParser.h"
#include "UtilsParsing.h"
#include "Settings.h"

Map::Map()
	: events()
	, enemy_groups()
	, filename("")
	, layers()
	, w(0)
	, h(0)
	, spawn()
	, spawn_dir(0) {
}



void Map::clearLayers() {

	for (unsigned i = 0; i < layers.size(); ++i)
		delete[] layers[i];
	layers.clear();
	layernames.clear();
}

void Map::clearQueues() {
	enemies = std::queue<Map_Enemy>();
	npcs = std::queue<Map_NPC>();
}

void Map::clearEvents() {
	events.clear();
}

int Map::load(std::string fname) {
	FileParser infile;
	maprow *cur_layer = NULL;

	clearEvents();
	clearLayers();
	clearQueues();

	// @CLASS Map|Description of maps/
	if (!infile.open(fname))
		return 0;

	this->filename = fname;

	while (infile.next()) {
		if (infile.new_section) {

			// for sections that are stored in collections, add a new object here
			if (infile.section == "enemy")
				enemies.push(Map_Enemy());
			else if (infile.section == "enemygroup")
				enemy_groups.push(Map_Group());
			else if (infile.section == "npc")
				npcs.push(Map_NPC());
			else if (infile.section == "event")
				events.push_back(Event());

		}
		if (infile.section == "header")
			loadHeader(infile);
		else if (infile.section == "layer")
			loadLayer(infile, &cur_layer);
		else if (infile.section == "enemy")
			loadEnemy(infile);
		else if (infile.section == "enemygroup")
			loadEnemyGroup(infile, &enemy_groups.back());
		else if (infile.section == "npc")
			loadNPC(infile);
		else if (infile.section == "event")
			EventManager::loadEvent(infile, &events.back());
	}

	infile.close();

	return 0;
}

void Map::loadHeader(FileParser &infile) {
	if (infile.key == "title") {
		// @ATTR title|string|Title of map
		this->title = msg->get(infile.val);
	}
	else if (infile.key == "width") {
		// @ATTR width|integer|Width of map
		this->w = toInt(infile.val);
	}
	else if (infile.key == "height") {
		// @ATTR height|integer|Height of map
		this->h = toInt(infile.val);
	}
	else if (infile.key == "tileset") {
		// @ATTR tileset|string|Tileset to use for map
		this->tileset = infile.val;
	}
	else if (infile.key == "music") {
		// @ATTR music|string|Background music to use for map
		music_filename = infile.val;
	}
	else if (infile.key == "location") {
		// @ATTR location|[x(integer), y(integer), direction(integer))|Spawn point location in map
		spawn.x = toInt(infile.nextValue()) + 0.5f;
		spawn.y = toInt(infile.nextValue()) + 0.5f;
		spawn_dir = toInt(infile.nextValue());
	}
}

void Map::loadLayer(FileParser &infile, maprow **current_layer) {
	if (infile.key == "type") {
		// @ATTR layer.type|string|Map layer type.
		*current_layer = new maprow[w];
		layers.push_back(*current_layer);
		layernames.push_back(infile.val);
	}
	else if (infile.key == "format") {
		// @ATTR layer.format|string|Format for map layer, must be 'dec'
		if (infile.val != "dec") {
			fprintf(stderr, "ERROR: maploading: The format of a layer must be \"dec\"!\n");
			SDL_Quit();
			exit(1);
		}
	}
	else if (infile.key == "data") {
		// @ATTR layer.data|raw|Raw map layer data
		// layer map data handled as a special case
		// The next h lines must contain layer data.  TODO: err
		for (int j=0; j<h; j++) {
			std::string val = infile.getRawLine() + ',';
			for (int i=0; i<w; i++)
				(*current_layer)[i][j] = eatFirstInt(val, ',');
		}
	}
}

void Map::loadEnemy(FileParser &infile) {
	if (infile.key == "type") {
		// @ATTR enemy.type|string|Enemy type
		enemies.back().type = infile.val;
	}
	else if (infile.key == "location") {
		// @ATTR enemy.location|[x(integer), y(integer)]|Location of enemy
		enemies.back().pos.x = toInt(infile.nextValue()) + 0.5f;
		enemies.back().pos.y = toInt(infile.nextValue()) + 0.5f;
	}
	else if (infile.key == "direction") {
		// @ATTR enemy.direction|integer|Direction of enemy
		enemies.back().direction = toInt(infile.val);
	}
	else if (infile.key == "waypoints") {
		// @ATTR enemy.waypoint|[x(integer), y(integer)]|Enemy waypoint
		std::string none = "";
		std::string a = infile.nextValue();
		std::string b = infile.nextValue();

		while (a != none) {
			FPoint p;
			p.x = toInt(a) + 0.5f;
			p.y = toInt(b) + 0.5f;
			enemies.back().waypoints.push(p);
			a = infile.nextValue();
			b = infile.nextValue();
		}
	}
	else if (infile.key == "wander_area") {
		// @ATTR enemy.wander_area|[x(integer),y(integer),w(integer),h(integer)]|Wander area for the enemy.
		enemies.back().wander = true;
		enemies.back().wander_area.x = toInt(infile.nextValue());
		enemies.back().wander_area.y = toInt(infile.nextValue());
		enemies.back().wander_area.w = toInt(infile.nextValue());
		enemies.back().wander_area.h = toInt(infile.nextValue());
	}
	// @ATTR enemy.requires_status|string|Status required for enemy load
	else if (infile.key == "requires_status")
        enemies.back().requires_status.push_back(infile.nextValue());
    // @ATTR enemy.requires_not_status|string|Status required to be missing for enemy load
	else if (infile.key == "requires_not_status")
        enemies.back().requires_not_status.push_back(infile.nextValue());
}

void Map::loadEnemyGroup(FileParser &infile, Map_Group *group) {
	if (infile.key == "type") {
		// @ATTR enemygroup.type|string|Type of enemy group
		group->category = infile.val;
	}
	else if (infile.key == "level") {
		// @ATTR enemygroup.level|[min(integer), max(integer)]|Defines the level range of enemies in group.
		group->levelmin = toInt(infile.nextValue());
		group->levelmax = toInt(infile.nextValue());
	}
	else if (infile.key == "location") {
		// @ATTR enemygroup.location|[x(integer), y(integer), x2(integer), y2(integer)]|Location area for enemygroup
		group->pos.x = toInt(infile.nextValue());
		group->pos.y = toInt(infile.nextValue());
		group->area.x = toInt(infile.nextValue());
		group->area.y = toInt(infile.nextValue());
	}
	else if (infile.key == "number") {
		// @ATTR enemygroup.number|[min(integer), max(integer]|Defines the range of enemies in group. If only one number is given, it's the exact amount.
		group->numbermin = toInt(infile.nextValue());
		group->numbermax = toInt(infile.nextValue(), group->numbermin);
	}
	else if (infile.key == "chance") {
		// @ATTR enemygroup.chance|integer|Percentage of chance
		float n = toInt(infile.nextValue()) / 100.0f;
		group->chance = std::min(1.0f, std::max(0.0f, n));
	}
}

void Map::loadNPC(FileParser &infile) {
	std::string s;
	if (infile.key == "type") {
		// @ATTR npc.type|string|Type of NPC
		npcs.back().id = infile.val;
	}
	if (infile.key == "requires_status") {
		// @ATTR npc.requires_status|string|Status required for NPC load. There can be multiple states, separated by comma
		while ( (s = infile.nextValue()) != "")
			npcs.back().requires_status.push_back(s);
	}
	if (infile.key == "requires_not_status") {
		// @ATTR npc.requires_not|string|Status required to be missing for NPC load. There can be multiple states, separated by comma
		while ( (s = infile.nextValue()) != "")
			npcs.back().requires_not_status.push_back(s);
	}
	else if (infile.key == "location") {
		// @ATTR npc.location|[x(integer), y(integer)]|Location of NPC
		npcs.back().pos.x = toInt(infile.nextValue()) + 0.5f;
		npcs.back().pos.y = toInt(infile.nextValue()) + 0.5f;
	}
}


