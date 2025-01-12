project(mylib)

aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR} mylibSRCS)
add_library(${PROJECT_NAME} SHARED ${mylibSRCS})

# 设置编译build 阶段 库存储路径
set(LIBRARY_OUTPUT_PATH ${CMAKE_SOURCE_DIR}/lib)

# 设置动态库安装路径
set_target_properties(${PROJECT_NAME} PROPERTIES
    INSTALL_RPATH "../lib")

# 安装当前目标，就是安装当前库
install(TARGETS ${PROJECT_NAME} DESTINATION)
