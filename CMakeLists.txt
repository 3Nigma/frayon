
project (Frayon)
cmake_minimum_required (VERSION 2.6)

set (PACKAGE "Frayon")
set (VERSION "0.0.1")

set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set (CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libs)
set (CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libd)

set (FRAYON_3RDPT_PATH ${CMAKE_BINARY_DIR}/3rdpt)

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

# include paths
include_directories(include)
link_directories (${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})

# sources region
set(FRAYON_SOURCES
    ./src/main.cpp
)

# Add 3rd party resources
# -- Pt v1.0
add_subdirectory (${FRAYON_3RDPT_PATH}/Pt-1.0.0)

#  -- lua 5.2
add_subdirectory (${FRAYON_3RDPT_PATH}/lua-5.2)
include_directories (${FRAYON_3RDPT_PATH}/lua-5.2)
find_library(LUA_LIB_FILE lua HINTS "${FRAYON_3RDPT_PATH}/lua-5.2")

#  -- luacppinterface
add_subdirectory (${FRAYON_3RDPT_PATH}/LuaCppInterface-1.0)
include_directories (${FRAYON_3RDPT_PATH}/LuaCppInterface-1.0)

#  -- FANN v2.2.0
add_subdirectory (${FRAYON_3RDPT_PATH}/fann-2.2.0)
include_directories (${FRAYON_3RDPT_PATH}/fann-2.2.0/include)

#  -- libjson
add_subdirectory (${FRAYON_3RDPT_PATH}/libjson-7)
include_directories (${FRAYON_3RDPT_PATH}/libjson-7)

# -- Eigen v3.2.0
include_directories (${FRAYON_3RDPT_PATH}/eigen-3.2.0)

add_executable (frayon ${FRAYON_SOURCES})
add_dependencies(frayon luacppinterface)
target_link_libraries (frayon ${CMAKE_LD_FLAGS}  
                              ${SDL2_LIBRARIES} 
                              ${SDLMIXER_LIBRARY} 
                              ${SDLIMAGE_LIBRARY} 
                              ${SDLTTF_LIBRARY} 
                              ${LUA_CPPI_LIBRARY}
                              ${LUA_LIBRARY})