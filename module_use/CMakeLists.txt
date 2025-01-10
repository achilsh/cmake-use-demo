cmake_minimum_required(VERSION 3.30.0)
project(module_demo VERSION 1.1) 

## 设置模块加载路径目录
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

## 引用具体的模块，只需要模块名就可以，不需要文件后缀名。
include(demo_cmake)

message(STATUS ">>>>> call cmake variable: ${x1}")

demoCalll("111222333" xy)
message(STATUS ">>>> function ret vlaue: ${xy}")
add_executable(${PROJECT_NAME} main.cc)
