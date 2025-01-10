file(GLOB srcs "*.cpp" "*.cc")
add_library(myLib SHARED ${srcs})

## 设置动态库依赖 头文件的路径
target_include_directories(myLib PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
    $<INSTALL_INTERFACE:include>)

set_target_properties(myLib PROPERTIES INSTALL_RPATH "../lib")

# # 安装 myLib库 并导出 ，这样就会生成 *.cmake 文件； 将 myLib安装到导出目标  FindMyLib 上。
install(TARGETS myLib EXPORT FindMyLib
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin
)

# 导出库，通过 FILE 设置 导出名为 FindMyLib ; 安装目录是：   ${CMAKE_INSTALL_PREFIX}
install(EXPORT FindMyLib FILE FindmyLib.cmake DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/../install/) # # lib/cmake/myLib/# # 安装 头文件
install(FILES myLib.h g.h DESTINATION include)