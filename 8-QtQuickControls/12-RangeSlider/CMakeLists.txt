# Copyright (c) Daniel Gakwaya.
# SPDX-License-Identifier: MIT

cmake_minimum_required(VERSION 3.16)

project(12-RangeSlider VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick QuickControls2)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(app12-RangeSlider
    main.cpp
)

qt_add_qml_module(app12-RangeSlider
    URI 12-RangeSlider
    VERSION 1.0
    QML_FILES Main.qml
)

set_target_properties(app12-RangeSlider PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(app12-RangeSlider
    PRIVATE Qt6::Quick Qt6::QuickControls2
)

install(TARGETS app12-RangeSlider
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
