# include region
include_directories (include)
if (UNIX)
    set (JAM_OS_TYPE posix)
elseif (WIN32)
    set (JAM_OS_TYPE win32)
endif ()

# common definitions region
add_definitions(-DNDEBUG)

# build core components
add_subdirectory (Pt)
add_subdirectory (Pt-System)

# build extended components
include_directories (${CMAKE_CURRENT_SOURCE_DIR}/Pt-System/${JAM_OS_TYPE})
add_subdirectory (Pt-Unit)
add_subdirectory (Pt-Xml)
add_subdirectory (Pt-Net)
add_subdirectory (Pt-Ssl)
add_subdirectory (Pt-Http)
add_subdirectory (Pt-XmlRpc)