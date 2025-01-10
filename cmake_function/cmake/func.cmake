message(STATUS "call func.cmake")  
function(listFiles DIR FILES)
    message(STATUS "list files in ${DIR}, store to ${FILES}")
     
    # 文件操作，将${DIR}目录中的所有文件（递归）存储到 srcs 变量中
    file(GLOB_RECURSE  srcs ${DIR}/*)

    ## 把 参数变量 FILES的作用域扩展到调用者，这样入参就像一个带指针的入参一样。类似返回值的效果。
    set(${FILES} ${srcs} PARENT_SCOPE)
endfunction()


function(callme)
    message(STATUS "call me function.")
endfunction()

## 定义一个宏， 无参数， 格式是： macro(宏名)  endmacro()
macro(callmeMacro)  
    message(STATUS "Call me macro.")
endmacro()

function(testParams a1 a2)  
    ## 传递给函数的所有参数个数。
    message(STATUS "func parameter nums: ${ARGC}")  

    message(STATUS "named parameters: ${a1}, ${a2}")
    ## 传递给函数的所有参数
    message(STATUS "all parameters: ${ARGV}")
    foreach(item ${ARGV})
        message(STATUS "parameter item: ${item}")
    endforeach()

    foreach(item IN LISTS ARGV)
        message(STATUS "->parameter item: ${item}")
    endforeach()

    message(STATUS "message undefined or unname parameters: ${ARGN}")
endfunction()


# function(testParsemeters) 
#     cmake_parse_arguments( )
# endfunction()

## 定义一个函数，有入参，也有返回值参数
function(funcWithReturn  parameter1  parameter2 retValue)
    set(${retValue} "message : ${parameter1} ${parameter2}" PARENT_SCOPE)
endfunction()


function(useParseArguments)
    message(-------------------)
    set(options DEBUG)
    set(one_value_kw TYPE VERSION)
    set(multi_values_kw DEPENDS)
    cmake_parse_arguments(
        MYLIB 
        "${options}"
        "${one_value_kw}"
        "${multi_values_kw}"
        "${ARGN}"
    )

    message(STATUS "....${ARGN}")## 未命名的所有参数；就是.MyCustomLib;TYPE;SHARED;VERSION;1.0.0;DEPENDS;MyDependencyLib;DEBUG;src/file1.cpp;src/file2.cpp
    message(STATUS "other: ${MYLIB_UNPARSED_ARGUMENTS}")
    # 根据参数构建库
    if(MYLIB_DEBUG)
        message("--->Building library in debug mode.")
        add_definitions(-g)
    endif()

    
    if(MYLIB_TYPE STREQUAL "SHARED")
        message("...... ${MYLIB_TYPE}, ${MYLIB_UNPARSED_ARGUMENTS} ")
        # add_library(${MYLIB_UNPARSED_ARGUMENTS} SHARED)
    elseif(MYLIB_TYPE STREQUAL "STATIC")
        add_library(${MYLIB_UNPARSED_ARGUMENTS} STATIC)
    else()
        message(STATUS "Invalid library type. Must be SHARED or STATIC")
    endif()

    if(MYLIB_VERSION)
        message("--> version: ${MYLIB_VERSION}, ${MYLIB_UNPARSED_ARGUMENTS}")
        # set_target_properties(${MYLIB_UNPARSED_ARGUMENTS} PROPERTIES VERSION ${MYLIB_VERSION})
    endif()

    if(MYLIB_DEPENDS)
        message("++++depends: ${MYLIB_DEPENDS}, ${MYLIB_UNPARSED_ARGUMENTS}")
        # target_link_libraries(${MYLIB_UNPARSED_ARGUMENTS} ${MYLIB_DEPENDS})
    endif()

endfunction()

