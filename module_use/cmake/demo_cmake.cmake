message(STATUS "this is demo cmake file.")

#定义变量x1, 在include()的地方使用
set(x1 "ssss")

## 定义一个通用函数，在 include()地方处调用。
function(demoCalll inP1 outP2)   
    message(STATUS "call input p1: ${inP1}")
    ## 设置返回值
    set(${outP2} "this return value:${inP1}" ) ## PARENT_SCOPE
    # 返回函数调用返回值
    return(PROPAGATE ${outP2})
endfunction()