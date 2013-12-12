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
	${OBJECTDIR}/src/AStarContainer.o \
	${OBJECTDIR}/src/AStarNode.o \
	${OBJECTDIR}/src/Animation.o \
	${OBJECTDIR}/src/AnimationManager.o \
	${OBJECTDIR}/src/AnimationSet.o \
	${OBJECTDIR}/src/Avatar.o \
	${OBJECTDIR}/src/BehaviorAlly.o \
	${OBJECTDIR}/src/BehaviorStandard.o \
	${OBJECTDIR}/src/CampaignManager.o \
	${OBJECTDIR}/src/CombatText.o \
	${OBJECTDIR}/src/EffectManager.o \
	${OBJECTDIR}/src/Enemy.o \
	${OBJECTDIR}/src/EnemyBehavior.o \
	${OBJECTDIR}/src/EnemyGroupManager.o \
	${OBJECTDIR}/src/EnemyManager.o \
	${OBJECTDIR}/src/Entity.o \
	${OBJECTDIR}/src/EventManager.o \
	${OBJECTDIR}/src/FileParser.o \
	${OBJECTDIR}/src/FontEngine.o \
	${OBJECTDIR}/src/GameState.o \
	${OBJECTDIR}/src/GameStateConfig.o \
	${OBJECTDIR}/src/GameStateCutscene.o \
	${OBJECTDIR}/src/GameStateLoad.o \
	${OBJECTDIR}/src/GameStateNew.o \
	${OBJECTDIR}/src/GameStatePlay.o \
	${OBJECTDIR}/src/GameStateTitle.o \
	${OBJECTDIR}/src/GameSwitcher.o \
	${OBJECTDIR}/src/GetText.o \
	${OBJECTDIR}/src/Hazard.o \
	${OBJECTDIR}/src/HazardManager.o \
	${OBJECTDIR}/src/ImageManager.o \
	${OBJECTDIR}/src/InputState.o \
	${OBJECTDIR}/src/ItemManager.o \
	${OBJECTDIR}/src/ItemStorage.o \
	${OBJECTDIR}/src/Loot.o \
	${OBJECTDIR}/src/LootManager.o \
	${OBJECTDIR}/src/Map.o \
	${OBJECTDIR}/src/MapCollision.o \
	${OBJECTDIR}/src/MapRenderer.o \
	${OBJECTDIR}/src/Menu.o \
	${OBJECTDIR}/src/MenuActionBar.o \
	${OBJECTDIR}/src/MenuActiveEffects.o \
	${OBJECTDIR}/src/MenuCharacter.o \
	${OBJECTDIR}/src/MenuConfirm.o \
	${OBJECTDIR}/src/MenuEnemy.o \
	${OBJECTDIR}/src/MenuExit.o \
	${OBJECTDIR}/src/MenuHUDLog.o \
	${OBJECTDIR}/src/MenuInventory.o \
	${OBJECTDIR}/src/MenuItemStorage.o \
	${OBJECTDIR}/src/MenuLog.o \
	${OBJECTDIR}/src/MenuManager.o \
	${OBJECTDIR}/src/MenuMiniMap.o \
	${OBJECTDIR}/src/MenuNPCActions.o \
	${OBJECTDIR}/src/MenuPowers.o \
	${OBJECTDIR}/src/MenuStash.o \
	${OBJECTDIR}/src/MenuStatBar.o \
	${OBJECTDIR}/src/MenuTalker.o \
	${OBJECTDIR}/src/MenuVendor.o \
	${OBJECTDIR}/src/MessageEngine.o \
	${OBJECTDIR}/src/ModManager.o \
	${OBJECTDIR}/src/NPC.o \
	${OBJECTDIR}/src/NPCManager.o \
	${OBJECTDIR}/src/PowerManager.o \
	${OBJECTDIR}/src/QuestLog.o \
	${OBJECTDIR}/src/SDL_gfxBlitFunc.o \
	${OBJECTDIR}/src/SaveLoad.o \
	${OBJECTDIR}/src/Settings.o \
	${OBJECTDIR}/src/SharedGameResources.o \
	${OBJECTDIR}/src/SharedResources.o \
	${OBJECTDIR}/src/SoundManager.o \
	${OBJECTDIR}/src/StatBlock.o \
	${OBJECTDIR}/src/Stats.o \
	${OBJECTDIR}/src/TileSet.o \
	${OBJECTDIR}/src/TooltipData.o \
	${OBJECTDIR}/src/Utils.o \
	${OBJECTDIR}/src/UtilsDebug.o \
	${OBJECTDIR}/src/UtilsFileSystem.o \
	${OBJECTDIR}/src/UtilsParsing.o \
	${OBJECTDIR}/src/Widget.o \
	${OBJECTDIR}/src/WidgetButton.o \
	${OBJECTDIR}/src/WidgetCheckBox.o \
	${OBJECTDIR}/src/WidgetInput.o \
	${OBJECTDIR}/src/WidgetLabel.o \
	${OBJECTDIR}/src/WidgetListBox.o \
	${OBJECTDIR}/src/WidgetScrollBar.o \
	${OBJECTDIR}/src/WidgetScrollBox.o \
	${OBJECTDIR}/src/WidgetSlider.o \
	${OBJECTDIR}/src/WidgetSlot.o \
	${OBJECTDIR}/src/WidgetTabControl.o \
	${OBJECTDIR}/src/WidgetTooltip.o \
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
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/flare-engine

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/flare-engine: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/flare-engine ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/src/AStarContainer.o: src/AStarContainer.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/AStarContainer.o src/AStarContainer.cpp

${OBJECTDIR}/src/AStarNode.o: src/AStarNode.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/AStarNode.o src/AStarNode.cpp

${OBJECTDIR}/src/Animation.o: src/Animation.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/Animation.o src/Animation.cpp

${OBJECTDIR}/src/AnimationManager.o: src/AnimationManager.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/AnimationManager.o src/AnimationManager.cpp

${OBJECTDIR}/src/AnimationSet.o: src/AnimationSet.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/AnimationSet.o src/AnimationSet.cpp

${OBJECTDIR}/src/Avatar.o: src/Avatar.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/Avatar.o src/Avatar.cpp

${OBJECTDIR}/src/BehaviorAlly.o: src/BehaviorAlly.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/BehaviorAlly.o src/BehaviorAlly.cpp

${OBJECTDIR}/src/BehaviorStandard.o: src/BehaviorStandard.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/BehaviorStandard.o src/BehaviorStandard.cpp

${OBJECTDIR}/src/CampaignManager.o: src/CampaignManager.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/CampaignManager.o src/CampaignManager.cpp

${OBJECTDIR}/src/CombatText.o: src/CombatText.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/CombatText.o src/CombatText.cpp

${OBJECTDIR}/src/EffectManager.o: src/EffectManager.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/EffectManager.o src/EffectManager.cpp

${OBJECTDIR}/src/Enemy.o: src/Enemy.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/Enemy.o src/Enemy.cpp

${OBJECTDIR}/src/EnemyBehavior.o: src/EnemyBehavior.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/EnemyBehavior.o src/EnemyBehavior.cpp

${OBJECTDIR}/src/EnemyGroupManager.o: src/EnemyGroupManager.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/EnemyGroupManager.o src/EnemyGroupManager.cpp

${OBJECTDIR}/src/EnemyManager.o: src/EnemyManager.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/EnemyManager.o src/EnemyManager.cpp

${OBJECTDIR}/src/Entity.o: src/Entity.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/Entity.o src/Entity.cpp

${OBJECTDIR}/src/EventManager.o: src/EventManager.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/EventManager.o src/EventManager.cpp

${OBJECTDIR}/src/FileParser.o: src/FileParser.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/FileParser.o src/FileParser.cpp

${OBJECTDIR}/src/FontEngine.o: src/FontEngine.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/FontEngine.o src/FontEngine.cpp

${OBJECTDIR}/src/GameState.o: src/GameState.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/GameState.o src/GameState.cpp

${OBJECTDIR}/src/GameStateConfig.o: src/GameStateConfig.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/GameStateConfig.o src/GameStateConfig.cpp

${OBJECTDIR}/src/GameStateCutscene.o: src/GameStateCutscene.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/GameStateCutscene.o src/GameStateCutscene.cpp

${OBJECTDIR}/src/GameStateLoad.o: src/GameStateLoad.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/GameStateLoad.o src/GameStateLoad.cpp

${OBJECTDIR}/src/GameStateNew.o: src/GameStateNew.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/GameStateNew.o src/GameStateNew.cpp

${OBJECTDIR}/src/GameStatePlay.o: src/GameStatePlay.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/GameStatePlay.o src/GameStatePlay.cpp

${OBJECTDIR}/src/GameStateTitle.o: src/GameStateTitle.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/GameStateTitle.o src/GameStateTitle.cpp

${OBJECTDIR}/src/GameSwitcher.o: src/GameSwitcher.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/GameSwitcher.o src/GameSwitcher.cpp

${OBJECTDIR}/src/GetText.o: src/GetText.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/GetText.o src/GetText.cpp

${OBJECTDIR}/src/Hazard.o: src/Hazard.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/Hazard.o src/Hazard.cpp

${OBJECTDIR}/src/HazardManager.o: src/HazardManager.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/HazardManager.o src/HazardManager.cpp

${OBJECTDIR}/src/ImageManager.o: src/ImageManager.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/ImageManager.o src/ImageManager.cpp

${OBJECTDIR}/src/InputState.o: src/InputState.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/InputState.o src/InputState.cpp

${OBJECTDIR}/src/ItemManager.o: src/ItemManager.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/ItemManager.o src/ItemManager.cpp

${OBJECTDIR}/src/ItemStorage.o: src/ItemStorage.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/ItemStorage.o src/ItemStorage.cpp

${OBJECTDIR}/src/Loot.o: src/Loot.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/Loot.o src/Loot.cpp

${OBJECTDIR}/src/LootManager.o: src/LootManager.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/LootManager.o src/LootManager.cpp

${OBJECTDIR}/src/Map.o: src/Map.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/Map.o src/Map.cpp

${OBJECTDIR}/src/MapCollision.o: src/MapCollision.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/MapCollision.o src/MapCollision.cpp

${OBJECTDIR}/src/MapRenderer.o: src/MapRenderer.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/MapRenderer.o src/MapRenderer.cpp

${OBJECTDIR}/src/Menu.o: src/Menu.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/Menu.o src/Menu.cpp

${OBJECTDIR}/src/MenuActionBar.o: src/MenuActionBar.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/MenuActionBar.o src/MenuActionBar.cpp

${OBJECTDIR}/src/MenuActiveEffects.o: src/MenuActiveEffects.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/MenuActiveEffects.o src/MenuActiveEffects.cpp

${OBJECTDIR}/src/MenuCharacter.o: src/MenuCharacter.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/MenuCharacter.o src/MenuCharacter.cpp

${OBJECTDIR}/src/MenuConfirm.o: src/MenuConfirm.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/MenuConfirm.o src/MenuConfirm.cpp

${OBJECTDIR}/src/MenuEnemy.o: src/MenuEnemy.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/MenuEnemy.o src/MenuEnemy.cpp

${OBJECTDIR}/src/MenuExit.o: src/MenuExit.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/MenuExit.o src/MenuExit.cpp

${OBJECTDIR}/src/MenuHUDLog.o: src/MenuHUDLog.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/MenuHUDLog.o src/MenuHUDLog.cpp

${OBJECTDIR}/src/MenuInventory.o: src/MenuInventory.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/MenuInventory.o src/MenuInventory.cpp

${OBJECTDIR}/src/MenuItemStorage.o: src/MenuItemStorage.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/MenuItemStorage.o src/MenuItemStorage.cpp

${OBJECTDIR}/src/MenuLog.o: src/MenuLog.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/MenuLog.o src/MenuLog.cpp

${OBJECTDIR}/src/MenuManager.o: src/MenuManager.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/MenuManager.o src/MenuManager.cpp

${OBJECTDIR}/src/MenuMiniMap.o: src/MenuMiniMap.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/MenuMiniMap.o src/MenuMiniMap.cpp

${OBJECTDIR}/src/MenuNPCActions.o: src/MenuNPCActions.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/MenuNPCActions.o src/MenuNPCActions.cpp

${OBJECTDIR}/src/MenuPowers.o: src/MenuPowers.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/MenuPowers.o src/MenuPowers.cpp

${OBJECTDIR}/src/MenuStash.o: src/MenuStash.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/MenuStash.o src/MenuStash.cpp

${OBJECTDIR}/src/MenuStatBar.o: src/MenuStatBar.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/MenuStatBar.o src/MenuStatBar.cpp

${OBJECTDIR}/src/MenuTalker.o: src/MenuTalker.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/MenuTalker.o src/MenuTalker.cpp

${OBJECTDIR}/src/MenuVendor.o: src/MenuVendor.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/MenuVendor.o src/MenuVendor.cpp

${OBJECTDIR}/src/MessageEngine.o: src/MessageEngine.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/MessageEngine.o src/MessageEngine.cpp

${OBJECTDIR}/src/ModManager.o: src/ModManager.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/ModManager.o src/ModManager.cpp

${OBJECTDIR}/src/NPC.o: src/NPC.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/NPC.o src/NPC.cpp

${OBJECTDIR}/src/NPCManager.o: src/NPCManager.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/NPCManager.o src/NPCManager.cpp

${OBJECTDIR}/src/PowerManager.o: src/PowerManager.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/PowerManager.o src/PowerManager.cpp

${OBJECTDIR}/src/QuestLog.o: src/QuestLog.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/QuestLog.o src/QuestLog.cpp

${OBJECTDIR}/src/SDL_gfxBlitFunc.o: src/SDL_gfxBlitFunc.c 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/SDL_gfxBlitFunc.o src/SDL_gfxBlitFunc.c

${OBJECTDIR}/src/SaveLoad.o: src/SaveLoad.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/SaveLoad.o src/SaveLoad.cpp

${OBJECTDIR}/src/Settings.o: src/Settings.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/Settings.o src/Settings.cpp

${OBJECTDIR}/src/SharedGameResources.o: src/SharedGameResources.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/SharedGameResources.o src/SharedGameResources.cpp

${OBJECTDIR}/src/SharedResources.o: src/SharedResources.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/SharedResources.o src/SharedResources.cpp

${OBJECTDIR}/src/SoundManager.o: src/SoundManager.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/SoundManager.o src/SoundManager.cpp

${OBJECTDIR}/src/StatBlock.o: src/StatBlock.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/StatBlock.o src/StatBlock.cpp

${OBJECTDIR}/src/Stats.o: src/Stats.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/Stats.o src/Stats.cpp

${OBJECTDIR}/src/TileSet.o: src/TileSet.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/TileSet.o src/TileSet.cpp

${OBJECTDIR}/src/TooltipData.o: src/TooltipData.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/TooltipData.o src/TooltipData.cpp

${OBJECTDIR}/src/Utils.o: src/Utils.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/Utils.o src/Utils.cpp

${OBJECTDIR}/src/UtilsDebug.o: src/UtilsDebug.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/UtilsDebug.o src/UtilsDebug.cpp

${OBJECTDIR}/src/UtilsFileSystem.o: src/UtilsFileSystem.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/UtilsFileSystem.o src/UtilsFileSystem.cpp

${OBJECTDIR}/src/UtilsParsing.o: src/UtilsParsing.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/UtilsParsing.o src/UtilsParsing.cpp

${OBJECTDIR}/src/Widget.o: src/Widget.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/Widget.o src/Widget.cpp

${OBJECTDIR}/src/WidgetButton.o: src/WidgetButton.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/WidgetButton.o src/WidgetButton.cpp

${OBJECTDIR}/src/WidgetCheckBox.o: src/WidgetCheckBox.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/WidgetCheckBox.o src/WidgetCheckBox.cpp

${OBJECTDIR}/src/WidgetInput.o: src/WidgetInput.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/WidgetInput.o src/WidgetInput.cpp

${OBJECTDIR}/src/WidgetLabel.o: src/WidgetLabel.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/WidgetLabel.o src/WidgetLabel.cpp

${OBJECTDIR}/src/WidgetListBox.o: src/WidgetListBox.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/WidgetListBox.o src/WidgetListBox.cpp

${OBJECTDIR}/src/WidgetScrollBar.o: src/WidgetScrollBar.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/WidgetScrollBar.o src/WidgetScrollBar.cpp

${OBJECTDIR}/src/WidgetScrollBox.o: src/WidgetScrollBox.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/WidgetScrollBox.o src/WidgetScrollBox.cpp

${OBJECTDIR}/src/WidgetSlider.o: src/WidgetSlider.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/WidgetSlider.o src/WidgetSlider.cpp

${OBJECTDIR}/src/WidgetSlot.o: src/WidgetSlot.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/WidgetSlot.o src/WidgetSlot.cpp

${OBJECTDIR}/src/WidgetTabControl.o: src/WidgetTabControl.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/WidgetTabControl.o src/WidgetTabControl.cpp

${OBJECTDIR}/src/WidgetTooltip.o: src/WidgetTooltip.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/WidgetTooltip.o src/WidgetTooltip.cpp

${OBJECTDIR}/src/main.o: src/main.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/main.o src/main.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/flare-engine

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
