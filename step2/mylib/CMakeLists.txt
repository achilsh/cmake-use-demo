# # 本层中的 CMakeLists.txt 可以使用上一层 CMakeLists.txt中定义的变量

add_library(demoCall SHARED demoLib.cxx)
add_library(demoCallS STATIC demoLib.cxx)