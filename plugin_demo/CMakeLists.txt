cmake_minimum_required(VERSION 3.31.3)
project(demoPlugin VERSION 1.1)

add_subdirectory(demoLib)
add_executable(demoPlugin main.cpp)
target_link_libraries(demoPlugin demoCall)
