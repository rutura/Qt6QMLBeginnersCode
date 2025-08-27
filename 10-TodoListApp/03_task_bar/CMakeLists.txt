cmake_minimum_required(VERSION 3.16)

project(TodoList VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick QuickControls2)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(TodoList
    src/main.cpp
)

qt_add_qml_module(TodoList
    URI TodoList
    VERSION 1.0
    QML_FILES
        # Main View
        src/views/MainView.qml

        # Components
        src/components/AppHeader.qml
        src/components/AddTaskBar.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(TodoList PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.app01_todolist_starter
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(TodoList
    PRIVATE Qt6::Quick
            Qt6::QuickControls2
)

include(GNUInstallDirs)
install(TARGETS TodoList
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
