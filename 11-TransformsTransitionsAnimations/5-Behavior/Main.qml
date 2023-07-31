/*
        . Exploring Behavior

        . Specifying a default animation for a property change

        . We specified an animation that'll run when the x position of the rectangle changes

        . We trigger the change in the mouseArea click handler.

        . Improvise.
  */

import QtQuick
import QtQuick.Window

Window {
    id : rootId
    visible: true
    width: 640
    height: 480
    title: qsTr("Behavior")

    Rectangle {
        id : containerRectId
        anchors.fill: parent
        color: "beige"

        Rectangle {
            id : containedRectId
            width: 100
            height: 100
            x : 50
            y : 50
            color: "dodgerblue"

            Behavior on x {
                NumberAnimation{
                    duration: 1000
                }
            }

        }

        MouseArea {
            anchors.fill: parent
            onClicked: (mouse)=> {
                    containedRectId.x = mouse.x
                }
        }
    }
}
