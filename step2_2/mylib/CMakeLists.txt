
add_library(mylib STATIC myFunc.cc)

## 编译时 选项; cmake -DUSE_LIB=ON ..
option(USE_LIB "use lib defined" OFF)

if (USE_LIB)
    ## private 是当前mylib 使用 USE_LIB 编译定义，
    ## 但是依赖myLib的其他属性或目标不在使用 USE_LIB 
    target_compile_definitions(mylib PRIVATE "USE_LIB") ##增加目标的编译定义。
    # Interface 是目标头文件编译时需要的依赖

    add_library(sqrtlib STATIC mysqrt.cc)
    # 
    target_link_libraries(mylib PRIVATE sqrtlib)
endif()

