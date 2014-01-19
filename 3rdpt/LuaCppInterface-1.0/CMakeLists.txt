set (LUACPPI_SOURCES
     ./luacoroutine.cpp
     ./luacppinterface.cpp
     ./luafunction.cpp
     ./luareference.cpp
     ./luatable.cpp
)
set (LUACPPI_ALL_SRCS ${LUACPPI_SOURCES})

add_library (luacppinterface ${LUACPPI_ALL_SRCS})

add_dependencies(luacppinterface lua)

set (LUA_CPPI_LIBRARY -lluacppinterface PARENT_SCOPE)