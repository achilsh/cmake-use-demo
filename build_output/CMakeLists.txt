cmake_minimum_required(VERSION 3.30.1)
project(build_output_demo)

message(STATUS "CMAKE_CURRENT_LIST_DIR: " ${CMAKE_CURRENT_LIST_DIR})
message(STATUS "CMAKE_CURRENT_SOURCE_DIR: " ${CMAKE_CURRENT_SOURCE_DIR})
add_subdirectory(s1)
include(cmake/utils.cmake)

# # 设置编译选项， 可以通过 cmake -DCMAKE_BUILD_TYPE=Debug .. 来覆盖 默认值 Release
# #  编译类型的选择值有：  Debug, Release, RelWithDebInfo and MinSizeRel,
set(CMAKE_BUILD_TYPE Release)

# # 设置二进制文件输出目录
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/bin)

# # 设置动态库文件输出目录
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/lib)

# # 设置静态库文件输出目录
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/lib)

add_executable(${PROJECT_NAME} main.cc)

add_library(mycall src.cc)

set_target_properties(${PROJECT_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/bin1")
set_target_properties(mycall PROPERTIES LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/lib1")
set_target_properties(mycall PROPERTIES ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/lib2")