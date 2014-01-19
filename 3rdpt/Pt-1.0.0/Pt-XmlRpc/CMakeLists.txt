# includes region
include_directories (.)

set (PT_XML_RPC_SOURCES
     # OS dependent sources
     #./${JAM_OS_TYPE}/*.cpp 
     
     # common sources
     ./Client.cpp 
     ./Fault.cpp 
     ./Formatter.cpp 
     ./HttpClient.cpp 
     ./HttpResponder.cpp 
     ./HttpService.cpp 
     ./RemoteProcedure.cpp 
     ./Responder.cpp 
     ./ServiceDefinition.cpp
)

# defines region
add_definitions (-DPT_XMLRPC_API_EXPORT)

if (BUILD_DYNAMIC_LIB)
  add_definitions(-fPIC)
  add_library (PtXmlRpc SHARED ${PT_XML_RPC_SOURCES})
else ()
  add_library (PtXmlRpc STATIC ${PT_XML_RPC_SOURCES})
  set (PT_XML_RPC_STATIC_LIBRARY -lPtXmlRpc PARENT_SCOPE)
endif ()

# linked libraries region
target_link_libraries (PtXmlRpc 
                       ${PT_STATIC_LIBRARY} 
                       ${PT_SYSTEM_STATIC_LIBRARY}
                       ${PT_XML_STATIC_LIBRARY}
                       ${PT_NET_STATIC_LIBRARY}
                       ${PT_HTTP_STATIC_LIBRARY}
)

add_dependencies(PtXmlRpc Pt PtSystem PtXml PtNet PtHttp)