cmake_minimum_required(VERSION 3.18)
project(compression VERSION 1 LANGUAGES C)

add_library(compression STATIC
	adler32.c
	compress.c
	crc32.c
	deflate.c
	gzclose.c
	gzlib.c
	gzread.c
	gzwrite.c
	infback.c
	inffast.c
	inflate.c
	inftrees.c
	trees.c
	uncompr.c
	zutil.c	
)

if (WIN32)

	target_compile_definitions(compression PRIVATE
		WIN32
		_WINDOWS
		_CRT_SECURE_NO_DEPRECATE
		_CRT_NONSTDC_NO_DEPRECATE
		_LIB
		_AMD64_
	)
	
	target_compile_options( compression PRIVATE
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

	target_compile_definitions( compression PRIVATE
	)
	
	target_compile_options( compression PRIVATE
		
	)
	if (APPLE)
		target_compile_options( compression PRIVATE
			$<$<CONFIG:Release>:-Os>
		)
	else()
		target_compile_options(compression PRIVATE
			$<$<CONFIG:Release>:-O2>
		)
	endif(APPLE)
endif(WIN32)


