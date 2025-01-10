cmake_minimum_required(VERSION 3.31.3)
project(step1 CXX)

## 创建一个动态库
add_library(callOneS SHARED common/callOne.cc)
# 给动态库设置输出名字 
set_target_properties(callOneS PROPERTIES OUTPUT_NAME "callOne")
# 在创建新的动态库名时，会清除其他使用这个名字的库
set_target_properties(callOneS PROPERTIES clean_direct_output 1)

## 创建一个静态库
add_library(callOneA  STATIC common/callOne.cc)
set_target_properties(callOneA PROPERTIES OUTPUT_NAME "callOne")
set_target_properties(callOneA PROPERTIES clean_direct_output 1)

# 链接目标文件和其他库，比如 step1Man 链接 callOneS 库 
# target_link_libraries(step1Man callOneS)

#包含头文件搜索路径
include_directories(${PROJECT_SOURCE_DIR}/common)

# 指定要生成的可执行文件和其源文件
add_executable(step1Man main.cc common/callOne.cc)

# 安装头文件 
install(FILES common/callOne.h DESTINATION ${PROJECT_SOURCE_DIR}/install/include)

# 安装文件
install(TARGETS callOneS callOneA LIBRARY DESTINATION ${PROJECT_SOURCE_DIR}/install/lib ARCHIVE DESTINATION ${PROJECT_SOURCE_DIR}/install/lib) 

## 查找指定目录下的源文件，把解结果存在 common_src 变量
aux_source_directory(${PROJECT_SOURCE_DIR} COMMON_SRC)
foreach(item ${COMMON_SRC})
    message(STATUS "item: ${item}") 
endforeach()

set(a "b" 2 3 4 5)

# 求 a 的长度
list(LENGTH a len)
message(STATUS "LEN: ${len}")
list(FIND a  2 index_value)
message(STATUS "index_value: ${index_value}")

foreach(item in LISTS ${a}) 
    message(STATUS "item: ${item}")
 
endforeach()

# set(A a;b;c d "1 2 3")

# foreach(x IN LISTS A) # #或者  foreach(x ${A})
#     message("x: ${x}")
# endforeach()
set(abc "sdfad")
message(STATUS, "${abc} ")
