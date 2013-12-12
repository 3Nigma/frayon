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

#ifndef MAP_H
#define MAP_H

#include <vector>
#include <queue>

#include "FileParser.h"
#include "Utils.h"
#include "StatBlock.h"
#include "EventManager.h"

typedef unsigned short maprow[256];

class Map_Group {
public:
	std::string category;
	Point pos;
	Point area;
	int levelmin;
	int levelmax;
	int numbermin;
	int numbermax;
	float chance;
	Map_Group()
		: category("")
		, pos()
		, area()
		, levelmin(0)
		, levelmax(0)
		, numbermin(0)
		, numbermax(0)
		, chance(1.0f)
	{}
};

class Map_NPC {
public:
	std::string id;
	FPoint pos;
	std::vector<std::string> requires_status;
	std::vector<std::string> requires_not_status;

	Map_NPC()
	: id("")
	, pos()
	, requires_status()
	, requires_not_status()
	{}
};

class Map_Enemy {
public:
	std::string type;
	FPoint pos;
	int direction;
	std::queue<FPoint> waypoints;
	bool wander;
	SDL_Rect wander_area;
	bool hero_ally;
	int summon_power_index;
	StatBlock* summoner;
	std::vector<std::string> requires_status;
	std::vector<std::string> requires_not_status;

	Map_Enemy(std::string _type="", FPoint _pos=FPoint())
	 : type(_type)
	 , pos(_pos)
	 , direction(rand() % 8)
	 , waypoints(std::queue<FPoint>())
	 , wander(false)
	 , hero_ally(false)
	 , summon_power_index(0)
	 , summoner(NULL)
	 , requires_status()
	 , requires_not_status()
	{
		wander_area.x = 0;
		wander_area.y = 0;
		wander_area.w = 0;
		wander_area.h = 0;
	}
};

class Map
{
protected:
	void loadHeader(FileParser &infile);
	void loadLayer(FileParser &infile, maprow **cur_layer);
	void loadEnemy(FileParser &infile);
	void loadEnemyGroup(FileParser &infile, Map_Group *group);
	void loadNPC(FileParser &infile);

	void clearLayers();
	void clearQueues();

	// map events
	std::vector<Event> events;
	std::queue<Map_Group> enemy_groups;

	std::string filename;
	std::string tileset;

	int load(std::string filename);
public:
	Map();

	std::string music_filename;

	std::vector<maprow*> layers; // visible layers in maprenderer
	std::vector<std::string> layernames;

	void clearEvents();

	// enemy load handling
	std::queue<Map_Enemy> enemies;

	// npc load handling
	std::queue<Map_NPC> npcs;

	// vars
	std::string title;
	short w;
	short h;
	FPoint spawn;
	int spawn_dir;

};

#endif // MAP_H
