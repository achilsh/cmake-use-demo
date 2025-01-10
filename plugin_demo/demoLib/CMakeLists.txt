add_library(demoCall INTERFACE)
target_include_directories(demoCall INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})


add_library(mylibImpl SHARED myImpl.cxx)
target_link_libraries(demoCall INTERFACE mylibImpl)

