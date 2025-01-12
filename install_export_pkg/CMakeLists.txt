#### 
### 通过定义一个动态库，安装动态库，导出动态库。实现给其他project 通过 find_package(myLib REQUIRED) 来调用该动态库；在
##  在使用 find_package() 前需要设置 该库的安装路径，比如 set(CMAKE_MODULE_PATH "该库的安装路径中 *.cmake 的路径")
### 
cmake_minimum_required(VERSION 3.31.0)
project(test_my_Lib VERSION 1.0.0)

set(CMAKE_INSTALL_PREFIX ${CMAKE_CURRENT_SOURCE_DIR}/install)
if (NOT CMAKE_BUILD_TYPE)  
    set(CMAKE_BUILD_TYPE "Debug")  ## or Release
endif()

set(CMAKE_CXX_FLAGS "-w") # 忽略警告信息
set(CMAKE_CXX_FLAGS_DEBUG "-g -ggdb ${CMAKE_CXX_FLAGS}") # 设置DEBUG模式的编译选项

# #嵌套调用 其他cmake
add_subdirectory(myLib)
add_subdirectory(myLibEx EXCLUDE_FROM_ALL) # # EXCLUDE_FROM_ALL 排除编译 myLibEx 子目录； 如果需要编译该排除的目录，需要手动 手动 make myLibEx 

add_executable(${PROJECT_NAME} main.cc)
target_link_libraries(${PROJECT_NAME} myLib)
target_include_directories(${PROJECT_NAME} PUBLIC myLib)

## 设置二进制目标依赖动态库的相对路径； 该路径是二进制文件的上级目录下的 lib 目录。
set_target_properties(${PROJECT_NAME} PROPERTIES
    INSTALL_RPATH "../lib")

install(TARGETS ${PROJECT_NAME} DESTINATION bin)

# 导出库，通过 FILE 设置 导出名为 FindMyLib ; 安装目录是：   ${CMAKE_INSTALL_PREFIX}
# install(EXPORT FindMyLib FILE FindmyLib.cmake DESTINATION lib/cmake/myLib/)
     
