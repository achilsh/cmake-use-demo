cmake_minimum_required(VERSION 3.30)

project(add_custom_command_demo VERSION 1.1)

add_executable(add_custom_command_demo main.cc)
message(STATUS ">>> ${CMAKE_COMMAND}") # # 输出是 /usr/bin/cmake 说明该变量是 cmake 安装位置和他自己名字。

set(outputfile output.txt)

# add_custom_command(OUTPUT ${outputfile}
# COMMAND ${CMAKE_COMMAND} -E echo "xxxx" > ${outputfile} # ## COMMAND  /usr/bin/cmake  -E
# WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
# )

# # 自定义命令
add_custom_command(TARGET add_custom_command_demo PRE_BUILD
    COMMAND ${CMAKE_COMMAND} -E echo "xxxx" > ${outputfile} # ## COMMAND  /usr/bin/cmake  -E
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    COMMENT "run add custom command cmd."
)

# # 自定义一个目标来执行自定义命令， 其中target 是一个伪目标。
add_custom_target(test_run_demo ALL
    COMMAND ${CMAKE_COMMAND} -E echo "this is add custom_target demo" > ${CMAKE_CURRENT_BINARY_DIR}/XX.TXT
    COMMAND mkdir ./gg
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    DEPENDS add_custom_command_demo
    COMMENT "run test demo by cmd"
)

# # 或者在上面 add_custom_target()添加 DEPENDS 选项 add_custom_command_demo
# add_dependencies(test_run_demo add_custom_command_demo) # # 在构建 项目 add_custom_command_demo 前，先保证 伪目标被构建。