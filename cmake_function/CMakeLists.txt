cmake_minimum_required(VERSION 3.31.0)
project(gen_more_lib_auto VERSION 0.1.0)

## 根据传入的库名和已有的源文件列表，生成库
function(addLibs name)   
    message(STATUS "add library ${name} src files: ${${name}_SRCS}")
    add_library(${name} SHARED ${${name}_SRCS})
    target_include_directories(${name} INTERFACE $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/${name}> $<INSTALL_INTERFACE:include>)  
endfunction()


## 函数的定义
function(printValues values) 
    # ${values} 是变量名； ${${values}} 是变量名的变量值
    message(STATUS "print ${values}: ${${values}}" )

    #变量记录所有记录
    foreach(item IN ITEMS ${${values}})
        message(STATUS "item: ${item}")
    endforeach()

endfunction()


set(testdemos "a" 1 2 3)
printValues(testdemos)

include(cmake/func.cmake)
callme()
callmeMacro()

# testParams(1 2)

testParams(1 2 "adfadfa" )

# 将lib1中的源文件存储到 lib1_SRCS 变量中
listFiles(${CMAKE_CURRENT_SOURCE_DIR}/lib1 lib1_SRCS)
# 将lib2中的源文件存储到 lib1_SRCS 变量中
listFiles(${CMAKE_CURRENT_SOURCE_DIR}/lib2 lib2_SRCS)

## 批量生成其他动态： 只要新建目录 libn ； 调用 listFiles(), addLibs(libn) 
message(STATUS "lib1_SRCS: ${lib1_SRCS}")
# message(STATUS "lib1_SRCS: ${lib2_SRCS}")

## 调用生成库
addLibs(lib1)
addLibs(lib2)

add_executable(${PROJECT_NAME} main.cc)
target_link_libraries(${PROJECT_NAME} lib1 lib2)

# 调用带返回值的函数
funcWithReturn(1  2  retv)

useParseArguments(MyCustomLib
    TYPE SHARED
    VERSION 1.0.0
    DEPENDS MyDependencyLib
    DEBUG
    src/file1.cpp src/file2.cpp
)