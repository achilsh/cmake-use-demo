cmake_minimum_required(VERSION 3.30.1)

project(use_lib_demo VERSION 1.1)

list(APPEND CMAKE_PREFIX_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../install/lib/cmake/mylib")
message(STATUS "--> ${CMAKE_PREFIX_PATH}; ${CMAKE_MODULE_PATH}")

find_package(mylib REQUIRED) 
message(STATUS "find_Pkg: ${mylib_FOUND}") ##标识是否找到 mylib 
message(STATUS "find include dir: ${mylib_INCLUDE_DIRS}")
message(STATUS "find_libs: ${mylib_LIBS}")

# mylibConfig.cmake
add_executable(${PROJECT_NAME} main.cc) 
target_link_libraries(${PROJECT_NAME} PUBLIC mylib)