cmake_minimum_required(VERSION 3.30.1)
project(demo_use_find_library VERSION 1.1)

# #  CMAKE_LIBRARY_PATH 是 find_library() 查找库的路径； 手动设置搜索的路径。
# set(CMAKE_LIBRARY_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../install/lib")

# # CMAKE_PREFIX_PATH 是 find_package(), find_program(), find_library(), find_file(), and find_path() commands.
# # Each command will add appropriate subdirectories (like bin, lib, or include) as specified in its own documentation
set(CMAKE_PREFIX_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../install")
message(STATUS "cmake library path: ${CMAKE_LIBRARY_PATH}")
find_library(mylibFile NAMES "libmylib.so" REQUIRED)
message(STATUS "find library path: ${mylibFile}")

if(mylibFile-NOTFOUND)
    message(STATUS "not find mylib path.")
else()
    message(STATUS "lib path: ${mylibFile}")
endif()

add_executable(${PROJECT_NAME} main.cc)
target_link_libraries(${PROJECT_NAME} PRIVATE ${mylibFile})

# # 在 CMAKE_PREFIX_PATH， CMAEK_INCLUDE_PATH 中 查找 特定文件路径
find_path(depend_include_dir "mylibFunc.h")
message(STATUS "mylibFunc.h path: ${depend_include_dir}")
target_include_directories(${PROJECT_NAME} PUBLIC "${depend_include_dir}")