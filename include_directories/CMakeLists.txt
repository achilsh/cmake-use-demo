cmake_minimum_required(VERSION 3.16)
project(display VERSION 1.1)

## 把包含目录添加到 构建中
include_directories(${PROJECT_SOURCE_DIR}/include)

# 增加linker查找库路径
link_directories(${PROJECT_SOURCE_DIR}/lib)

add_executable(display src/demo.cc src/main.cc)



add_custom_command(
    TARGET display PRE_BUILD
    COMMAND ${CMAKE_COMMAND} -E echo "Build completed......." > ${CMAKE_CURRENT_BINARY_DIR}/output.txt
)

## 注释快方式: #[[ 里面可以是多行 ]]
set(demo_value "12313")

message(STATUS "cmake path:  ${CMAKE_COMMAND}  ${demo_value}" ON)

# 设置 CMAKE_LIBRARY_PATH 变量为 ${PROJECT_SOURCE_DIR}/lib
set(CMAKE_LIBRARY_PATH ${PROJECT_SOURCE_DIR}/lib)

# 从 ${CMAKE_LIBRARY_PATH} 中查找mylib, 查找的路径存放在 pathOfDemoLib
find_library(pathOfDemoLib mylib) ## find_library() 可以从系统路径查找mylib库，并返回mylib的路径。

# 如果查询到mylib 
if(pathOfDemoLib)
    # 把 mylib的库路径 添加到 linker 查询的路径中。
    link_directories(${pathOfDemoLib})
else() 
    message(STATUS "not find mylib path.")
endif()
