# Copyright (c) Daniel Gakwaya.
# SPDX-License-Identifier: MIT

cmake_minimum_required(VERSION 3.16)

project(9-DifferentQMLComponentSignals VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(app9-DifferentQMLComponentSignals
    main.cpp
)

qt_add_qml_module(app9-DifferentQMLComponentSignals
    URI 9-DifferentQMLComponentSignals
    VERSION 1.0
    QML_FILES Main.qml Notifier.qml Receiver.qml
)

set_target_properties(app9-DifferentQMLComponentSignals PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(app9-DifferentQMLComponentSignals
    PRIVATE Qt6::Quick
)

install(TARGETS app9-DifferentQMLComponentSignals
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
