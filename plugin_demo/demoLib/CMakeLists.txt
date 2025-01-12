# # 本层中的 CMakeLists.txt 可以使用上一层 CMakeLists.txt中定义的变量

add_library(demoCall INTERFACE)
target_include_directories(demoCall INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})


add_library(mylibImpl SHARED myImpl.cxx)
target_link_libraries(demoCall INTERFACE mylibImpl)

