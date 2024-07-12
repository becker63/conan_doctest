# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(ninja_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(ninja_FRAMEWORKS_FOUND_RELEASE "${ninja_FRAMEWORKS_RELEASE}" "${ninja_FRAMEWORK_DIRS_RELEASE}")

set(ninja_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET ninja_DEPS_TARGET)
    add_library(ninja_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET ninja_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${ninja_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${ninja_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### ninja_DEPS_TARGET to all of them
conan_package_library_targets("${ninja_LIBS_RELEASE}"    # libraries
                              "${ninja_LIB_DIRS_RELEASE}" # package_libdir
                              "${ninja_BIN_DIRS_RELEASE}" # package_bindir
                              "${ninja_LIBRARY_TYPE_RELEASE}"
                              "${ninja_IS_HOST_WINDOWS_RELEASE}"
                              ninja_DEPS_TARGET
                              ninja_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "ninja"    # package_name
                              "${ninja_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${ninja_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET ninja::ninja
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${ninja_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${ninja_LIBRARIES_TARGETS}>
                 )

    if("${ninja_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET ninja::ninja
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     ninja_DEPS_TARGET)
    endif()

    set_property(TARGET ninja::ninja
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${ninja_LINKER_FLAGS_RELEASE}>)
    set_property(TARGET ninja::ninja
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${ninja_INCLUDE_DIRS_RELEASE}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET ninja::ninja
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Release>:${ninja_LIB_DIRS_RELEASE}>)
    set_property(TARGET ninja::ninja
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${ninja_COMPILE_DEFINITIONS_RELEASE}>)
    set_property(TARGET ninja::ninja
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${ninja_COMPILE_OPTIONS_RELEASE}>)

########## For the modules (FindXXX)
set(ninja_LIBRARIES_RELEASE ninja::ninja)
