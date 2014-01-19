# includes region
include_directories (.)

set (PT_HTTP_SOURCES
     # OS dependent sources
     #./${JAM_OS_TYPE}/*.cpp 
     
     # common sources
     ./Authorizer.cpp 
     ./Authenticator.cpp 
     ./Client.cpp 
     ./ClientImpl.cpp 
     ./Connection.cpp 
     ./HttpBuffer.cpp 
     ./HttpError.cpp 
     ./Message.cpp 
     ./Parser.cpp 
     ./Reply.cpp 
     ./Request.cpp 
     ./Responder.cpp 
     ./Server.cpp 
     ./ServerImpl.cpp 
     ./Service.cpp 
     ./Servlet.cpp
)

# defines region
add_definitions (-DPT_HTTP_API_EXPORT)

if (BUILD_DYNAMIC_LIB)
  add_definitions(-fPIC)
  add_library (PtHttp SHARED ${PT_HTTP_SOURCES})
else ()
  add_library (PtHttp STATIC ${PT_HTTP_SOURCES})
  set (PT_HTTP_STATIC_LIBRARY -lPtHttp PARENT_SCOPE)
endif ()

# linked libraries region
target_link_libraries (PtHttp 
                       ${PT_STATIC_LIBRARY} 
                       ${PT_SYSTEM_STATIC_LIBRARY}
                       ${PT_NET_STATIC_LIBRARY}
                       ${PT_SSL_STATIC_LIBRARY}
)

add_dependencies(PtHttp PtSsl)