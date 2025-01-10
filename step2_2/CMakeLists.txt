cmake_minimum_required(VERSION 3.16)
project(Step2 VERSION 1.1)

add_subdirectory(mylib)

add_executable(step2 main.cc)

target_link_libraries(step2 PUBLIC mylib)
target_include_directories(step2 PUBLIC ${PROJECT_SOURCE_DIR}/mylib)
