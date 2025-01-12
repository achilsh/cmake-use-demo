cmake_minimum_required(VERSION 3.30.0)

project(testDemo)
set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_SOURCE_DIR}/install")

add_subdirectory(mylib)
add_subdirectory(wrapper_lib)

file(GLOB mainSRCS "*.cc" "*.cpp")
add_executable(${PROJECT_NAME} ${mainSRCS})

# 设置目标依赖库的查找路径（编译和安装）
target_link_directories(
    ${PROJECT_NAME} PUBLIC
    $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/lib>
    $<INSTALL_INTERFACE:lib>
)

# 设置目标依赖库的名字
target_link_libraries(${PROJECT_NAME} PUBLIC wrapper_mylib)

# 设置目标 依赖头文件搜索路径（编译和构建）
target_include_directories(${PROJECT_NAME} PUBLIC
    $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}>
    $<INSTALL_INTERFACE:include>)

# 设置目标依赖库安装的路径
set_target_properties(${PROJECT_NAME} PROPERTIES
    INSTALL_RPATH "../lib;${CMAKE_INSTALL_PREFIX}/lib")

# 安装目标
install(TARGETS ${PROJECT_NAME} DESTINATION)
