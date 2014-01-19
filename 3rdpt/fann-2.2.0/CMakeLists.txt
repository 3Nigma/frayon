INCLUDE_DIRECTORIES (include)

ADD_DEFINITIONS(-D_REENTRANT)
if (WIN32)
    ADD_DEFINITIONS(-DFANN_DLL_EXPORTS)
endif (WIN32)

########### next target ###############
SET(floatfann_LIB_SRCS
floatfann.c
)

ADD_LIBRARY(floatfann SHARED ${floatfann_LIB_SRCS})

SET_TARGET_PROPERTIES(floatfann PROPERTIES VERSION ${VERSION} SOVERSION 2 )

########### next target ###############
SET(doublefann_LIB_SRCS
doublefann.c
)

ADD_LIBRARY(doublefann SHARED ${doublefann_LIB_SRCS})

SET_TARGET_PROPERTIES(doublefann PROPERTIES VERSION ${VERSION} SOVERSION 2 )

########### next target ###############
SET(fixedfann_LIB_SRCS
fixedfann.c
)

ADD_LIBRARY(fixedfann SHARED ${fixedfann_LIB_SRCS})

SET_TARGET_PROPERTIES(fixedfann PROPERTIES VERSION ${VERSION} SOVERSION 2 )

########### next target ###############
SET(fann_LIB_SRCS
floatfann.c
)

ADD_LIBRARY(fann SHARED ${fann_LIB_SRCS})

SET_TARGET_PROPERTIES(fann PROPERTIES VERSION ${VERSION} SOVERSION 2 )
