message(STATUS "Conan: Using CMakeDeps conandeps_legacy.cmake aggregator via include()")
message(STATUS "Conan: It is recommended to use explicit find_package() per dependency instead")

find_package(conan_doctest)
find_package(doctest)

set(CONANDEPS_LEGACY  conan_doctest::conan_doctest  doctest::doctest )