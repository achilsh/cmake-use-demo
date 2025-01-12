cmake_minimum_required(VERSION 3.30.0)

project(find_library_demo VERSION 1.1)

## mylib中 CMakeLists.txt 可以使用 上一层中定义的 变量。
add_subdirectory(mylib)

set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_SOURCE_DIR}/install")
## 获取源文件列表
file(GLOB srcs "*.cc" "*.cpp")
add_executable(${PROJECT_NAME} ${srcs})
