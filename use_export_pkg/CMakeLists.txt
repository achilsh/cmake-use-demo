cmake_minimum_required(VERSION 3.30.0)
project(test_pkg VERSION 1.0)

# /home/user/works/cmake_demo/install_export_pkg/install
# /home/user/works/cmake_demo/install_export_pkg/install/lib/cmake/myLib
set(CMAKE_INCLUDE_CURRENT_DIR ON)
include_directories(${CMAKE_CURRENT_SOURCE_DIR})
set(CMAKE_MODULE_PATH "/home/user/works/cmake_demo/install_export_pkg/install/")

## 查找包；调用 find_package() 
find_package(myLib REQUIRED)


include_directories(${CMAKE_MODULE_PATH}/include)
message(STATUS ">>> ${myLib}; ${myLib_INCLUDE_DIRS}, ${myLib_INCLUDE_DIR}, ${myLib_LIBRARY}")
get_target_property(H_FILE_DIR myLib INTERFACE_INCLUDE_DIRECTORIES)
get_target_property(LIB_DIR myLib  INTERFACE_LINK_LIBRARIES)
message(STATUS "include: ${H_FILE_DIR}, lib: ${LIB_DIR}")
foreach(m ${myLib_LIBS}) 
    message(STATUS "message:${}")
endforeach()
if (myLib_FOUND) 
    message("find myLib package.")
else() 
    message(STATUS  ", not find myLib package.")
endif()
add_executable(${PROJECT_NAME} main.cc)

# #添加头文件：
target_include_directories(${PROJECT_NAME}  PUBLIC  ${CMAKE_MODULE_PATH}/include)
target_link_libraries(${PROJECT_NAME} PUBLIC myLib)
target_include_directories(${PROJECT_NAME} PRIVATE ${H_FILE_DIR})
target_include_directories(${PROJECT_NAME} PUBLIC ${H_FILE_DIR})
