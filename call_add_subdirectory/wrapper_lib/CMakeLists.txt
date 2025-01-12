project(wrapper_mylib)

aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR} wrapper_mylib_srcs)
add_library(${PROJECT_NAME} SHARED ${wrapper_mylib_srcs})

# 设置编译build 阶段 库存储路径
set(LIBRARY_OUTPUT_PATH ${CMAKE_SOURCE_DIR}/lib)

# 设置目标依赖头文件的查找路径（编译和安装）
target_include_directories(${PROJECT_NAME} PUBLIC
    $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}>
    $<INSTALL_INTERFACE:include>)

# 设置目标依赖库的查找路径（编译和安装）
target_link_directories(
    ${PROJECT_NAME} PUBLIC
    $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/lib>
    $<INSTALL_INTERFACE:lib>
)

# # 设置库 依赖其他库（本项目的 其他编译的库）
target_link_libraries(${PROJECT_NAME} PUBLIC mylib)

# 设置动态库安装路径
set_target_properties(${PROJECT_NAME} PROPERTIES
    INSTALL_RPATH "../lib")

# 安装当前目标，就是安装当前库
install(TARGETS ${PROJECT_NAME} DESTINATION)
