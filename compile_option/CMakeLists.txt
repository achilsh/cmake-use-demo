cmake_minimum_required(VERSION 3.30.1)

project(compile_option_demo)

# ## cmake -D变量 可以通过下面方式来检查和获取变量的值。
# # use_mod 可以通过 cmake -DUSE_MOD=ON 或者 cmake -DUSE_MOD=OFF 来设置是否被定义，cmake .. 就是没有定义。
if(DEFINED USE_MOD)
    message(STATUS "define USE_MOD: " ${USE_MOD})

    # #进一步 cmake -D变量 中的变量值是否是 OFF
    if(USE_MOD STREQUAL OFF)
        message(STATUS "is off " ${USE_MOD})
    endif()

    # # 定义一个宏 USE_MOD_SRC，用于源码编译的编译选择。
    add_compile_definitions(USE_MOD_SRC=${USE_MOD})
else()
    message(STATUS "NOT DEFINE USE_MOD")
endif()

# ## 定义编译的选型，包括编译器的版本，优化选项，告警等级等，设置后将会影响到后续编译器。
add_compile_options(-std=c++14 -O0 -ggdb3)

aux_source_directory(${CMAKE_SOURCE_DIR} srcs)
add_executable(${PROJECT_NAME} ${srcs})