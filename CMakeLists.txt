cmake_minimum_required(VERSION 3.15)
project(conan_doctest CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 17)
cmake_policy(SET CMP0144 OLD)

add_library(conan_doctest src/conan_doctest.cpp)
target_include_directories(conan_doctest PUBLIC include)

set_target_properties(conan_doctest PROPERTIES PUBLIC_HEADER "include/conan_doctest.h")
install(TARGETS conan_doctest)
