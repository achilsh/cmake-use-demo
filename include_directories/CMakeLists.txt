cmake_minimum_required(VERSION 3.16)
project(display VERSION 1.1)

## 包含头文件搜索路径；是一个全局命令，
## 使用这个命令后，它会为后续所有的目标（包括可执行文件、静态库、动态库等）添加头文件搜索路径。
## 这种全局设置可能会影响到项目中的多个构建目标，使得它们都能够在指定的路径下查找头文件。
# 可以在项目第一层 CMakeLists.txt中，把所有的子目录中都包含进来，这样后续子目录中源码 #include "头文件.h" 
# 就会在 include_directories()中所有的子目录查找头文件。include_directories()中可以包含多个目录。
# 比如: include_directories(${PROJECT_NAME}/subDir1  ${PROJECT_NAME}/subDir2)
include_directories(${PROJECT_SOURCE_DIR}/include)

# 增加 linker 查找库文件路径； 一个全局命令，用于指定链接器查找库文件的目录路径。
# # 一旦使用了这个命令，在它之后添加的所有目标（包括可执行文件和库）在链接过程中，链接器都会在指定的目录中查找所需的库文件。
# # link_directories(dir1 dir2) 可以指定多个目录。比如将多个子目录添加到 库查找路径 中。
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
