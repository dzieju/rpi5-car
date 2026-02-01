# Generated file. Do not edit.
cmake_minimum_required(VERSION 3.10)

# Project-level configuration.
set(PROJECT_NAME "rpi5_car_radio")

# Configure the project.
project(${PROJECT_NAME} LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 17)

# Add source files.

add_executable(${PROJECT_NAME}
  "main.cc"
  "my_application.cc"
  # Dodaj linię poniżej, jeśli wcześniej nie była uwzględniona
  "flutter/generated_plugin_registrant.cc"
)

# Flutter-managed build settings.
set(FLUTTER_MANAGED_DIR "${CMAKE_CURRENT_SOURCE_DIR}/flutter")
include("${FLUTTER_MANAGED_DIR}/generated_plugins.cmake")

# Include Flutter's header files.
target_include_directories(${PROJECT_NAME} PRIVATE
  "${FLUTTER_MANAGED_DIR}/include"
)

# Link required Flutter libraries.
target_link_libraries(${PROJECT_NAME} PRIVATE
  "/home/rpi5-car/flutter/bin/cache/artifacts/engine/linux-arm64/libflutter_linux_gtk.so"
  ${CMAKE_DL_LIBS}
  pthread
)

# Use pkg-config to find GTK and link its dependencies.
find_package(PkgConfig REQUIRED)
pkg_check_modules(GTK3 REQUIRED gtk+-3.0)
target_include_directories(${PROJECT_NAME} PRIVATE ${GTK3_INCLUDE_DIRS})
target_link_directories(${PROJECT_NAME} PRIVATE ${GTK3_LIBRARY_DIRS})
target_link_libraries(${PROJECT_NAME} PRIVATE ${GTK3_LIBRARIES})
add_definitions(${GTK3_CFLAGS_OTHER})

# Ensure Position Independent Code is enabled for Flutter libraries.
set_target_properties(${PROJECT_NAME} PROPERTIES
  POSITION_INDEPENDENT_CODE TRUE)

# Dummy install target for Ninja compatibility.
install(CODE "MESSAGE(\"Install target invoked, but not required.\")")
