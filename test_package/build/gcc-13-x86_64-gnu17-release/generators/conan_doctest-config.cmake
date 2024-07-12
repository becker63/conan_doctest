########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(conan_doctest_FIND_QUIETLY)
    set(conan_doctest_MESSAGE_MODE VERBOSE)
else()
    set(conan_doctest_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/conan_doctestTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${conan_doctest_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(conan_doctest_VERSION_STRING "0.1")
set(conan_doctest_INCLUDE_DIRS ${conan_doctest_INCLUDE_DIRS_RELEASE} )
set(conan_doctest_INCLUDE_DIR ${conan_doctest_INCLUDE_DIRS_RELEASE} )
set(conan_doctest_LIBRARIES ${conan_doctest_LIBRARIES_RELEASE} )
set(conan_doctest_DEFINITIONS ${conan_doctest_DEFINITIONS_RELEASE} )


# Only the last installed configuration BUILD_MODULES are included to avoid the collision
foreach(_BUILD_MODULE ${conan_doctest_BUILD_MODULES_PATHS_RELEASE} )
    message(${conan_doctest_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


