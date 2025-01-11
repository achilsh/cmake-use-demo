aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR} mylibSRC)
set(mylibName "mylib")
add_library(${mylibName} SHARED ${mylibSRC})

target_include_directories(${mylibName} INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
    $<INSTALL_INTERFACE:include>
)

install(TARGETS ${mylibName}
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
)
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/mylibFunc.h DESTINATION include)
