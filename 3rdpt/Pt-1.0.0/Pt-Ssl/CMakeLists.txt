# includes region
include_directories (.)
include_directories (openssl)

set (PT_SSL_SOURCES
     # OS dependent sources
     #./${JAM_OS_TYPE}/*.cpp 
     
     # common sources
     ./openssl/CertificateStoreImpl.cpp 
     ./openssl/Connection.cpp 
     ./openssl/ContextImpl.cpp 
     
     ./Certificate.cpp 
     ./CertificateStore.cpp 
     ./Context.cpp 
     ./SslError.cpp 
     ./StreamBuffer.cpp
)

# defines region
add_definitions (-DPT_SSL_API_EXPORT)

if (BUILD_DYNAMIC_LIB)
  add_definitions(-fPIC)
  add_library (PtSsl SHARED ${PT_SSL_SOURCES})
else ()
  add_library (PtSsl STATIC ${PT_SSL_SOURCES})
  set (PT_SSL_STATIC_LIBRARY -lPtSsl PARENT_SCOPE)
endif ()

# linked libraries region
set (PT_SSL_LINKED_LIBS 
     ${PT_STATIC_LIBRARY} 
     ${PT_SYSTEM_STATIC_LIBRARY}
     ${PT_NET_STATIC_LIBRARY}
)
                             
find_package(OpenSSL REQUIRED)
if (NOT OPENSSL_FOUND)
    Message (FATAL_ERROR "Couldn't find the OpenSSL libray. Please install it (+devs) otherwise I can not continue without it!")
else ()
    # TODO: don't we need to find the "Crypto++" library for '-lcrypto'
    list (APPEND PT_SSL_LINKED_LIBS -lssl -lcrypto)
endif ()

target_link_libraries (PtSsl ${PT_SSL_LINKED_LIBS})

add_dependencies(PtSsl PtNet)