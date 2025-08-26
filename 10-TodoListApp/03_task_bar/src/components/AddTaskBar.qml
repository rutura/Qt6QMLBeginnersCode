import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    height: 60

    signal taskAdded(string taskText)

    property color backgroundColor: "#ffffff"
    property color textColor: "#333333"
    property color primaryColor: "#007aff"
    property bool darkMode: false

    Rectangle {
        id: background
        anchors.fill: parent
        color: "transparent"

        Rectangle {
            anchors.fill: parent
            color: root.backgroundColor
            radius: 12
            border.color: root.darkMode ? "#404040" : "#e0e0e0"
            border.width: 1

            RowLayout {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 12

                // Add icon
                Rectangle {
                    Layout.preferredWidth: 36
                    Layout.preferredHeight: 36
                    color: root.primaryColor
                    radius: 18

                    Text {
                        anchors.centerIn: parent
                        text: "+"
                        color: "#ffffff"
                        font.pixelSize: 20
                        font.weight: Font.Bold
                    }
                }

                // Text input
                TextField {
                    id: taskInput
                    Layout.fillWidth: true
                    Layout.preferredHeight: 36
                    placeholderText: qsTr("Add a new task...")
                    placeholderTextColor: root.darkMode ? "#888888" : "#999999"
                    color: root.textColor
                    font.pixelSize: 16
                    selectByMouse: true

                    background: Rectangle {
                        color: "transparent"
                        border.color: "transparent"
                    }

                    Keys.onReturnPressed: root.addTask()
                    Keys.onEnterPressed: root.addTask()

                }

                // Add button
                Button {
                    id: addButton
                    Layout.preferredWidth: 80
                    Layout.preferredHeight: 36
                    text: qsTr("Add")
                    enabled: taskInput.text.trim().length > 0

                    background: Rectangle {
                        color: addButton.enabled ?
                               (addButton.pressed ? Qt.darker(root.primaryColor, 1.2) : root.primaryColor) :
                               (root.darkMode ? "#404040" : "#e0e0e0")
                        radius: 8

                    }

                    contentItem: Text {
                        text: addButton.text
                        color: addButton.enabled ? "#ffffff" : (root.darkMode ? "#888888" : "#cccccc")
                        font.pixelSize: 14
                        font.weight: Font.Medium
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter

                    }

                    onClicked: root.addTask()
                }
            }
        }
    }

    function addTask() {
        //TODO: Implement task addition logic
        console.log("Task added.")
    }
}
