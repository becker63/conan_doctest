cmake_minimum_required(VERSION 3.15)
project(PackageTest CXX)

cmake_policy(SET CMP0144 OLD)

find_package(conan_doctest CONFIG REQUIRED)

find_package(doctest REQUIRED)

add_executable(doctest_config src/doctest_config.cpp)
target_link_libraries(doctest_config doctest::doctest)
