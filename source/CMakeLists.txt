cmake_minimum_required(VERSION 3.18)
project(uox3 VERSION 0.1 LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 17)

# *************************************************************************
# The basic executable we are making
# *************************************************************************

add_executable(uox3
	uox3.cpp
	uox3.h
	ai.cpp
	archive.cpp
	boats.cpp
	books.cpp
	cAccountClass.cpp
	calcfuncs.cpp
	cBaseobject.cpp
	cChar.cpp
	cConsole.cpp
	cDice.cpp
	cGuild.cpp
	CGump.cpp
	cHTMLSystem.cpp
	cItem.cpp
	CJSEngine.cpp
	CJSMapping.cpp
	cmdtable.cpp
	cMultiObj.cpp
	combat.cpp
	commands.cpp
	CPacketReceive.cpp
	CPacketSend.cpp
	cPlayerAction.cpp
	cRaces.cpp
	CResponse.cpp
	cScript.cpp
	cServerData.cpp
	cServerDefinitions.cpp
	cSocket.cpp
	cSpawnRegion.cpp
	cThreadQueue.cpp
	cVersionClass.cpp
	cWeather.cpp
	Dictionary.cpp
	dist.cpp
	effect.cpp
	EventTimer.cpp
	fileio.cpp
	findfuncs.cpp
	gumps.cpp
	house.cpp
	IP4Address.cpp
	items.cpp
	jail.cpp
	JSEncapsulate.cpp
	lineofsight.cpp
	magic.cpp
	mapstuff.cpp
	movement.cpp
	msgboard.cpp
	MultiMul.cpp
	network.cpp
	npcs.cpp
	ObjectFactory.cpp
	osunique.cpp
	PartySystem.cpp
	pcmanage.cpp
	quantityfuncs.cpp
	queue.cpp
	regions.cpp
	scriptc.cpp
	SEFunctions.cpp
	skills.cpp
	sound.cpp
	speech.cpp
	ssection.cpp
	StringUtility.cpp
	targeting.cpp
	TimeUtility.cpp
	townregion.cpp
	trade.cpp
	UOPData.cpp
	UOXJSMethods.cpp
	UOXJSPropertyFuncs.cpp
	vendor.cpp
	weight.cpp
	wholist.cpp
	worldmain.cpp
	books.h
	cAccountClass.h
	cBaseObject.h
	cChar.h
	cConsole.h
	cdice.h
	cEffects.h
	cGuild.h
	cHTMLSystem.h
	cItem.h
	CJSEngine.h
	CJSMapping.h
	classes.h
	cMagic.h
	cmdtable.h
	cMultiObj.h
	combat.h
	commands.h
	ConfigOS.h
	CPacketReceive.h
	CPacketSend.h
	cRaces.h
	CResponse.h
	cScript.h
	cServerData.h
	cServerDefinitions.h
	cSkillClass.h
	cSocket.h
	cSpawnRegion.h
	cThreadQueue.h
	cVersionClass.h
	Dictionary.h
	enums.h
	funcdecl.h
	GenericList.h
	gump.h
	jail.h
	JSEncapsulate.h
	magic.h
	mapclasses.h
	mapstuff.h
	msgboard.h
	network.h
	ObjectFactory.h
	PageVector.h
	PartySystem.h
	power.h
	Prerequisites.h
	regions.h
	scriptc.h
	SEFunctions.h
	skills.h
	speech.h
	ssection.h
	teffect.h
	townregion.h
	typedefs.h
	UOXJSClasses.h
	UOXJSMethods.h
	UOXJSPropertyEnums.h
	UOXJSPropertyFuncs.h
	UOXJSPropertySpecs.h
	UOXStdHeaders.h
	uoxstruct.h
	weight.h
	wholist.h
	worldmain.h
	$<$<STREQUAL:${CMAKE_SYSTEM_NAME},Windows>:${PROJECT_SOURCE_DIR}/../assets/uox3.rc>
)

# *************************************************************************
# Platform specific settings
# *************************************************************************

if (WIN32)
set (CMAKE_RC_STANDARD_INCLUDE_DIRECTORIES ${PROJECT_SOURCE_DIR}/../assets/)
	
target_compile_definitions(uox3 PRIVATE
		WIN32
		_WINDOWS
		EXPORT_JS_API
		_SILENCE_CXX17_CODECVT_HEADER_DEPRECATION_WARNING
		_CRT_NO_VA_START_VALIDATION
		_CRT_SECURE_NO_DEPRECATE
		_CRT_NONSTDC_NO_DEPRECATE
		_CONSOLE
		$<$<CONFIG:Release>:NDEBUG>
		$<$<CONFIG:Debug>:_DEBUG>
		$<$<CONFIG:Debug>:_ALLOW_ITERATOR_DEBUG_LEVEL_MISMATCH>
	)
	
	target_compile_options( uox3 PRIVATE
		/J
		$<$<CONFIG:Release>:/O2>
	)
else()

	target_compile_definitions( uox3 PRIVATE
		EXPORT_JS_API
		$<$<CONFIG:Debug>:_DEBUG>
	)
	
	target_compile_options( uox3 PRIVATE
		-funsigned-char
		 -Wno-shift-negative-value
	)
	if (APPLE)
		target_compile_options( uox3 PRIVATE
			$<$<CONFIG:Release>:-Os>
		)
	else()
		target_compile_options(uox3 PRIVATE
			$<$<CONFIG:Release>:-O2>
		)
	endif(APPLE)
endif(WIN32)



# *************************************************************************
# the directories we need on the include path
# *************************************************************************

target_include_directories(uox3
	PUBLIC
		${PROJECT_SOURCE_DIR}/../spidermonkey
		${PROJECT_SOURCE_DIR}/../zlib
)

# *************************************************************************
# The libraries we need
# *************************************************************************
target_link_libraries(uox3 PRIVATE
	jsengine
	zlib 
	$<$<PLATFORM_ID:Windows>:ws2_32>
	$<$<PLATFORM_ID:Windows>:Kernel32>
	$<$<PLATFORM_ID:Linux>:pthread>
)

# *************************************************************************
# The items we need built first
# *************************************************************************
add_subdirectory(${PROJECT_SOURCE_DIR}/../spidermonkey subproject/jsengine)
add_subdirectory(${PROJECT_SOURCE_DIR}/../zlib subproject/zlib)