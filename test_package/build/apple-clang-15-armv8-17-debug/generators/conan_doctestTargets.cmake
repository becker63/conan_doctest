# Load the debug and release variables
file(GLOB DATA_FILES "${CMAKE_CURRENT_LIST_DIR}/conan_doctest-*-data.cmake")

foreach(f ${DATA_FILES})
    include(${f})
endforeach()

# Create the targets for all the components
foreach(_COMPONENT ${conan_doctest_COMPONENT_NAMES} )
    if(NOT TARGET ${_COMPONENT})
        add_library(${_COMPONENT} INTERFACE IMPORTED)
        message(${conan_doctest_MESSAGE_MODE} "Conan: Component target declared '${_COMPONENT}'")
    endif()
endforeach()

if(NOT TARGET conan_doctest::conan_doctest)
    add_library(conan_doctest::conan_doctest INTERFACE IMPORTED)
    message(${conan_doctest_MESSAGE_MODE} "Conan: Target declared 'conan_doctest::conan_doctest'")
endif()
# Load the debug and release library finders
file(GLOB CONFIG_FILES "${CMAKE_CURRENT_LIST_DIR}/conan_doctest-Target-*.cmake")

foreach(f ${CONFIG_FILES})
    include(${f})
endforeach()