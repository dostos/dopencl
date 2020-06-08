# Minimal version of CMake
cmake_minimum_required (VERSION 2.6)

set(CMAKE_CXX_STANDARD 11)

if(CMAKE_COMPILER_IS_GNUCXX)
execute_process(COMMAND ${CMAKE_CXX_COMPILER} -dumpversion OUTPUT_VARIABLE GNUCXX_VERSION)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
endif(CMAKE_COMPILER_IS_GNUCXX)
 
# Build type
if (NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
	message(STATUS "Setting build type to 'Debug' as none was specified.")
	set(CMAKE_BUILD_TYPE Debug CACHE STRING "Choose the type of build." FORCE)
	# Set the possible values of build type for cmake-gui
	set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release")
endif ()
 
# Define project name
project (OpenCL_Example)

set (CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/")
add_definitions(-DCL_HPP_TARGET_OPENCL_VERSION=200 -DCL_HPP_MINIMUM_OPENCL_VERSION=200  -DCL_HPP_ENABLE_PROGRAM_CONSTRUCTION_FROM_ARRAY_COMPATIBILITY)
 
find_package( OpenCL REQUIRED )

include_directories( ${OPENCL_INCLUDE_DIR} )

# Source code of application		
set (opencl_example_src opencl_example.cc)
 
# Set up executable
add_executable (opencl_example ${opencl_example_src})

            
target_link_libraries(opencl_example ${OPENCL_LIBRARIES})