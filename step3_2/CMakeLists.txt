cmake_minimum_required(VERSION 3.16)
project(Step2 VERSION 1.1)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)

add_subdirectory(mylib)

add_executable(step2 main.cc)

## 可以删除掉 target_include_directories(step2 PULBIC ${CMAKE_SOURCE_DIR}/mylib)
target_link_libraries(step2 PUBLIC mylib)
