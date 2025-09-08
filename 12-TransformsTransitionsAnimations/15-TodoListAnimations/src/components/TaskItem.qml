import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    height: 56
    
    required property string taskTitle
    required property bool taskDone
    
    signal toggleDone()
    signal deleteTask()
    
    property color backgroundColor: "#ffffff"
    property color textColor: "#333333"
    property color completedColor: "#999999"
    property color primaryColor: "#007aff"
    property bool darkMode: false
    
    // Constants for this component
    readonly property int itemHeight: 56
    readonly property int margins: 4
    readonly property int innerMargins: 12
    readonly property int checkboxSize: 24
    readonly property int deleteButtonSize: 32

    Rectangle {
        id: taskItemBackground
        anchors.fill: parent
        color: "transparent"
        
        Rectangle {
            id: itemBackground
            anchors.fill: parent
            anchors.margins: root.margins
            color: root.backgroundColor
            radius: 8
            border.color: root.taskDone ? "transparent" : (root.darkMode ? "#404040" : "#f0f0f0")
            border.width: 1
            opacity: root.taskDone ? 0.7 : 1.0

            scale: itemBackground.hovered ? 1.02 : 1.0

            // Smooth transitions for background properties
            Behavior on opacity {
                NumberAnimation { duration: 300 }
            }

            Behavior on border.color {
                ColorAnimation { duration: 300 }
            }

            Behavior on scale {
                NumberAnimation { duration: 150; easing.type: Easing.OutQuad }
            }
        
        RowLayout {
            anchors.fill: parent
            anchors.margins: root.innerMargins
            spacing: 12
            
            // Checkbox
            Rectangle {
                id: checkbox
                Layout.preferredWidth: root.checkboxSize
                Layout.preferredHeight: root.checkboxSize
                color: root.taskDone ? root.primaryColor : "transparent"
                border.color: root.taskDone ? root.primaryColor : (root.darkMode ? "#666666" : "#cccccc")
                border.width: 2
                radius: 4

                // Smooth transitions for checkbox state changes
                Behavior on color {
                    ColorAnimation { duration: 200 }
                }

                Behavior on border.color {
                    ColorAnimation { duration: 200 }
                }

                Behavior on scale {
                    NumberAnimation { duration: 100; easing.type: Easing.OutBack }
                }
                
                // Checkmark
                Text {
                    anchors.centerIn: parent
                    text: "✓"
                    color: "#ffffff"
                    font.pixelSize: 16
                    font.weight: Font.Bold
                    opacity: root.taskDone ? 1.0 : 0.0

                    scale: root.taskDone ? 1.0 : 0.3

                    Behavior on opacity {
                        NumberAnimation { duration: 200 }
                    }

                    Behavior on scale {
                        NumberAnimation { duration: 200; easing.type: Easing.OutBack }
                    }
                    
                }
                
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        // Add click animation
                        checkbox.scale = 0.9
                        scaleResetTimer.restart()

                        //Toggle the task
                        root.toggleDone()
                    }
                    cursorShape: Qt.PointingHandCursor
                }

                // Timer to reset scale after click
                Timer {
                    id: scaleResetTimer
                    interval: 100
                    onTriggered: checkbox.scale = 1.0
                }
                
            }
            
            // Task text
            Text {
                id: taskText
                Layout.fillWidth: true
                text: root.taskTitle
                color: root.taskDone ? root.completedColor : root.textColor
                font.pixelSize: 16
                font.strikeout: root.taskDone
                wrapMode: Text.WordWrap

                // Smooth color transition when task state changes
                Behavior on color {
                    ColorAnimation { duration: 300 }
                }

                // Subtle scale animation on completion
                scale: root.taskDone ? 0.95 : 1.0
                Behavior on scale {
                    NumberAnimation { duration: 200; easing.type: Easing.OutQuad }
                }
                
                MouseArea {
                    anchors.fill: parent
                    onClicked: root.toggleDone()
                    cursorShape: Qt.PointingHandCursor
                }
            }
            
            // Delete button
            Button {
                id: deleteButton
                Layout.preferredWidth: root.deleteButtonSize
                Layout.preferredHeight: root.deleteButtonSize
                opacity: itemBackground.hovered ? 1.0 : 0.3
                scale: deleteButton.pressed ? 0.9 : 1.0

                // Smooth transitions
                Behavior on opacity {
                    NumberAnimation { duration: 200 }
                }

                Behavior on scale {
                    NumberAnimation { duration: 100; easing.type: Easing.OutQuad }
                }
                
                background: Rectangle {
                    color: deleteButton.pressed ? "#ff3b30" : "transparent"
                    radius: 16
                    Behavior on color {
                        ColorAnimation { duration: 150 }
                    }
                }
                
                contentItem: Text {
                    text: "🗑"
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    rotation: deleteButton.pressed ? 15 : 0

                    Behavior on rotation {
                        NumberAnimation { duration: 100 }
                    }
                }
                
                onClicked: {
                    root.deleteTask()
                }
            }
        }
        
        // Hover effect
        property bool hovered: false
        
        HoverHandler {
            onHoveredChanged: itemBackground.hovered = hovered
        }
    }
}
}
