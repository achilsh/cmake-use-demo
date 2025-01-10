cmake_minimum_required(VERSION "3.31.3")
project(HelloWorld VERSION 1.2)

set(CMAKE_CXX_STANDARD, 14)
set(CMAKE_CXX_STANDARD_REQUIRED, TRUE)

### 将源文件copy 成另外一个目标文件，目标文件的内容是源文件的修改内容。
configure_file(config.h.in config_ak.h)

add_executable(HelloWorld_ak hello-world.cxx)

target_include_directories(HelloWorld_ak PUBLIC "${CMAKE_CURRENT_BINARY_DIR}") # # PROJECT_BINARY_DIR

