/*
 * This file is part of project 'Frayon'
 * Copyright © 2014 Victor ADASCALITEI [3Nigma @ github]
 * License: GNU GPL v3 [More @ http://www.gnu.org/licenses/gpl.html]
 * Short description: Frayon is (or hopes to be) a C++, free (see above) and inteligent online RPG game engine
 *                    rendered in SDLv2, stored with SQLite3 and powered by Lua to say the least. 
 */

#define _(String) (String)
#define N_(String) String
#define textdomain(Domain)
#define bindtextdomain(Package, Directory)

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cassert>
#include <cmath>
#include <ctime>

#define SDL_MAIN_HANDLED
#include "SDL.h"

#include <iostream>
using namespace std;

const int MAX_FRAMES_PER_SEC = 30;
SDL_Window *gameWindow = nullptr;
SDL_Renderer *gameRenderer = nullptr;

static void init()
{
	SDL_SetMainReady();
	if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_AUDIO) < 0) {
		cerr << "Could not initialize SDL: " << SDL_GetError() << endl;
	} else {
		gameWindow = SDL_CreateWindow("Frayon", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 640, 480, SDL_WINDOW_ALLOW_HIGHDPI);
		if (gameWindow == nullptr) {
			// Something wrong has happened!
		} else {
			gameRenderer = SDL_CreateRenderer(gameWindow, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);
			if (gameRenderer == nullptr) {
				// Something wrong has happened!
			} else {
				SDL_SetRenderDrawColor(gameRenderer, 255, 0, 0, 255);
				SDL_RenderClear(gameRenderer);
				SDL_RenderPresent(gameRenderer);
			}
		}
	}
}

static void mainLoop(bool debug_event)
{
	bool done = false;
	int delay = 1000 / MAX_FRAMES_PER_SEC;
	int prevTicks = SDL_GetTicks();

	while (!done) {
		int nowTicks = SDL_GetTicks();
		if (nowTicks - prevTicks < delay) SDL_Delay(delay - (nowTicks - prevTicks));
		prevTicks = SDL_GetTicks();
	}
}

static void cleanup()
{
	SDL_DestroyWindow(gameWindow);
	SDL_Quit();
}

int main(int argc, char *argv[])
{
	bool debug_event = false;

	// Do some sanity checks
	assert(SDL_MAJOR_VERSION == 2);

	srand((unsigned int) time(NULL));
	init();
	mainLoop(debug_event);
	cleanup();

	return 0;
}
