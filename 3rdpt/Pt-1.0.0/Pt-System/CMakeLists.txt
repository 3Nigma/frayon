
# includes region
include_directories (.)
include_directories (${JAM_OS_TYPE})

set (PT_SYSTEM_SOURCES
     # OS dependent sources
     ./${JAM_OS_TYPE}/MainLoopImpl.cpp 
     ./${JAM_OS_TYPE}/Selector.cpp 
     ./${JAM_OS_TYPE}/IODeviceImpl.cpp 
     ./${JAM_OS_TYPE}/ConditionImpl.cpp 
     ./${JAM_OS_TYPE}/ClockImpl.cpp 
     ./${JAM_OS_TYPE}/SemaphoreImpl.cpp 
     ./${JAM_OS_TYPE}/MutexImpl.cpp 
     ./${JAM_OS_TYPE}/DirectoryImpl.cpp 
     ./${JAM_OS_TYPE}/PipeImpl.cpp 
     ./${JAM_OS_TYPE}/FileDeviceImpl.cpp 
     ./${JAM_OS_TYPE}/ApplicationImpl.cpp 
     ./${JAM_OS_TYPE}/SerialDeviceImpl.cpp 
     ./${JAM_OS_TYPE}/ThreadImpl.cpp 
     ./${JAM_OS_TYPE}/ProcessImpl.cpp 
     ./${JAM_OS_TYPE}/LibraryImpl.cpp 

     # common sources
     ./Application.cpp 
     ./Clock.cpp 
     ./Condition.cpp 
     ./Directory.cpp 
     ./EventSource.cpp 
     ./EventSink.cpp 
     ./EventLoop.cpp 
     ./FileDevice.cpp 
     ./FileInfo.cpp 
     ./IOBuffer.cpp 
     ./IODevice.cpp 
     ./IOError.cpp 
     ./Library.cpp 
     ./Logger.cpp 
     ./LogManager.cpp 
     ./LogTarget.cpp 
     ./MainLoop.cpp 
     ./Mutex.cpp 
     ./Pipe.cpp 
     ./Process.cpp 
     ./Selectable.cpp 
     ./SerialDevice.cpp 
     ./Semaphore.cpp 
     ./SystemError.cpp 
     ./Thread.cpp 
     ./Timer.cpp 
     ./Uri.cpp 
     ./ConsoleChannel.cpp 
     ./FileChannel.cpp 
     ./SerialChannel.cpp 
)

# defines region
add_definitions (-DPT_SYSTEM_API_EXPORT)


if (BUILD_DYNAMIC_LIB)
  add_definitions(-fPIC)
  add_library (PtSystem SHARED ${PT_SYSTEM_SOURCES})
else ()
  add_library (PtSystem STATIC ${PT_SYSTEM_SOURCES})
  set (PT_SYSTEM_STATIC_LIBRARY -lPtSystem PARENT_SCOPE)
endif ()

target_link_libraries(PtSystem ${PT_STATIC_LIBRARY} -ldl -lpthread)
add_dependencies(PtSystem Pt)