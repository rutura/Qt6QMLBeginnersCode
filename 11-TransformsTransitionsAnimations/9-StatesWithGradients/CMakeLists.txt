cmake_minimum_required(VERSION 3.16)

project(9-StatesWithGradients VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(app9-StatesWithGradients
    main.cpp resource.qrc
)

qt_add_qml_module(app9-StatesWithGradients
    URI 9-StatesWithGradients
    VERSION 1.0
    QML_FILES Main.qml
)

set_target_properties(app9-StatesWithGradients PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(app9-StatesWithGradients
    PRIVATE Qt6::Quick
)

install(TARGETS app9-StatesWithGradients
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
