
# includes region
include_directories (.)
include_directories (${JAM_OS_TYPE})

set (PT_NET_SOURCES
     # OS dependent sources
     ./${JAM_OS_TYPE}/TcpSocketImpl.cpp 
     ./${JAM_OS_TYPE}/TcpServerImpl.cpp 
     ./${JAM_OS_TYPE}/AddrInfo.cpp 
     ./${JAM_OS_TYPE}/EndpointImpl.cpp 
     ./${JAM_OS_TYPE}/UdpSocketImpl.cpp 

     # common sources
     ./AddressInUse.cpp 
     ./Endpoint.cpp 
     ./TcpServer.cpp 
     ./TcpSocket.cpp 
     ./UdpSocket.cpp
)

# defines region
add_definitions (-DPT_NET_API_EXPORT)

if (BUILD_DYNAMIC_LIB)
  add_definitions (-fPIC)
  add_library (PtNet SHARED ${PT_NET_SOURCES})
else ()
  add_library (PtNet ${PT_NET_SOURCES})
  set (PT_NET_STATIC_LIBRARY -lPtNet PARENT_SCOPE)
endif ()

target_link_libraries (PtNet ${PT_STATIC_LIBRARY} ${PT_SYSTEM_STATIC_LIBRARY})
add_dependencies (PtNet PtSystem)