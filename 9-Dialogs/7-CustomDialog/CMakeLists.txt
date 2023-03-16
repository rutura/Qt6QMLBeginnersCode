cmake_minimum_required(VERSION 3.16)

project(7-CustomDialog VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick QuickControls2 REQUIRED)

qt_add_executable(app7-CustomDialog
    main.cpp resource.qrc
)

qt_add_qml_module(app7-CustomDialog
    URI 7-CustomDialog
    VERSION 1.0
    QML_FILES main.qml 
)

set_target_properties(app7-CustomDialog PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_compile_definitions(app7-CustomDialog
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(app7-CustomDialog
    PRIVATE Qt6::Quick Qt6::QuickControls2)
