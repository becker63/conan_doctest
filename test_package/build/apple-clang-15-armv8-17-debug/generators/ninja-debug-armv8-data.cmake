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
set(ninja_PACKAGE_FOLDER_DEBUG "/Users/becker/.conan2/p/b/ninja09a44cda4cfd0/p")
set(ninja_BUILD_MODULES_PATHS_DEBUG )


set(ninja_INCLUDE_DIRS_DEBUG )
set(ninja_RES_DIRS_DEBUG )
set(ninja_DEFINITIONS_DEBUG )
set(ninja_SHARED_LINK_FLAGS_DEBUG )
set(ninja_EXE_LINK_FLAGS_DEBUG )
set(ninja_OBJECTS_DEBUG )
set(ninja_COMPILE_DEFINITIONS_DEBUG )
set(ninja_COMPILE_OPTIONS_C_DEBUG )
set(ninja_COMPILE_OPTIONS_CXX_DEBUG )
set(ninja_LIB_DIRS_DEBUG )
set(ninja_BIN_DIRS_DEBUG "${ninja_PACKAGE_FOLDER_DEBUG}/bin")
set(ninja_LIBRARY_TYPE_DEBUG UNKNOWN)
set(ninja_IS_HOST_WINDOWS_DEBUG 0)
set(ninja_LIBS_DEBUG )
set(ninja_SYSTEM_LIBS_DEBUG )
set(ninja_FRAMEWORK_DIRS_DEBUG )
set(ninja_FRAMEWORKS_DEBUG )
set(ninja_BUILD_DIRS_DEBUG )
set(ninja_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(ninja_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${ninja_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${ninja_COMPILE_OPTIONS_C_DEBUG}>")
set(ninja_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${ninja_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${ninja_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${ninja_EXE_LINK_FLAGS_DEBUG}>")


set(ninja_COMPONENTS_DEBUG )