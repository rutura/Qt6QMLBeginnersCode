/*
        . A basic example to generally explore the syntax of qml
        . Main ideas :
            . QML is a declarative language
            . top down hierarchy
            . components can have children
            . components can have unique IDs
            . variables
            . property binding
            . responding to events
            . anchors to position elemetns
         . Reference the video for Qt5 if needed.
  */

import QtQuick

Window {

    id : rootId
    visible: true
    width: 640
    height: 480
    title: qsTr("QML Syntax Demo")

    property string textToShow: "hello"

    Row {
        id : row1
        anchors.centerIn: parent
        spacing: 20

        Rectangle {
            id : redRectId
            width: 100; height: 100
            color: "red"
            radius: 20
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on the red rectangle")
                    textToShow = "red"
                }
            }

        }
        Rectangle {
            id : greenRectId
            width: 100; height: 100
            color: "green"
            radius: 20
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on the green rectangle")
                    textToShow = "green"
                }
            }

        }
        Rectangle {
            id : blueRectId
            width: 100; height: 100
            color: "blue"
            radius: 20
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on the blue rectangle")
                    textToShow = "blue"
                }
            }

        }
        Rectangle {
            id : textRectId
            width: 100; height: 100
            color: "dodgerblue"
            radius: 100
            Text {
                id : textId
                anchors.centerIn: parent
                text : textToShow
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on the dodgerblue rectangle")
                    textId.text = "broken"

                }
            }

        }
    }

}
