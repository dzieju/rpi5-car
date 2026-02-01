# Generated file. Do not edit.
cmake_minimum_required(VERSION 3.10)

# Project-level configuration.
set(PROJECT_NAME "rpi5_car_radio")

# Invoke the build process.
project(${PROJECT_NAME} LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 17)

# Define the target architecture.
add_definitions(-DFLUTTER_TARGET_PLATFORM_LINUX)

# Application executable.
add_executable(${PROJECT_NAME}
  "main.cc"
  "my_application.cc"
  "my_application.h"
)

# Apply project-wide settings.
target_compile_definitions(${PROJECT_NAME} PRIVATE
  # Dart doesn't require Unicode support.
  "$<$<CONFIG:Debug>:DEBUG>"
)

# Flutter requires PIC for shared libraries.
set_target_properties(${PROJECT_NAME} PROPERTIES
  POSITION_INDEPENDENT_CODE TRUE
)

# Add dependencies.
target_link_libraries(${PROJECT_NAME} PRIVATE
  flutter
  PkgConfig::GTK
)

# Include directories.
target_include_directories(${PROJECT_NAME} PRIVATE
  "${CMAKE_CURRENT_SOURCE_DIR}"
)
