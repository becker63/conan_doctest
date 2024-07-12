# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(conan_doctest_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(conan_doctest_FRAMEWORKS_FOUND_DEBUG "${conan_doctest_FRAMEWORKS_DEBUG}" "${conan_doctest_FRAMEWORK_DIRS_DEBUG}")

set(conan_doctest_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET conan_doctest_DEPS_TARGET)
    add_library(conan_doctest_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET conan_doctest_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${conan_doctest_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${conan_doctest_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:cmake::cmake;ninja::ninja>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### conan_doctest_DEPS_TARGET to all of them
conan_package_library_targets("${conan_doctest_LIBS_DEBUG}"    # libraries
                              "${conan_doctest_LIB_DIRS_DEBUG}" # package_libdir
                              "${conan_doctest_BIN_DIRS_DEBUG}" # package_bindir
                              "${conan_doctest_LIBRARY_TYPE_DEBUG}"
                              "${conan_doctest_IS_HOST_WINDOWS_DEBUG}"
                              conan_doctest_DEPS_TARGET
                              conan_doctest_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "conan_doctest"    # package_name
                              "${conan_doctest_NO_SONAME_MODE_DEBUG}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${conan_doctest_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Debug ########################################
    set_property(TARGET conan_doctest::conan_doctest
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Debug>:${conan_doctest_OBJECTS_DEBUG}>
                 $<$<CONFIG:Debug>:${conan_doctest_LIBRARIES_TARGETS}>
                 )

    if("${conan_doctest_LIBS_DEBUG}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET conan_doctest::conan_doctest
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     conan_doctest_DEPS_TARGET)
    endif()

    set_property(TARGET conan_doctest::conan_doctest
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Debug>:${conan_doctest_LINKER_FLAGS_DEBUG}>)
    set_property(TARGET conan_doctest::conan_doctest
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Debug>:${conan_doctest_INCLUDE_DIRS_DEBUG}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET conan_doctest::conan_doctest
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Debug>:${conan_doctest_LIB_DIRS_DEBUG}>)
    set_property(TARGET conan_doctest::conan_doctest
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Debug>:${conan_doctest_COMPILE_DEFINITIONS_DEBUG}>)
    set_property(TARGET conan_doctest::conan_doctest
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Debug>:${conan_doctest_COMPILE_OPTIONS_DEBUG}>)

########## For the modules (FindXXX)
set(conan_doctest_LIBRARIES_DEBUG conan_doctest::conan_doctest)
