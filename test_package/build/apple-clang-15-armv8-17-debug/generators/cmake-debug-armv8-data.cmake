########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(cmake_COMPONENT_NAMES "")
if(DEFINED cmake_FIND_DEPENDENCY_NAMES)
  list(APPEND cmake_FIND_DEPENDENCY_NAMES )
  list(REMOVE_DUPLICATES cmake_FIND_DEPENDENCY_NAMES)
else()
  set(cmake_FIND_DEPENDENCY_NAMES )
endif()

########### VARIABLES #######################################################################
#############################################################################################
set(cmake_PACKAGE_FOLDER_DEBUG "/Users/becker/.conan2/p/cmakee847bd239a979/p")
set(cmake_BUILD_MODULES_PATHS_DEBUG )


set(cmake_INCLUDE_DIRS_DEBUG )
set(cmake_RES_DIRS_DEBUG )
set(cmake_DEFINITIONS_DEBUG )
set(cmake_SHARED_LINK_FLAGS_DEBUG )
set(cmake_EXE_LINK_FLAGS_DEBUG )
set(cmake_OBJECTS_DEBUG )
set(cmake_COMPILE_DEFINITIONS_DEBUG )
set(cmake_COMPILE_OPTIONS_C_DEBUG )
set(cmake_COMPILE_OPTIONS_CXX_DEBUG )
set(cmake_LIB_DIRS_DEBUG )
set(cmake_BIN_DIRS_DEBUG "${cmake_PACKAGE_FOLDER_DEBUG}/CMake.app/Contents/bin")
set(cmake_LIBRARY_TYPE_DEBUG UNKNOWN)
set(cmake_IS_HOST_WINDOWS_DEBUG 0)
set(cmake_LIBS_DEBUG )
set(cmake_SYSTEM_LIBS_DEBUG )
set(cmake_FRAMEWORK_DIRS_DEBUG )
set(cmake_FRAMEWORKS_DEBUG )
set(cmake_BUILD_DIRS_DEBUG )
set(cmake_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(cmake_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${cmake_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${cmake_COMPILE_OPTIONS_C_DEBUG}>")
set(cmake_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${cmake_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${cmake_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${cmake_EXE_LINK_FLAGS_DEBUG}>")


set(cmake_COMPONENTS_DEBUG )