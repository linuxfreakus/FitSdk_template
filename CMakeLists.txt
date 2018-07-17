cmake_minimum_required(VERSION 3.1)
set (CMAKE_CXX_STANDARD 11)
project(FitSdkCpp)

add_subdirectory(cpp)
set ( FITSDK_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/cpp )
add_subdirectory(cpp/examples/encode)
add_subdirectory(cpp/examples/decode)


