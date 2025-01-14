cmake_minimum_required(VERSION 3.30.0)
project(configure_file_demo)

# # 设置 test_enable 有效; 任何值都可以，只是一个开关； 作用： 使 test_enalbe 有效。这样 *.h.in中 #define test_enalbe; 否则就不会生成
set(test_enable 123)

# # 设置 test_enable 有效 值 ON（任何值都可以，ON 是有效，OFF是无效），只是一个开关； 作用： 使 test_enalbe 有效。这样 *.h.in中 #define test_enalbe; 否则就不会生成
option(test_enable "test switch" ON)

set(test_enable 123)

# # 设置 X_API 有效值 ON（任何值都可以，ON 是有效，OFF是无效），只是一个开关；作用： 使 X_API 有效。这样 *.h.in中 #define X_API;否则就不会生成
option(X_API "api able" ON)

message(STATUS "...-> ${CMAKE_CURRENT_LIST_DIR}")

# ############# 下面只针对 #cmakedefine01  ##########################################
# # 设置 test_tn 有效，作用：是 test_tn 宏有效， 这样 *.h.in 中就会生成 #define test_tn 1； 否则生成 #define test_tn 0
set(test_tn)

# # 设置 test_t1 有效，作用：是 test_t1 宏有效， 这样 *.h.in 中就会生成 #define test_t1 1； 否则生成 #define test_t1 0
set(test_t1 "x2")

# # 设置 test_t2 有效，作用：是 test_t2 宏有效， 这样 *.h.in 中就会生成 #define test_t2 1； 否则生成 #define test_t2 0
set(test_t2)

# # 设置 test_t3 有效，作用：是 test_t3 宏有效， 这样 *.h.in 中就会生成 #define test_t3 1； 否则生成 #define test_t3 0
set(test_t3 1)

# #####         下面只针对 #cmakedefine demo_str @demo_str@  #####################################
# # 设置 demo_str 值；如果值设置有效；作用 demo_str 的宏 有效，这样 *.h.in中会生成 #define demo_str set的值; 否则不会生成宏定义： #define demo_str
set(demo_str 1111)

configure_file(test_demo.h.in ${CMAKE_CURRENT_BINARY_DIR}/test_demo.h @ONLY) # ## 其中@ONLY 只针对 *.h.in中的 @var@ 有效替换

# # 设置宏编译选项默认值
option(USE_DEMO "switch on use demo" OFF)

# # 生成宏编译选项的源码
configure_file(src.h.in ${CMAKE_CURRENT_SOURCE_DIR}/src.h @ONLY)

# ##
set(X_NAMESPACE demo_ok_dd)
message(STATUS "-----> ${X_NAMESPACE}")

# ##
configure_file(namespace.h.in ${PROJECT_SOURCE_DIR}/namespace.h)

aux_source_directory(${CMAKE_SOURCE_DIR} srcS)
add_executable(${PROJECT_NAME} ${srcS})
