cmake_minimum_required(VERSION 3.16)

project(12-PendulumSwing VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(app12-PendulumSwing
    main.cpp
)

qt_add_qml_module(app12-PendulumSwing
    URI 12-PendulumSwing
    VERSION 1.0
    QML_FILES Main.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(app12-PendulumSwing PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.app12-PendulumSwing
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(app12-PendulumSwing
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS app12-PendulumSwing
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
