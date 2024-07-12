########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(ninja_COMPONENT_NAMES "")
if(DEFINED ninja_FIND_DEPENDENCY_NAMES)
  list(APPEND ninja_FIND_DEPENDENCY_NAMES )
  list(REMOVE_DUPLICATES ninja_FIND_DEPENDENCY_NAMES)
else()
  set(ninja_FIND_DEPENDENCY_NAMES )
endif()

########### VARIABLES #######################################################################
#############################################################################################
set(ninja_PACKAGE_FOLDER_RELEASE "/home/becker/.conan2/p/ninja78ae65fa622a3/p")
set(ninja_BUILD_MODULES_PATHS_RELEASE )


set(ninja_INCLUDE_DIRS_RELEASE )
set(ninja_RES_DIRS_RELEASE )
set(ninja_DEFINITIONS_RELEASE )
set(ninja_SHARED_LINK_FLAGS_RELEASE )
set(ninja_EXE_LINK_FLAGS_RELEASE )
set(ninja_OBJECTS_RELEASE )
set(ninja_COMPILE_DEFINITIONS_RELEASE )
set(ninja_COMPILE_OPTIONS_C_RELEASE )
set(ninja_COMPILE_OPTIONS_CXX_RELEASE )
set(ninja_LIB_DIRS_RELEASE )
set(ninja_BIN_DIRS_RELEASE "${ninja_PACKAGE_FOLDER_RELEASE}/bin")
set(ninja_LIBRARY_TYPE_RELEASE UNKNOWN)
set(ninja_IS_HOST_WINDOWS_RELEASE 0)
set(ninja_LIBS_RELEASE )
set(ninja_SYSTEM_LIBS_RELEASE )
set(ninja_FRAMEWORK_DIRS_RELEASE )
set(ninja_FRAMEWORKS_RELEASE )
set(ninja_BUILD_DIRS_RELEASE )
set(ninja_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(ninja_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${ninja_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${ninja_COMPILE_OPTIONS_C_RELEASE}>")
set(ninja_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${ninja_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${ninja_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${ninja_EXE_LINK_FLAGS_RELEASE}>")


set(ninja_COMPONENTS_RELEASE )