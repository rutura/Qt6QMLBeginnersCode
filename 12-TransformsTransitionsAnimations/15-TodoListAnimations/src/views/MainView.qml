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

    // Task model - Using the dedicated TaskListModel
    TaskListModel {
        id: taskModel
    }

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

        // Header
        AppHeader {
            id: header
            Layout.fillWidth: true
            textColor: root.textColor
            textSecondary: root.completedColor
            darkMode: root.darkMode
            onToggleDarkMode: root.darkMode = !root.darkMode
        }

        // Add task bar
        AddTaskBar {
            id: addTaskBar
            Layout.fillWidth: true
            backgroundColor: root.cardColor
            textColor: root.textColor
            primaryColor: root.primaryColor
            darkMode: root.darkMode

            onTaskAdded: function(taskText) {
                taskModel.addTask(taskText)
            }
        }

        // Tasks list
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: root.cardColor
            radius: 12
            border.width: 1
            border.color: root.darkMode ? "#404040" : "#e0e0e0"

            ScrollView {
                anchors.fill: parent
                anchors.margins: 1
                clip: true

                ListView {
                    id: taskListView
                    model: taskModel
                    spacing: 8
                    anchors.margins: 12



                    // Add animation transitions
                    add: Transition {
                        NumberAnimation {
                            properties: "x"
                            from: 100; to: 0
                            duration: 300
                            easing.type: Easing.OutCubic
                        }
                        NumberAnimation {
                            property: "opacity"
                            from: 0; to: 1
                            duration: 300
                        }
                    }

                    remove: Transition {
                        NumberAnimation {
                            properties: "x"
                            to: 100
                            duration: 250
                            easing.type: Easing.InCubic
                        }
                        NumberAnimation {
                            property: "opacity"
                            to: 0
                            duration: 250
                        }
                    }

                    displaced: Transition {
                        NumberAnimation {
                            properties: "x,y"
                            duration: 200
                            easing.type: Easing.OutQuad
                        }
                    }





                    delegate: TaskItem {
                        required property int index
                        required property string title
                        required property bool completed

                        width: taskListView.width
                        taskTitle: title
                        taskDone: completed
                        backgroundColor: root.cardColor
                        textColor: root.textColor
                        completedColor: root.completedColor
                        primaryColor: root.primaryColor
                        darkMode: root.darkMode

                        onToggleDone: {
                            taskModel.toggleTask(index)
                        }

                        onDeleteTask: {
                            taskModel.deleteTask(index)
                        }
                    }

                    // Empty state
                    Rectangle {
                        anchors.centerIn: parent
                        width: parent.width - 40
                        height: 120
                        color: "transparent"
                        visible: taskListView.count === 0
                        opacity: taskListView.count === 0 ? 1.0 : 0.0


                        Behavior on opacity {
                            NumberAnimation { duration: 400; easing.type: Easing.InOutQuad }
                        }

                        Column {
                            anchors.centerIn: parent
                            spacing: 16

                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: "📝"
                                font.pixelSize: 48
                                opacity: 0.3

                                // Subtle floating animation
                                SequentialAnimation on y {
                                    running: taskListView.count === 0
                                    loops: Animation.Infinite
                                    NumberAnimation { from: 0; to: -5; duration: 2000; easing.type: Easing.InOutSine }
                                    NumberAnimation { from: -5; to: 0; duration: 2000; easing.type: Easing.InOutSine }
                                }
                            }

                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: qsTr("No tasks yet")
                                color: root.completedColor
                                font.pixelSize: 18
                                font.weight: Font.Medium
                            }

                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: qsTr("Add a task above to get started")
                                color: root.completedColor
                                font.pixelSize: 14
                                horizontalAlignment: Text.AlignHCenter
                            }
                        }
                    }
                }
            }


        }

        // Task statistics at bottom
        TaskStats {
            id: taskStats
            Layout.fillWidth: true
            backgroundColor: root.cardColor
            textColor: root.textColor
            secondaryTextColor: root.completedColor
            primaryColor: root.primaryColor
            darkMode: root.darkMode
            totalTasks: taskModel.count
            completedTasks: taskModel.getStats().completed
            remainingTasks: taskModel.getStats().remaining
            hasCompleted: taskModel.hasCompletedTasks()

            onClearCompleted: {
                taskModel.clearCompletedTasks()
            }
        }
    }
}
