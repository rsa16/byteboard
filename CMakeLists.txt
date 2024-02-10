set(PROJECT_NAME ByteBoard)

cmake_minimum_required(VERSION 3.22)

project(ByteBoard VERSION 1.0 LANGUAGES CXX)


#############################
# Set Target Arch
#############################
if (NOT CMAKE_VS_PLATFORM_NAME)
    set(CMAKE_VS_PLATFORM_NAME "x64")
endif()
message("${CMAKE_VS_PLATFORM_NAME} architechture in use")

if(NOT ("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "x64"
     OR "${CMAKE_VS_PLATFORM_NAME}" STREQUAL "x86"))
    message(FATAL_ERROR "${CMAKE_VS_PLATFORM_NAME} arch is not supported!")
endif()


#############################
# Configuration Types
#############################
set(CMAKE_CONFIGURATION_TYPES
    "Debug"
    "Release"
    CACHE STRING "" FORCE
)

include(cmake/Utils.cmake)


#############################
# Source Files
#############################
set(Source_Files
    "src/main.cpp"
)

set(QML_FILES
    data/main.qml
    data/Splash.ui.qml
)

set(ADDITIONAL_LIBRARY_DEPENDENCIES
    Qt6::Core
    Qt6::Gui
    Qt6::Quick
    # QWindowKit::Quick
)


#############################
# QT Standard Setup
#############################
find_package(Qt6 COMPONENTS Core Gui Quick REQUIRED)
qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(${PROJECT_NAME} ${Source_Files})
qt_add_resources(${PROJECT_NAME} "qml"
    PREFIX "/"
    FILES ${QML_FILES}
)

use_props(${PROJECT_NAME} "${CMAKE_CONFIGURATION_TYPES}" "${DEFAULT_CXX_PROPS}")


#############################
# External Packages
#############################
# add_subdirectory(external/qwindowkit)
# find_package(QWindowKit REQUIRED)


target_link_libraries(${PROJECT_NAME} PRIVATE ${ADDITIONAL_LIBRARY_DEPENDENCIES})

set(QT_ALLOW_MISSING_TOOLS_PACKAGES ON)


#############################
# Target Properties
#############################
set_target_properties(${PROJECT_NAME} PROPERTIES
    OUTPUT_DIRECTORY_DEBUG "${CMAKE_SOURCE_DIR}/bin/debug/"
    OUTPUT_DIRECTORY_RELEASE "${CMAKE_SOURCE_DIR}/bin/release/"
    INTERPROCEDURAL_OPTIMIZATION_RELEASE "TRUE"
    WIN32_EXECUTABLE "ON"
)


#############################
# Compile and Link Options
#############################
target_compile_options(${PROJECT_NAME} PRIVATE
    $<$<CONFIG:Release>:
        /Oi;
        /Gy
    >
)

target_link_options(${PROJECT_NAME} PRIVATE
    $<$<CONFIG:Release>:
        /OPT:REF;
        /OPT:ICF
    >
)
