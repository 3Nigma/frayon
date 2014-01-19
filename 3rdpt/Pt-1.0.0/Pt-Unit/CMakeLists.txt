# includes region
include_directories (.)

set (PT_UNIT_SOURCES
     # OS dependent sources
     #./${JAM_OS_TYPE}/*.cpp 
     
     # common sources
     ./Application.cpp 
     ./Assertion.cpp 
     ./RegisterTest.cpp 
     ./Reporter.cpp 
     ./Test.cpp 
     ./TestCase.cpp 
     ./TestContext.cpp 
     ./TestProtocol.cpp 
     ./TestSuite.cpp  
)

# defines region
add_definitions (-DPT_UNIT_API_EXPORT)

if (BUILD_DYNAMIC_LIB)
  add_definitions(-fPIC)
  add_library (PtUnit SHARED ${PT_UNIT_SOURCES})
else ()
  add_library (PtUnit STATIC ${PT_UNIT_SOURCES})
  set (PT_UNIT_STATIC_LIBRARY -lPtUnit PARENT_SCOPE)
endif ()

# linked libraries region
target_link_libraries (PtUnit 
                       ${PT_STATIC_LIBRARY} 
)

add_dependencies(PtUnit Pt)