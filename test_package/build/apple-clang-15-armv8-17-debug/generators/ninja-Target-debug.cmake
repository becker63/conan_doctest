# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(ninja_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(ninja_FRAMEWORKS_FOUND_DEBUG "${ninja_FRAMEWORKS_DEBUG}" "${ninja_FRAMEWORK_DIRS_DEBUG}")

set(ninja_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET ninja_DEPS_TARGET)
    add_library(ninja_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET ninja_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${ninja_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${ninja_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### ninja_DEPS_TARGET to all of them
conan_package_library_targets("${ninja_LIBS_DEBUG}"    # libraries
                              "${ninja_LIB_DIRS_DEBUG}" # package_libdir
                              "${ninja_BIN_DIRS_DEBUG}" # package_bindir
                              "${ninja_LIBRARY_TYPE_DEBUG}"
                              "${ninja_IS_HOST_WINDOWS_DEBUG}"
                              ninja_DEPS_TARGET
                              ninja_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "ninja"    # package_name
                              "${ninja_NO_SONAME_MODE_DEBUG}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${ninja_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Debug ########################################
    set_property(TARGET ninja::ninja
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Debug>:${ninja_OBJECTS_DEBUG}>
                 $<$<CONFIG:Debug>:${ninja_LIBRARIES_TARGETS}>
                 )

    if("${ninja_LIBS_DEBUG}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET ninja::ninja
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     ninja_DEPS_TARGET)
    endif()

    set_property(TARGET ninja::ninja
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Debug>:${ninja_LINKER_FLAGS_DEBUG}>)
    set_property(TARGET ninja::ninja
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Debug>:${ninja_INCLUDE_DIRS_DEBUG}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET ninja::ninja
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Debug>:${ninja_LIB_DIRS_DEBUG}>)
    set_property(TARGET ninja::ninja
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Debug>:${ninja_COMPILE_DEFINITIONS_DEBUG}>)
    set_property(TARGET ninja::ninja
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Debug>:${ninja_COMPILE_OPTIONS_DEBUG}>)

########## For the modules (FindXXX)
set(ninja_LIBRARIES_DEBUG ninja::ninja)
