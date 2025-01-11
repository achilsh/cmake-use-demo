cmake_minimum_required(VERSION 3.30.0)
project(add_lib_import_dmeo VERSION 1.1)

# ## 指定新的动态库 mylibImport 是 从别的的动态库导入的。
add_library(mylibImport SHARED IMPORTED)

# # 设置 新的动态库实际的实际路径名，包括库名字
set_target_properties(mylibImport
    PROPERTIES IMPORTED_LOCATION "${CMAKE_CURRENT_SOURCE_DIR}/../mylib_gen/libmylib.so"
)

message(STATUS " ----> ${CMAKE_INCLUDE_PATH}")
add_executable(myLibImportDemo main.cc)

# #设置目标对这个新的动态库的依赖
target_link_libraries(myLibImportDemo PUBLIC mylibImport)

# #设置目标对这个新动态库对应头文件的路径名。
target_include_directories(myLibImportDemo PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/../mylib_gen/")
