# includes region
include_directories (.)

set (PT_XML_SOURCES
     # OS dependent sources
     #./${JAM_OS_TYPE}/*.cpp 
     
     # common sources
     ./AttributeModel.cpp 
     ./AttributeListModel.cpp 
     ./ContentModel.cpp 
     ./ContentParticle.cpp 
     ./DocType.cpp 
     ./DocTypeDefinition.cpp 
     ./DocTypeValidator.cpp 
     ./ElementModel.cpp 
     ./Entity.cpp 
     ./InputSource.cpp 
     ./NamespaceContext.cpp 
     ./StartElement.cpp 
     ./XmlError.cpp 
     ./XmlFormatter.cpp 
     ./XmlReader.cpp 
     ./XmlSerializationContext.cpp 
     ./XmlWriter.cpp 
)

# defines region
add_definitions (-DPT_XML_API_EXPORT)

if (BUILD_DYNAMIC_LIB)
  add_definitions(-fPIC)
  add_library (PtXml SHARED ${PT_XML_SOURCES})
else ()
  add_library (PtXml STATIC ${PT_XML_SOURCES})
  set (PT_XML_STATIC_LIBRARY -lPtXml PARENT_SCOPE)
endif ()

# linked libraries region
target_link_libraries (PtXml 
                       ${PT_STATIC_LIBRARY} 
                       ${PT_SYSTEM_STATIC_LIBRARY}
)

add_dependencies(PtXml PtSystem)