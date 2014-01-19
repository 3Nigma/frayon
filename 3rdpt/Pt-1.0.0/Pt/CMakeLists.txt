
include_directories (.)

set (PT_SOURCES
     ./Atomicity.cpp 
     ./Connection.cpp 
     ./Connectable.cpp 
     ./ConversionError.cpp 
     ./Date.cpp 
     ./DateTime.cpp 
     ./Deserializer.cpp 
     ./PageAllocator.cpp 
     ./PoolAllocator.cpp 
     ./Regex.cpp 
     ./regexp.cpp 
     ./SerializationError.cpp 
     ./SerializationInfo.cpp 
     ./Serializer.cpp 
     ./SerializationContext.cpp 
     ./Settings.cpp 
     ./SettingsReader.cpp 
     ./SettingsWriter.cpp 
     ./Signal.cpp 
     ./String.cpp 
     ./StringStream.cpp 
     ./TextBuffer.cpp 
     ./TextStream.cpp 
     ./Time.cpp 
     ./Utf8Codec.cpp 
     ./Utf16Codec.cpp 
     ./Utf32Codec.cpp
)

add_definitions(-DPT_API_EXPORT)

if (BUILD_DYNAMIC_LIB)
  add_definitions (-fPIC)
  add_library (Pt SHARED ${PT_SOURCES})
else ()
  add_library (Pt STATIC ${PT_SOURCES})
  set (PT_STATIC_LIBRARY -lPt PARENT_SCOPE)
endif ()