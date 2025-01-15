cmake_minimum_required(VERSION 3.30.1)

project(target_source_demo)
add_executable(${PROJECT_NAME} main.cc)

# 把目标对源文件分开添加
target_sources(${PROJECT_NAME} PUBLIC other_src.cc)
file(GLOB_RECURSE src_files "*.cc")

message(STATUS "" ${src_files})

# # 设置依赖的文件列表
target_sources(${PROJECT_NAME} PRIVATE src/demo.cc)

# # 设置 依赖的文件列表
target_sources(${PROJECT_NAME} PRIVATE ${src_files})

# #根据条件来编译源文件
if(CMAKE_BUILD_TYPE STREQUAL Debug)
    target_sources(${PROJECT_NAME} PRIVATE ${src/demo.cc})
else()
    target_sources(${PROJECT_NAME} PRIVATE ${src_files})
endif()