/*
 * This file is part of project 'Frayon'
 * Copyright © 2014 Victor ADASCALITEI [3Nigma @ github]
 * License: GNU GPL v3 [More @ http://www.gnu.org/licenses/gpl.html]
 * Short description: Frayon is (or hopes to be) a C++ rooted, free (see above) and inteligent online-generic game engine. 
 */

#define _(String) (String)
#define N_(String) String
#define textdomain(Domain)
#define bindtextdomain(Package, Directory)

#include <iostream>
#include "Pt/System/Api.h"
#include "Pt/System/Application.h"
#include "Pt/System/Timer.h"

void onTimer() {
    std::cerr << "Time out!\n";
}

int main(int argc, char *argv[]) {
    Pt::System::Application app(argc, argv);

    Pt::System::Timer timer;
    timer.timeout() += Pt::slot(onTimer);
    timer.setActive(app.loop());
    timer.start(1000);

    app.loop().run();
    return 0;
}