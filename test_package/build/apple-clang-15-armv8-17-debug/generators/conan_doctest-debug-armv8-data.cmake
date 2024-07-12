########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(conan_doctest_COMPONENT_NAMES "")
if(DEFINED conan_doctest_FIND_DEPENDENCY_NAMES)
  list(APPEND conan_doctest_FIND_DEPENDENCY_NAMES cmake ninja)
  list(REMOVE_DUPLICATES conan_doctest_FIND_DEPENDENCY_NAMES)
else()
  set(conan_doctest_FIND_DEPENDENCY_NAMES cmake ninja)
endif()
set(cmake_FIND_MODE "NO_MODULE")
set(ninja_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(conan_doctest_PACKAGE_FOLDER_DEBUG "/Users/becker/.conan2/p/b/conan2a88b029d1ebc/p")
set(conan_doctest_BUILD_MODULES_PATHS_DEBUG )


set(conan_doctest_INCLUDE_DIRS_DEBUG "${conan_doctest_PACKAGE_FOLDER_DEBUG}/include")
set(conan_doctest_RES_DIRS_DEBUG )
set(conan_doctest_DEFINITIONS_DEBUG )
set(conan_doctest_SHARED_LINK_FLAGS_DEBUG )
set(conan_doctest_EXE_LINK_FLAGS_DEBUG )
set(conan_doctest_OBJECTS_DEBUG )
set(conan_doctest_COMPILE_DEFINITIONS_DEBUG )
set(conan_doctest_COMPILE_OPTIONS_C_DEBUG )
set(conan_doctest_COMPILE_OPTIONS_CXX_DEBUG )
set(conan_doctest_LIB_DIRS_DEBUG "${conan_doctest_PACKAGE_FOLDER_DEBUG}/lib")
set(conan_doctest_BIN_DIRS_DEBUG )
set(conan_doctest_LIBRARY_TYPE_DEBUG STATIC)
set(conan_doctest_IS_HOST_WINDOWS_DEBUG 0)
set(conan_doctest_LIBS_DEBUG conan_doctest)
set(conan_doctest_SYSTEM_LIBS_DEBUG )
set(conan_doctest_FRAMEWORK_DIRS_DEBUG )
set(conan_doctest_FRAMEWORKS_DEBUG )
set(conan_doctest_BUILD_DIRS_DEBUG )
set(conan_doctest_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(conan_doctest_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${conan_doctest_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${conan_doctest_COMPILE_OPTIONS_C_DEBUG}>")
set(conan_doctest_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${conan_doctest_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${conan_doctest_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${conan_doctest_EXE_LINK_FLAGS_DEBUG}>")


set(conan_doctest_COMPONENTS_DEBUG )