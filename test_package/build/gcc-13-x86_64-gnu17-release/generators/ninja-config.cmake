########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(ninja_FIND_QUIETLY)
    set(ninja_MESSAGE_MODE VERBOSE)
else()
    set(ninja_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/ninjaTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${ninja_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(ninja_VERSION_STRING "1.12.1")
set(ninja_INCLUDE_DIRS ${ninja_INCLUDE_DIRS_RELEASE} )
set(ninja_INCLUDE_DIR ${ninja_INCLUDE_DIRS_RELEASE} )
set(ninja_LIBRARIES ${ninja_LIBRARIES_RELEASE} )
set(ninja_DEFINITIONS ${ninja_DEFINITIONS_RELEASE} )


# Only the last installed configuration BUILD_MODULES are included to avoid the collision
foreach(_BUILD_MODULE ${ninja_BUILD_MODULES_PATHS_RELEASE} )
    message(${ninja_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


