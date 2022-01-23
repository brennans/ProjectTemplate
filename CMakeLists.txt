cmake_minimum_required(VERSION 3.20)
project(ProjectTemplate)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})


add_executable(ProjectTemplate main.cpp)
