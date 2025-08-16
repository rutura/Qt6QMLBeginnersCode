import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: root
    width: 400
    height: 700
    visible: true
    title: qsTr("My Tasks")


    // Theme properties
    property bool darkMode: false
    property color backgroundColor: darkMode ? "#1e1e1e" : "#f0f2f5"
    property color primaryColor: "#007aff"
    property color textColor: darkMode ? "#ffffff" : "#333333"
    property color cardColor: darkMode ? "#2d2d2d" : "#ffffff"
    property color completedColor: darkMode ? "#666666" : "#999999"

    // Background
    Rectangle {
        anchors.fill: parent
        color: root.backgroundColor
    }

    //The components of the ui
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        //Placeholder for header (we'll add this next)
        /*
        Rectangle{
            Layout.fillWidth: true
            Layout.preferredHeight: 80
            color: "transparent"
            border.color: root.textColor
            border.width: 1

            Text{
                anchors.centerIn: parent
                text: "Header will go here"
                color: root.textColor
            }
        }
        */
        AppHeader {
            id: header
            Layout.fillWidth: true
            textColor: root.textColor
            textSecondary: root.completedColor
            darkMode: root.darkMode
            onToggleDarkMode: root.darkMode = !root.darkMode
        }

        //The actual AppHeader component to replace the place holder

        //Add a spacer to push things up. Will remove later
        Item {
            Layout.fillHeight: true
        }

    }
}
