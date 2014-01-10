Project (Frayon)
cmake_minimum_required (VERSION 2.6)

Set (PACKAGE "Frayon")
Set (VERSION "0.0.1")

# Default definitions
set(CMAKE_CXX_FLAGS "-std=c++0x")
if(CMAKE_BUILD_TYPE STREQUAL "Release")
  set(CMAKE_CXX_FLAGS_RELEASE "-O2 -g0")
elseif(CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo")
  set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g")
elseif(CMAKE_BUILD_TYPE STREQUAL "MinSizeRel")
  set(CMAKE_CXX_FLAGS_MINSIZEREL "-Os -g0")
elseif(CMAKE_BUILD_TYPE STREQUAL "Debug")
  set(CMAKE_CXX_FLAGS_DEBUG "-O0 -g3 -pg")
  set(CMAKE_EXE_LINKER_FLAGS_DEBUG "-pg")
  set(CMAKE_SHARED_LINKER_FLAGS_DEBUG "-pg")
  set(CMAKE_MODULE_LINKER_FLAGS_DEBUG "-pg")
endif()

# Detect missing dependencies

include(FindPkgConfig)
pkg_search_module(SDL2 REQUIRED sdl2)
If (NOT SDL2_FOUND)
  Message (FATAL_ERROR "Couldn't find SDL2 development files. On Debian-based systems (such as Ubuntu) you should install the 'libsdl1.2-dev' package.")
Else (NOT SDL2_FOUND)
  include_directories (${SDL2_INCLUDE_DIRS})
  link_directories (${SDL2_LIBRARY_DIRS})
EndIf (NOT SDL2_FOUND)

find_package (SDL_mixer REQUIRED)
If (NOT SDLMIXER_FOUND)
  Message (FATAL_ERROR "Couldn't find SDL-mixer development files. On Debian-based systems (such as Ubuntu) you should install the 'libsdl-mixer1.2-dev' package.")
Else (NOT SDLMIXER_FOUND)
  include_directories (${SDLMIXER_INCLUDE_DIR})
EndIf (NOT SDLMIXER_FOUND)

find_package (SDL_image REQUIRED)
If (NOT SDLIMAGE_FOUND)
  Message (FATAL_ERROR "Couldn't find SDL-image development files. On Debian-based systems (such as Ubuntu) you should install the 'libsdl-image1.2-dev' package.")
Else (NOT SDLIMAGE_FOUND)
  include_directories (${SDLIMAGE_INCLUDE_DIR})
EndIf (NOT SDLIMAGE_FOUND)

find_package (SDL_ttf REQUIRED)
If (NOT SDLTTF_FOUND)
  Message (FATAL_ERROR "Couldn't find SDL-ttf development files. On Debian-based systems (such as Ubuntu) you should install the 'libsdl-ttf2.0-dev' package.")
Else (NOT SDLTTF_FOUND)
  include_directories (${SDLTTF_INCLUDE_DIR})
EndIf (NOT SDLTTF_FOUND)

# Include paths
include_directories(include)

# Sources
set(FRAYON_SOURCES
    ./src/main.cpp
)

set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set (CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

add_executable (frayon ${FRAYON_SOURCES})
target_link_libraries (frayon ${CMAKE_LD_FLAGS} ${SDL2_LIBRARIES} ${SDLMIXER_LIBRARY} ${SDLIMAGE_LIBRARY} ${SDLTTF_LIBRARY})

# installing to the proper places
#install(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/flare DESTINATION ${BINDIR})
#install(DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/mods" DESTINATION ${DATADIR}/default)
#install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/distribution/flare.man" DESTINATION ${MANDIR}/man1 RENAME flare.1)

