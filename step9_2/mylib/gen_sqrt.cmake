message(STATUS "this is gen cmd begin.")

add_executable(MakeTable MakeTable.cxx)

# add_custom_command(
# OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/table.h
# COMMAND ${CMAKE_COMMAND} -E echo "#include <iostream>  using namespace std; void display() {      std::cout << \"this is demo.\" << std::endl;    }  " > table.h
# WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
# COMMENT "echo command and redirecting output to file" # 执行时的注释信息
# )

# add_custom_target(generate_table_h DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/table.h)
add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/table.h
    COMMAND MakeTable ${CMAKE_CURRENT_BINARY_DIR}/table.h
    DEPENDS MakeTable
)
message(STATUS "this is gen cmd end." )