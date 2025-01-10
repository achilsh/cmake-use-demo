cmake_minimum_required(VERSION 3.16)
project(LibDemo VERSION 1.2 )

## cmake -DUSE_LIB=ON .. 设置一个选项
option(USE_LIB "if use mylib" OFF)

if (USE_LIB) 
    add_subdirectory(mylib)
    list(APPEND EXTRA_LIBS demoCall)
    list(APPEND EXTRA_INCLUDES "${PROJECT_SOURCE_DIR}/mylib")
endif()

# add_subdirectory(mylib)
add_executable(HelloWorld main.cpp)

# 目标链接库名。
# target_link_libraries(HelloWorld PUBLIC demoCall)#

# # 指定库的头文件位置; 将mylib 目录添加为包含目录,方便找到 库的头文件。
# target_include_directories(HelloWorld PUBLIC "${PROJECT_SOURCE_DIR}/mylib")

target_link_libraries(HelloWorld PUBLIC ${EXTRA_LIBS})
target_include_directories(HelloWorld PUBLIC ${EXTRA_INCLUDES})


