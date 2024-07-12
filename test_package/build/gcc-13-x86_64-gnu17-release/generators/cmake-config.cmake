########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(cmake_FIND_QUIETLY)
    set(cmake_MESSAGE_MODE VERBOSE)
else()
    set(cmake_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/cmakeTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${cmake_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(cmake_VERSION_STRING "3.30.0")
set(cmake_INCLUDE_DIRS ${cmake_INCLUDE_DIRS_RELEASE} )
set(cmake_INCLUDE_DIR ${cmake_INCLUDE_DIRS_RELEASE} )
set(cmake_LIBRARIES ${cmake_LIBRARIES_RELEASE} )
set(cmake_DEFINITIONS ${cmake_DEFINITIONS_RELEASE} )


# Only the last installed configuration BUILD_MODULES are included to avoid the collision
foreach(_BUILD_MODULE ${cmake_BUILD_MODULES_PATHS_RELEASE} )
    message(${cmake_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()

