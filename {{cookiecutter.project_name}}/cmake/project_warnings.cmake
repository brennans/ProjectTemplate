add_library(project_warnings INTERFACE)
if (CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    # using Clang
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    # using GCC
    target_compile_options(project_warnings
            INTERFACE -Wall
            -Werror # treat all warnings as errors
            -Wextra # reasonable and standard
            -Wshadow # warn the user if a variable
            # declaration shadows one from a
            # parent context
            -Wnon-virtual-dtor # warn the user if a class
            # with virtual functions
            # has a non-virtual
            # destructor. This helps
            # catch hard to track down
            # memory errors
            -Wold-style-cast # warn for c-style casts
            -Wcast-align # warn for potential performance
            # problem casts
            -Wunused # warn on anything being unused
            -Woverloaded-virtual # warn if you overload
            # (not override) a
            # virtual function
            -Wpedantic # warn if non-standard C++ is used
            -Wconversion # warn on type conversions that
            # may lose data
            -Wsign-conversion # warn on sign conversions
            -Wnull-dereference # warn if a null
            # dereference is detected
            -Wdouble-promotion # warn if float is
            # implicit promoted to
            # double
            -Wformat=2 # warn on security issues around
            # functions that format output (ie
            # printf)
            )
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "Intel")
    # using Intel C++
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    # using Visual Studio C++
    string(REGEX REPLACE "[-/]W[1-4]" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4")
    add_definitions(-D_CRT_SECURE_NO_WARNINGS)
endif()