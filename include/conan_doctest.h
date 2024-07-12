#pragma once

#include <vector>
#include <string>


#ifdef _WIN32
  #define CONAN_DOCTEST_EXPORT __declspec(dllexport)
#else
  #define CONAN_DOCTEST_EXPORT
#endif
