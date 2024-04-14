cmake_minimum_required(VERSION 3.12)

project(imgui VERSION 1.90.5)

set(CMAKE_CXX_STANDARD 17)  # 20
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set (CMAKE_BUILD_TYPE "${PROJECT_BUILD_TYPE}" CACHE INTERNAL "" FORCE)

set(SRC_CPP 
    "imgui.cpp"
    "imgui_demo.cpp"
    "imgui_draw.cpp"
    "imgui_widgets.cpp"
    "imgui_tables.cpp"
    "backends/imgui_impl_opengl3.cpp"
    "backends/imgui_impl_glfw.cpp"
    "misc/cpp/imgui_stdlib.cpp"
)

set(H_CPP 
    "imgui_internal.h"
    "misc/cpp/imgui_stdlib.h"
)

set(PUBLIC_HEADERS 
    "imgui.h"
    "backends/imgui_impl_opengl3.h"
    "backends/imgui_impl_glfw.h"
)

add_library(${PROJECT_NAME} ${SRC_CPP} ${H_CPP} ${PUBLIC_HEADER})

target_compile_definitions(${PROJECT_NAME}
    PUBLIC
        IMGUI_IMPL_OPENGL_LOADER_GL3W=1
        # IMGUI_DISABLE_OBSOLETE_FUNCTIONS # to check for obsolete functions
        # IMGUI_USER_CONFIG="${PROJECT_SOURCE_DIR}/path/to/imconfig.h" # to use your own imconfig.h
)
target_include_directories(${PROJECT_NAME}
    PUBLIC
        "${CMAKE_CURRENT_SOURCE_DIR}"
        "${CMAKE_CURRENT_SOURCE_DIR}/backends"
)
target_link_libraries(${PROJECT_NAME}
    PUBLIC
        glfw
)
set_target_properties(${PROJECT_NAME}
    PROPERTIES
        PUBLIC_HEADER "${PUBLIC_HEADERS}"
)

install(
    TARGETS ${PROJECT_NAME}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)
