# # 本层中的 CMakeLists.txt 可以使用上一层 CMakeLists.txt中定义的变量


message(STATUS "..... build option.")
add_executable(mylibEx demo.cc)