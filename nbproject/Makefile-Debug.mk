#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux-x86
CND_DLIB_EXT=so
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/3rdpt/LuaCppInterface/luacoroutine.o \
	${OBJECTDIR}/3rdpt/LuaCppInterface/luacppinterface.o \
	${OBJECTDIR}/3rdpt/LuaCppInterface/luafunction.o \
	${OBJECTDIR}/3rdpt/LuaCppInterface/luareference.o \
	${OBJECTDIR}/3rdpt/LuaCppInterface/luatable.o \
	${OBJECTDIR}/3rdpt/lua5.2/lapi.o \
	${OBJECTDIR}/3rdpt/lua5.2/lauxlib.o \
	${OBJECTDIR}/3rdpt/lua5.2/lbaselib.o \
	${OBJECTDIR}/3rdpt/lua5.2/lbitlib.o \
	${OBJECTDIR}/3rdpt/lua5.2/lcode.o \
	${OBJECTDIR}/3rdpt/lua5.2/lcorolib.o \
	${OBJECTDIR}/3rdpt/lua5.2/lctype.o \
	${OBJECTDIR}/3rdpt/lua5.2/ldblib.o \
	${OBJECTDIR}/3rdpt/lua5.2/ldebug.o \
	${OBJECTDIR}/3rdpt/lua5.2/ldo.o \
	${OBJECTDIR}/3rdpt/lua5.2/ldump.o \
	${OBJECTDIR}/3rdpt/lua5.2/lfunc.o \
	${OBJECTDIR}/3rdpt/lua5.2/lgc.o \
	${OBJECTDIR}/3rdpt/lua5.2/linit.o \
	${OBJECTDIR}/3rdpt/lua5.2/liolib.o \
	${OBJECTDIR}/3rdpt/lua5.2/llex.o \
	${OBJECTDIR}/3rdpt/lua5.2/lmathlib.o \
	${OBJECTDIR}/3rdpt/lua5.2/lmem.o \
	${OBJECTDIR}/3rdpt/lua5.2/loadlib.o \
	${OBJECTDIR}/3rdpt/lua5.2/lobject.o \
	${OBJECTDIR}/3rdpt/lua5.2/lopcodes.o \
	${OBJECTDIR}/3rdpt/lua5.2/loslib.o \
	${OBJECTDIR}/3rdpt/lua5.2/lparser.o \
	${OBJECTDIR}/3rdpt/lua5.2/lstate.o \
	${OBJECTDIR}/3rdpt/lua5.2/lstring.o \
	${OBJECTDIR}/3rdpt/lua5.2/lstrlib.o \
	${OBJECTDIR}/3rdpt/lua5.2/ltable.o \
	${OBJECTDIR}/3rdpt/lua5.2/ltablib.o \
	${OBJECTDIR}/3rdpt/lua5.2/ltm.o \
	${OBJECTDIR}/3rdpt/lua5.2/lua.o \
	${OBJECTDIR}/3rdpt/lua5.2/luac.o \
	${OBJECTDIR}/3rdpt/lua5.2/lundump.o \
	${OBJECTDIR}/3rdpt/lua5.2/lvm.o \
	${OBJECTDIR}/3rdpt/lua5.2/lzio.o \
	${OBJECTDIR}/src/main.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=-L3rdpt/lua5.2 -L3rdpt/LuaCppInterface `pkg-config --libs sdl2` -llua -lluacppinterface  

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk bin/frayon

bin/frayon: ${OBJECTFILES}
	${MKDIR} -p bin
	${LINK.cc} -o bin/frayon ${OBJECTFILES} ${LDLIBSOPTIONS} -static

${OBJECTDIR}/3rdpt/LuaCppInterface/luacoroutine.o: 3rdpt/LuaCppInterface/luacoroutine.cpp 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/LuaCppInterface
	${RM} "$@.d"
	$(COMPILE.cc) -g -I3rdpt/lua5.2 -I3rdpt/LuaCppInterface `pkg-config --cflags sdl2` -std=c++11  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/LuaCppInterface/luacoroutine.o 3rdpt/LuaCppInterface/luacoroutine.cpp

${OBJECTDIR}/3rdpt/LuaCppInterface/luacppinterface.o: 3rdpt/LuaCppInterface/luacppinterface.cpp 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/LuaCppInterface
	${RM} "$@.d"
	$(COMPILE.cc) -g -I3rdpt/lua5.2 -I3rdpt/LuaCppInterface `pkg-config --cflags sdl2` -std=c++11  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/LuaCppInterface/luacppinterface.o 3rdpt/LuaCppInterface/luacppinterface.cpp

${OBJECTDIR}/3rdpt/LuaCppInterface/luafunction.o: 3rdpt/LuaCppInterface/luafunction.cpp 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/LuaCppInterface
	${RM} "$@.d"
	$(COMPILE.cc) -g -I3rdpt/lua5.2 -I3rdpt/LuaCppInterface `pkg-config --cflags sdl2` -std=c++11  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/LuaCppInterface/luafunction.o 3rdpt/LuaCppInterface/luafunction.cpp

${OBJECTDIR}/3rdpt/LuaCppInterface/luareference.o: 3rdpt/LuaCppInterface/luareference.cpp 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/LuaCppInterface
	${RM} "$@.d"
	$(COMPILE.cc) -g -I3rdpt/lua5.2 -I3rdpt/LuaCppInterface `pkg-config --cflags sdl2` -std=c++11  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/LuaCppInterface/luareference.o 3rdpt/LuaCppInterface/luareference.cpp

${OBJECTDIR}/3rdpt/LuaCppInterface/luatable.o: 3rdpt/LuaCppInterface/luatable.cpp 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/LuaCppInterface
	${RM} "$@.d"
	$(COMPILE.cc) -g -I3rdpt/lua5.2 -I3rdpt/LuaCppInterface `pkg-config --cflags sdl2` -std=c++11  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/LuaCppInterface/luatable.o 3rdpt/LuaCppInterface/luatable.cpp

${OBJECTDIR}/3rdpt/lua5.2/lapi.o: 3rdpt/lua5.2/lapi.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/lapi.o 3rdpt/lua5.2/lapi.c

${OBJECTDIR}/3rdpt/lua5.2/lauxlib.o: 3rdpt/lua5.2/lauxlib.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/lauxlib.o 3rdpt/lua5.2/lauxlib.c

${OBJECTDIR}/3rdpt/lua5.2/lbaselib.o: 3rdpt/lua5.2/lbaselib.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/lbaselib.o 3rdpt/lua5.2/lbaselib.c

${OBJECTDIR}/3rdpt/lua5.2/lbitlib.o: 3rdpt/lua5.2/lbitlib.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/lbitlib.o 3rdpt/lua5.2/lbitlib.c

${OBJECTDIR}/3rdpt/lua5.2/lcode.o: 3rdpt/lua5.2/lcode.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/lcode.o 3rdpt/lua5.2/lcode.c

${OBJECTDIR}/3rdpt/lua5.2/lcorolib.o: 3rdpt/lua5.2/lcorolib.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/lcorolib.o 3rdpt/lua5.2/lcorolib.c

${OBJECTDIR}/3rdpt/lua5.2/lctype.o: 3rdpt/lua5.2/lctype.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/lctype.o 3rdpt/lua5.2/lctype.c

${OBJECTDIR}/3rdpt/lua5.2/ldblib.o: 3rdpt/lua5.2/ldblib.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/ldblib.o 3rdpt/lua5.2/ldblib.c

${OBJECTDIR}/3rdpt/lua5.2/ldebug.o: 3rdpt/lua5.2/ldebug.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/ldebug.o 3rdpt/lua5.2/ldebug.c

${OBJECTDIR}/3rdpt/lua5.2/ldo.o: 3rdpt/lua5.2/ldo.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/ldo.o 3rdpt/lua5.2/ldo.c

${OBJECTDIR}/3rdpt/lua5.2/ldump.o: 3rdpt/lua5.2/ldump.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/ldump.o 3rdpt/lua5.2/ldump.c

${OBJECTDIR}/3rdpt/lua5.2/lfunc.o: 3rdpt/lua5.2/lfunc.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/lfunc.o 3rdpt/lua5.2/lfunc.c

${OBJECTDIR}/3rdpt/lua5.2/lgc.o: 3rdpt/lua5.2/lgc.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/lgc.o 3rdpt/lua5.2/lgc.c

${OBJECTDIR}/3rdpt/lua5.2/linit.o: 3rdpt/lua5.2/linit.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/linit.o 3rdpt/lua5.2/linit.c

${OBJECTDIR}/3rdpt/lua5.2/liolib.o: 3rdpt/lua5.2/liolib.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/liolib.o 3rdpt/lua5.2/liolib.c

${OBJECTDIR}/3rdpt/lua5.2/llex.o: 3rdpt/lua5.2/llex.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/llex.o 3rdpt/lua5.2/llex.c

${OBJECTDIR}/3rdpt/lua5.2/lmathlib.o: 3rdpt/lua5.2/lmathlib.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/lmathlib.o 3rdpt/lua5.2/lmathlib.c

${OBJECTDIR}/3rdpt/lua5.2/lmem.o: 3rdpt/lua5.2/lmem.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/lmem.o 3rdpt/lua5.2/lmem.c

${OBJECTDIR}/3rdpt/lua5.2/loadlib.o: 3rdpt/lua5.2/loadlib.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/loadlib.o 3rdpt/lua5.2/loadlib.c

${OBJECTDIR}/3rdpt/lua5.2/lobject.o: 3rdpt/lua5.2/lobject.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/lobject.o 3rdpt/lua5.2/lobject.c

${OBJECTDIR}/3rdpt/lua5.2/lopcodes.o: 3rdpt/lua5.2/lopcodes.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/lopcodes.o 3rdpt/lua5.2/lopcodes.c

${OBJECTDIR}/3rdpt/lua5.2/loslib.o: 3rdpt/lua5.2/loslib.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/loslib.o 3rdpt/lua5.2/loslib.c

${OBJECTDIR}/3rdpt/lua5.2/lparser.o: 3rdpt/lua5.2/lparser.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/lparser.o 3rdpt/lua5.2/lparser.c

${OBJECTDIR}/3rdpt/lua5.2/lstate.o: 3rdpt/lua5.2/lstate.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/lstate.o 3rdpt/lua5.2/lstate.c

${OBJECTDIR}/3rdpt/lua5.2/lstring.o: 3rdpt/lua5.2/lstring.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/lstring.o 3rdpt/lua5.2/lstring.c

${OBJECTDIR}/3rdpt/lua5.2/lstrlib.o: 3rdpt/lua5.2/lstrlib.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/lstrlib.o 3rdpt/lua5.2/lstrlib.c

${OBJECTDIR}/3rdpt/lua5.2/ltable.o: 3rdpt/lua5.2/ltable.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/ltable.o 3rdpt/lua5.2/ltable.c

${OBJECTDIR}/3rdpt/lua5.2/ltablib.o: 3rdpt/lua5.2/ltablib.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/ltablib.o 3rdpt/lua5.2/ltablib.c

${OBJECTDIR}/3rdpt/lua5.2/ltm.o: 3rdpt/lua5.2/ltm.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/ltm.o 3rdpt/lua5.2/ltm.c

${OBJECTDIR}/3rdpt/lua5.2/lua.o: 3rdpt/lua5.2/lua.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/lua.o 3rdpt/lua5.2/lua.c

${OBJECTDIR}/3rdpt/lua5.2/luac.o: 3rdpt/lua5.2/luac.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/luac.o 3rdpt/lua5.2/luac.c

${OBJECTDIR}/3rdpt/lua5.2/lundump.o: 3rdpt/lua5.2/lundump.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/lundump.o 3rdpt/lua5.2/lundump.c

${OBJECTDIR}/3rdpt/lua5.2/lvm.o: 3rdpt/lua5.2/lvm.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/lvm.o 3rdpt/lua5.2/lvm.c

${OBJECTDIR}/3rdpt/lua5.2/lzio.o: 3rdpt/lua5.2/lzio.c 
	${MKDIR} -p ${OBJECTDIR}/3rdpt/lua5.2
	${RM} "$@.d"
	$(COMPILE.c) -g `pkg-config --cflags sdl2`   -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/3rdpt/lua5.2/lzio.o 3rdpt/lua5.2/lzio.c

${OBJECTDIR}/src/main.o: src/main.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -I3rdpt/lua5.2 -I3rdpt/LuaCppInterface `pkg-config --cflags sdl2` -std=c++11  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/main.o src/main.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} bin/frayon

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
