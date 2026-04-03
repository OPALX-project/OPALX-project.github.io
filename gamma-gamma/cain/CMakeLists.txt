cmake_minimum_required(VERSION 3.16)

project(CAINBuild NONE)

find_program(BASH_EXECUTABLE bash REQUIRED)

add_custom_target(cain-download
    COMMAND "${BASH_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/build-cain.sh" --download
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    USES_TERMINAL
    COMMENT "Clone, patch, and build CAIN from scratch")

add_custom_target(cain-compile
    COMMAND "${BASH_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/build-cain.sh" --compile
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    USES_TERMINAL
    COMMENT "Compile CAIN from an existing local source tree")
