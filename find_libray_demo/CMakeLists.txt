cmake_minimum_required(VERSION 3.30.0)

project(find_library_demo VERSION 1.1)

file(GLOB srcs "*.cc" "*.cpp")
add_executable(${PROJECT_NAME} ${srcs})
