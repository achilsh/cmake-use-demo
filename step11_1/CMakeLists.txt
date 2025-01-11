cmake_minimum_required(VERSION 3.16)
project(Step2 VERSION 1.1)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)

# 设置 安装路径的前缀 cmake --install ./build --prefix "xxx" 其中xxx将替换CMAKE_INSTALL_PREFIX设置的值
set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/install)

add_subdirectory(mylib)

add_executable(step2 main.cc)

# # 可以删除掉 target_include_directories(step2 PULBIC ${CMAKE_SOURCE_DIR}/mylib)
target_link_libraries(step2 PUBLIC mylib)

# # 把二进制目标step2安装在 bin 目录中
install(TARGETS step2 DESTINATION bin)

# install(FILES "${PROJECT_BINARY_DIR}/xxx.h" DESTINATION include)

# # 真实的安装  生成的 mylibTargets.cmake 文件；其中 mylibTargets 为导出的名字。
# 安装一个 为依赖项目导出目标 的cmake文件； 生成和创建一个cmake文件，该文件包含了导入目标的所有代码。
install(EXPORT mylibTargets
    FILE mylibTargets.cmake
    DESTINATION lib/cmake/mylib
)

# 引用（引进） 创建配置文件的帮助函数的 模块。
include(CMakePackageConfigHelpers)

# # configure_package_config_file 就是 上面模块引入进来的。
configure_package_config_file(${CMAKE_CURRENT_SOURCE_DIR}/config.cmake.in
    "${CMAKE_CURRENT_BINARY_DIR}/mylibConfig.cmake"
    INSTALL_DESTINATION "lib/cmake/mylib"
    NO_SET_AND_CHECK_MACRO
    NO_CHECK_REQUIRED_COMPONENTS_MACRO
)

# # write_basic_package_version_file 也是 上面模块引进来的
write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/mylibConfigVersion.cmake"
    VERSION "${Step2_VERSION_MAJOR}.${Step2_VERSION_MINOR}"
    COMPATIBILITY AnyNewerVersion
)

# # 安装配置文件
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/mylibConfig.cmake
    ${CMAKE_CURRENT_BINARY_DIR}/mylibConfigVersion.cmake
    DESTINATION lib/cmake/mylib
)

# ## export-name 为 mylibTargets； 和 install(EXPORT mylibTargets 保持一致。
export(EXPORT mylibTargets
    FILE "${CMAKE_CURRENT_BINARY_DIR}/mylibConfigTargets.cmake"
)

include(InstallRequiredSystemLibraries)
set(CPACK_PACKAGE_VERSION_MAJOR "${Step2_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${Step2_VERSION_MINOR}")
set(CPACK_GENERATOR "TGZ")
set(CPACK_SOURCE_GENERATOR "TGZ") # # 只要运行cpack命令就可以打包 安装包# # cpack -G ZIP -C Debug  安装包# # cpack --config CPackSourceConfig.cmake 将源码打包
include(CPack)
