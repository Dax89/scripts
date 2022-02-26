#! /bin/python3

from pathlib import Path
import urllib.request

CMAKELISTS_TEMPLATE = """
cmake_minimum_required(VERSION 3.11 FATAL_ERROR)
project(:projectname: LANGUAGES CXX)

option(ENABLE_TESTS "Enable Unit Testing" ON)
option(ENABLE_ASAN "Enable Address Sanitizer" OFF)

# set(CPM_USE_LOCAL_PACKAGES ON)
include(cmake/CPM.cmake) # https://github.com/TheLartians/CPM.cmake

# CPMAddPackage("uri#tag")

# CPMAddPackage(
#     NAME
#     GIT_REPOSITORY
#     GIT_TAG
#     VERSION
#     OPTIONS
#     )

file(GLOB_RECURSE INCLUDES CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/include/*.h")
file(GLOB_RECURSE SOURCES CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")

add_:projecttype:(${PROJECT_NAME} ${INCLUDES} ${SOURCES})

set_target_properties(
    ${PROJECT_NAME} PROPERTIES
    CXX_STANDARD 17
    )

target_include_directories(
  ${PROJECT_NAME} PUBLIC
  $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>
)

if(CMAKE_BUILD_TYPE MATCHES "Debug") # Enforce warnings as errors if not in Release mode
    if(MSVC)
        target_compile_options(${PROJECT_NAME} PUBLIC /W3 /WX /permissive)
        if(ENABLE_ASAN)
            target_compile_options(${PROJECT_NAME} PRIVATE /fsanitize=address)
        endif()
    else()
        target_compile_options(${PROJECT_NAME} PUBLIC -Wall -Werror -Wextra -Wno-error=extra -Wshadow -pedantic)
        if(ENABLE_ASAN)
            target_compile_options(${PROJECT_NAME} PRIVATE -fno-omit-frame-pointer -fsanitize=address)
            target_link_libraries(${PROJECT_NAME} PRIVATE -fsanitize=address)
        endif()
    endif()
endif()

if(ENABLE_TESTS)
    message(STATUS "Enabling unit tests")
    add_subdirectory("test")
endif()
"""

CMAKELISTS_TEMPLATE_TEST = """
cmake_minimum_required(VERSION 3.11)
project(:projectname:Test LANGUAGES CXX)

include(../cmake/CPM.cmake) # https://github.com/TheLartians/CPM.cmake

CPMAddPackage("gh:onqtam/doctest#v2.4.8")

file(GLOB_RECURSE SOURCES CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")

add_executable(${PROJECT_NAME} ${SOURCES})
target_link_libraries(${PROJECT_NAME} doctest::doctest)

target_include_directories(
  ${PROJECT_NAME}
  PUBLIC $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>
  PRIVATE doctest::doctest
)

if(CMAKE_BUILD_TYPE MATCHES "Debug") # Enforce warnings as errors if not in Release mode
    if(MSVC)
        target_compile_options(${PROJECT_NAME} PUBLIC /W3 /WX /permissive)
    else()
        target_compile_options(${PROJECT_NAME} PUBLIC -Wall -Werror -Wextra -Wno-error=extra -Wshadow -pedantic)
    endif()
endif()

include(${doctest_SOURCE_DIR}/scripts/cmake/doctest.cmake)
doctest_discover_tests(${PROJECT_NAME})
"""
MAIN_SOURCE = """
#include <iostream>

int main(int argc, char* argv[])
{
    std::cout << "Hello World" << std::endl;
    return 0;
}
"""

MAIN_SOURCE_TEST = """
#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <doctest/doctest.h>

TEST_CASE("Test Example")
{
    //TODO: Insert tests here
}
"""

class Project:
    name = ""
    type = ""

def write_template(filepath: Path, template: str, p: Project):
    wildcards = {":projectname:": p.name,
                 ":projecttype:": p.type}

    for w, v in wildcards.items():
        template = template.replace(w, v)

    with open(filepath, "w") as f:
        f.write(template)

def step_projectname(p: Project):
    while True:
        p.name = input("Project Name: ")
        if p.name: break

def step_projecttype(p: Project):
    while True:
        p.type = input("Project Type: ")
        if p.type: break

def step_projectsetup(p: Project):
    DIRS = ["src", "include", "test/src", "cmake"]
    path = Path(p.name)

    if path.exists(): raise Exception(f"Path '{p.name}' already exists")
    path.mkdir()
    for d in DIRS: Path(path, d).mkdir(parents=True)

    urllib.request.urlretrieve("https://github.com/cpm-cmake/CPM.cmake/releases/latest/download/get_cpm.cmake", Path(path, "cmake", "CPM.cmake"))
    write_template(Path(path, "CMakeLists.txt"), CMAKELISTS_TEMPLATE, p)
    write_template(Path(path, "test", "CMakeLists.txt"), CMAKELISTS_TEMPLATE_TEST, p)
    write_template(Path(path, "src", "main.cpp"), MAIN_SOURCE, p)
    write_template(Path(path, "test", "src", "main.cpp"), MAIN_SOURCE_TEST, p)

def main():
    STEPS = [step_projectname, step_projecttype, step_projectsetup]
    p = Project()

    for step in STEPS:
        step(p)

if __name__ == "__main__":
    main()
