cmake_minimum_required(VERSION 3.18)
project(jsengine VERSION 1.7 LANGUAGES C)

add_library(jsengine STATIC
	jsapi.c
	jsarena.c
	jsarray.c
	jsatom.c
	jsbool.c
	jscntxt.c
	jsdate.c
	jsdbgapi.c
	jsdhash.c
	jsdtoa.c
	jsemit.c
	jsexn.c
	jsfun.c
	jsgc.c
	jshash.c
	jsiter.c
	jslock.c
	jslog2.c
	jsmath.c
	jsnum.c
	jsobj.c
	jsopcode.c
	jsparse.c
	jsprf.c
	jsregexp.c
	jsscan.c
	jsscope.c
	jsscript.c
	jsstr.c
	jsutil.c
	jsxdrapi.c
	jsxml.c
	jsinterp.c
	jslong.c
	prmjtime.c
)

if (WIN32)

	target_compile_definitions( jsengine PRIVATE
		XP_WIN
		JSFILE
		EXPORT_JS_API
		_CRT_SECURE_NO_WARNINGS
		x86_64
		_WIN32
		_AMD64_

		
	)
	
	target_compile_options( jsengine PRIVATE
		/W3
		/sdl-
		/wd4244 
		/wd4267 
		/wd4047
		/wd4146
		/wd4334
		/wd4311
		/WX-
		$<$<CONFIG:Release>:/O2>
	)
	
else()

	target_compile_definitions( jsengine PRIVATE
		XP_UNIX
		EXPORT_JS_API
		HAVE_VA_LIST_AS_ARRAY
		SVR4
		SYSV
		POSIX_SOURCE
		_DEFAULT_SOURCE
		HAVE_LOCALTIME_R
	)
	
	target_compile_options( jsengine PRIVATE
	
		-Wno-shift-negative-value
		-Wno-implicit-function-declaration
		-Wno-strict-prototypes
		-Wno-logical-not-parentheses
		-Wno-int-to-void-pointer-cast
		-Wno-pointer-to-int-cast
		-Wno-switch
		-Wno-incompatible-pointer-types
		-Wno-non-literal-null-conversion
	)
	if (APPLE)
		target_compile_options( jsengine PRIVATE
			$<$<CONFIG:Release>:-Os>
		)
	else()
		target_compile_options(jsengine PRIVATE
			$<$<CONFIG:Release>:-O2>
		)
	endif()
endif(WIN32)



