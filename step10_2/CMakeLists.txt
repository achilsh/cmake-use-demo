cmake_minimum_required(VERSION 3.16)
project(Step2 VERSION 1.1)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)

# 设置 安装路径的前缀 cmake --install ./build --prefix "xxx" 其中xxx将替换CMAKE_INSTALL_PREFIX设置的值
set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/install)

add_subdirectory(mylib)

add_executable(step2 main.cc)

## 可以删除掉 target_include_directories(step2 PULBIC ${CMAKE_SOURCE_DIR}/mylib)
target_link_libraries(step2 PUBLIC mylib)

## 把二进制目标step2安装在 bin 目录中
install(TARGETS step2 DESTINATION bin)
# install(FILES "${PROJECT_BINARY_DIR}/xxx.h" DESTINATION include)

include(InstallRequiredSystemLibraries)
set(CPACK_PACKAGE_VERSION_MAJOR "${Step2_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${Step2_VERSION_MINOR}")
set(CPACK_GENERATOR "TGZ")
set(CPACK_SOURCE_GENERATOR "TGZ")

## 只要运行cpack命令就可以打包 安装包
## cpack -G ZIP -C Debug  安装包
## cpack --config CPackSourceConfig.cmake 将源码打包
include(CPack)
