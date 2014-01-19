set (LIBJSON_SOURCES
     ./Source/internalJSONNode.cpp  
     ./Source/JSONAllocator.cpp 
     ./Source/JSONChildren.cpp 
     ./Source/JSONDebug.cpp 
     ./Source/JSONIterators.cpp 
     ./Source/JSONMemory.cpp 
     ./Source/JSONNode.cpp 
     ./Source/JSONNode_Mutex.cpp 
     ./Source/JSONPreparse.cpp 
     ./Source/JSONStream.cpp 
     ./Source/JSONValidator.cpp 
     ./Source/JSONWorker.cpp 
     ./Source/JSONWriter.cpp 
     ./Source/libjson.cpp
)

# definitions region
add_definitions (-ffast-math -fexpensive-optimizations -DNDEBUG)

add_library (json ${LIBJSON_SOURCES})

set (JSON_LIBRARY -ljson PARENT_SCOPE)