# # 本层中的 CMakeLists.txt 可以使用上一层 CMakeLists.txt中定义的变量


## 在当前目录下搜素 特定类型的源文件，将找到文件名存放到变量中;GLOB_RECURSE 表示递归查找
file(GLOB srcs "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp" "${CMAKE_CURRENT_SOURCE_DIR}/*.cc")
message(STATUS ">> find sources: ${srcs}")


add_library(myLib SHARED ${srcs})

## 设置动态库依赖 头文件的路径; 指定编译目标时使用的 include 的路径； include_directories() ,
## 这些 inlude的路径 存放到  INCLUDE_DIRECTORIES 变量中.
target_include_directories(myLib PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
    $<INSTALL_INTERFACE:include>)

include_directories(${CMAKE_CURRENT_SOURCE_DIR})
message(STATUS "--> ${INCLUDE_DIRECTORIES}")
set_target_properties(myLib PROPERTIES INSTALL_RPATH "../lib")

file(GLOB allFile "*.h" "*.cc")
message(STATUS "...>>>${allFile}")

# # 从allFile删除某个元素；内部元素指定必须要 绝对路径。
list(REMOVE_ITEM allFile "${CMAKE_CURRENT_SOURCE_DIR}/g.h")
message(STATUS "del: ${allFile} || OK")

# # 安装 myLib库 并导出 ，这样就会生成 *.cmake 文件； 将 myLib安装到导出目标  FindMyLib 上。
install(TARGETS myLib EXPORT FindMyLib
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin
)

# 导出库，通过 FILE 设置 导出名为 FindMyLib ; 安装目录是：   ${CMAKE_INSTALL_PREFIX}
install(EXPORT FindMyLib FILE FindmyLib.cmake DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/../install/) # # lib/cmake/myLib/# # 安装 头文件
install(FILES myLib.h g.h DESTINATION include)
