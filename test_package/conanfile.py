import os

from conan import ConanFile
from conan.tools.cmake import CMake, cmake_layout
from conan.tools.build import can_run
from conan.tools.files import download


class conan_doctestTestConan(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeDeps", "CMakeToolchain"

    def source(self):
            download(self, "https://raw.githubusercontent.com/doctest/doctest/master/doctest/doctest.h", "../include/doctest.h")


    def requirements(self):
        if(self.requires != None):
            self.requires(self.tested_reference_str)
            self.requires("doctest/2.4.11")

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()

    def layout(self):
        cmake_layout(self)

    def test(self):
        if can_run(self):
            if(self.cpp != None and self.cpp.build != None):
                cmd = os.path.join(self.cpp.build.bindir, "doctest_config")
                self.run(cmd, env="conanrun")
