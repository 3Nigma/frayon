/*
 * This file is part of project 'Frayon'
 * Copyright © 2014 Victor ADASCALITEI [3Nigma @ github]
 * License: GNU GPL v3 [More @ http://www.gnu.org/licenses/gpl.html]
 * Short description: Frayon is (or hopes to be) a C++, free (see above) and inteligent online-generic game engine. 
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
#include <luacppinterface.h>

int main(int argc, char *argv[])
{
	Lua* luap = new Lua();
	delete luap;

	return 0;
}
