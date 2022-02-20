cmake_minimum_required(VERSION 3.20)
project(ProjectTemplate)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})

include(FetchContent)
include(project_warnings)
include(google_deps)

## Conan Packages
include(cmake/conan.cmake)
conan_cmake_run(CONANFILE conanfile.txt  # or relative build/conanfile.txt
        BASIC_SETUP CMAKE_TARGETS
        BUILD missing)
## Conan packages
if(EXISTS ${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    conan_basic_setup()
else()
    message(WARNING "The file conanbuildinfo.cmake doesn't exist, you have to run conan install first")
endif()
message("Conan Libs: ${CONAN_LIBS}")

add_library(ProjectTemplate src/ProjectTemplate.cpp)


add_executable(ProjectTemplateApp apps/main.cpp)

option(PACKAGE_TESTS "Build the tests" ON)
if(PACKAGE_TESTS)
    enable_testing()
    include(GoogleTest)
    add_subdirectory(tests)
endif()

option(PACKAGE_BENCHMARKS "Build the benchmarks" ON)
if(PACKAGE_BENCHMARKS)
    add_subdirectory(benchmarks)
endif()
