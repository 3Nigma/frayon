
project (Frayon)
cmake_minimum_required (VERSION 2.6)

set (PACKAGE "Frayon")
set (VERSION "0.0.1")

set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set (CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libs)
set (CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libd)

set (FRAYON_3RDPT_PATH ${CMAKE_BINARY_DIR}/3rdpt)
set (BUILD_DYNAMIC_LIB 1)

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

# include paths
include_directories (include)
link_directories (${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
link_directories (${CMAKE_LIBRARY_OUTPUT_DIRECTORY})

# sources region
set (FRAYON_SOURCES
     ./src/main.cpp
)

# Add 3rd party resources
# -- Pt v1.0
set (PT_BASE_PATH ${FRAYON_3RDPT_PATH}/Pt-1.0.0)
include_directories (${PT_BASE_PATH}/include)
if (UNIX)
    set (JAM_OS_TYPE posix)
elseif (WIN32)
    set (JAM_OS_TYPE win32)
endif ()

# common definitions region
add_definitions(-DNDEBUG)

# build core components
add_subdirectory (${PT_BASE_PATH}/Pt EXCLUDE_FROM_ALL)
add_subdirectory (${PT_BASE_PATH}/Pt-System EXCLUDE_FROM_ALL)

# build extended components
include_directories (${PT_BASE_PATH}/Pt-System/${JAM_OS_TYPE})
add_subdirectory (${PT_BASE_PATH}/Pt-Unit EXCLUDE_FROM_ALL)
add_subdirectory (${PT_BASE_PATH}/Pt-Xml EXCLUDE_FROM_ALL)
add_subdirectory (${PT_BASE_PATH}/Pt-Net EXCLUDE_FROM_ALL)
add_subdirectory (${PT_BASE_PATH}/Pt-Ssl EXCLUDE_FROM_ALL)
add_subdirectory (${PT_BASE_PATH}/Pt-Http EXCLUDE_FROM_ALL)
add_subdirectory (${PT_BASE_PATH}/Pt-XmlRpc EXCLUDE_FROM_ALL)

# cleanup definitions space
remove_definitions (-DNDEBUG)

#  -- lua v5.2
add_subdirectory (${FRAYON_3RDPT_PATH}/lua-5.2 EXCLUDE_FROM_ALL)
include_directories (${FRAYON_3RDPT_PATH}/lua-5.2)
find_library(LUA_LIB_FILE lua HINTS "${FRAYON_3RDPT_PATH}/lua-5.2")

#  -- luacppinterface v1.0
add_subdirectory (${FRAYON_3RDPT_PATH}/LuaCppInterface-1.0 EXCLUDE_FROM_ALL)
include_directories (${FRAYON_3RDPT_PATH}/LuaCppInterface-1.0)

#  -- FANN v2.2.0
add_subdirectory (${FRAYON_3RDPT_PATH}/fann-2.2.0 EXCLUDE_FROM_ALL)
include_directories (${FRAYON_3RDPT_PATH}/fann-2.2.0/include)

#  -- libjson v7
add_subdirectory (${FRAYON_3RDPT_PATH}/libjson-7 EXCLUDE_FROM_ALL)
include_directories (${FRAYON_3RDPT_PATH}/libjson-7)

# -- Eigen v3.2.0
include_directories (${FRAYON_3RDPT_PATH}/eigen-3.2.0)

add_executable (frayon ${FRAYON_SOURCES})
add_dependencies (frayon PtSystem)
target_link_libraries (frayon ${PT_STATIC_LIBRARY}
                              ${PT_SYSTEM_STATIC_LIBRARY}
                              dl
)