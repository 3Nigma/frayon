project (lua5.2)

cmake_minimum_required (VERSION 2.6)

set (LUA_CORE_SOURCES
     ./lapi.c ./lcode.c ./lctype.c ./ldebug.c ./ldo.c ./ldump.c ./lfunc.c ./lgc.c ./llex.c
     ./lmem.c ./lobject.c ./lopcodes.c ./lparser.c ./lstate.c ./lstring.c ./ltable.c
     ./ltm.c ./lundump.c ./lvm.c ./lzio.c
)
set (LUA_LIB_SOURCES
     ./lauxlib.c ./lbaselib.c ./lbitlib.c ./lcorolib.c ./ldblib.c ./liolib.c
     ./lmathlib.c ./loslib.c ./lstrlib.c ./ltablib.c ./loadlib.c ./linit.c
)
set (LUA_SOURCES ${LUA_CORE_SOURCES} ${LUA_LIB_SOURCES})

# definitions region
add_definitions (-DLUA_COMPAT_ALL)
if (UNIX)
    add_definitions (-DLUA_USE_LINUX)
endif ()

add_library (lua ${LUA_SOURCES})

set (LUA_LIBRARY -llua PARENT_SCOPE)