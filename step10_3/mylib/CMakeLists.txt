
add_library(mylib SHARED  myFunc.cc)
## interface 说明任何依赖 Mylib或者链接myLib的目标都会包含该目录，除了mylib自身除外。
target_include_directories(mylib INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})

# # 设置静态库，动态库的输出路径
# set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}")
# set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}")
# set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}")


# 设置 构建动态库 的开关为 打开，  BUILD_SHARED_LIBS 告诉 add_library() 默认构建的是动态库。
option(BUILD_SHARED_LIBS "Build using shared libraries" ON)

## 编译时 选项; cmake -DUSE_LIB=ON ..
option(USE_LIB "use lib defined" OFF)

if (USE_LIB)
   

    ## private 是当前mylib 使用 USE_LIB 编译定义，
    ## 但是依赖myLib的其他属性或目标不在使用 USE_LIB 
    target_compile_definitions(mylib PRIVATE "USE_LIB") ##增加目标的编译定义。
    # Interface 是目标头文件编译时使用 USE_LIB

    # 生成一个头文件的cmake; 从文件或者module中加载并运行 cmake 代码。。
    include(gen_sqrt.cmake)

    # 生一个库，该库依赖源文件和 额外的头文件（不是在源码上定义的，而是中间生成的）
    add_library(sqrtlib SHARED mysqrt.cc ${CMAKE_CURRENT_BINARY_DIR}/table.h)
    
    # 设置 目标属性，这些属性将影响目标的构建
    set_target_properties(sqrtlib PROPERTIES
        POSITION_INDEPENDENT_CODE ${BUILD_SHARED_LIBS}
    )

    # 设置 sqrtlib库 依赖头文件 查找路径，用于查找 中间生成的头文件 table.h 
    target_include_directories(sqrtlib PRIVATE ${CMAKE_CURRENT_BINARY_DIR})

    # PRIVATE 标明 只有myLib 能使用 sqrtlib中的符号，其他连接到mylib的目标是不能
    # 使用 sqrlib中的符号；禁止 sqrtlib的符号 在链接传递。
    target_link_libraries(mylib PRIVATE sqrtlib)
    # INTERFACE的作用：interface是一种链接属性。当一个目标（可以是库或者可执行文件）以interface方式链接另一个库时，这个目标自身不会链接被链接库的实现部分，但会将该库的接口信息传递给依赖这个目标的其他目标。
endif()

set(installable_libs mylib)
if (TARGET sqrtlib)
    list(APPEND installable_libs sqrtlib)
endif()

# 把生成的库 安装到 lib目录下
install(TARGETS ${installable_libs} DESTINATION lib)# 将头文件安装 include 目录下
install(FILES myFunc.h DESTINATION include)

