cmake_minimum_required(VERSION 3.30.1)

project(target_source_demo)
add_executable(${PROJECT_NAME} main.cc)

# 把目标对源文件分开添加
target_sources(${PROJECT_NAME} PUBLIC other_src.cc)
target_sources(${PROJECT_NAME} PRIVATE src/demo.cc)