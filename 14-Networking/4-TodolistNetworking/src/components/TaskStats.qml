import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    height: visible ? 60 : 0
    visible: totalTasks > 0

    property int totalTasks: 0
    property int completedTasks: 0
    property int remainingTasks: 0
    property bool hasCompleted: false

    property color backgroundColor: "#ffffff"
    property color textColor: "#333333"
    property color secondaryTextColor: "#666666"
    property color primaryColor: "#007aff"
    property color dangerColor: "#ff3b30"
    property bool darkMode: false

    signal clearCompleted()

    Rectangle {
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
                anchors.margins: 16
                spacing: 16

                // Statistics text
                Column {
                    Layout.fillWidth: true
                    spacing: 2

                    Text {
                        text: root.totalTasks === 1 ?
                              qsTr("%1 task").arg(root.totalTasks) :
                              qsTr("%1 tasks").arg(root.totalTasks)
                        color: root.textColor
                        font.pixelSize: 16
                        font.weight: Font.Medium
                    }

                    Text {
                        text: root.completedTasks > 0 ?
                              qsTr("%1 completed, %2 remaining").arg(root.completedTasks).arg(root.remainingTasks) :
                              qsTr("No tasks completed yet")
                        color: root.secondaryTextColor
                        font.pixelSize: 14
                        visible: root.totalTasks > 0
                    }
                }

                // Clear completed button
                Button {
                    id: clearButton
                    Layout.preferredHeight: 36
                    text: qsTr("Clear Completed")
                    visible: root.hasCompleted
                    enabled: root.hasCompleted

                    background: Rectangle {
                        color: clearButton.pressed ?
                               Qt.darker(root.dangerColor, 1.2) :
                               (clearButton.hovered ? root.dangerColor : "transparent")
                        border.color: root.dangerColor
                        border.width: 1
                        radius: 8
                    }

                    contentItem: Text {
                        text: clearButton.text
                        color: clearButton.hovered ? "#ffffff" : root.dangerColor
                        font.pixelSize: 14
                        font.weight: Font.Medium
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    onClicked: root.clearCompleted()
                }
            }
        }
    }
}
