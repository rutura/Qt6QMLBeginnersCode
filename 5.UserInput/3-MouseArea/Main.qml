// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("MouseArea Demo")

    Rectangle {
        id: containerRectId
        width: parent.width
        height: 200
        color: "beige"

        Rectangle {
            id: movingRectId
            width: 50
            height: width
            color: "blue"


        }

        MouseArea{
            anchors.fill: parent
            onClicked: function(mouse) {
                console.log(mouse.x)
                movingRectId.x =  mouse.x
            }

            onWheel:function(wheel) {
                console.log(" x: "+ wheel.x + ", y: "+ wheel.y + ", angleData: "+ wheel.angleDelta)
            }

            hoverEnabled: true
            onHoveredChanged: {
                if (containsMouse)
                {
                    containerRectId.color = "red"
                }else {
                    containerRectId.color = "green"
                }
            }
        }
    }


    Rectangle {
        id: dragContainerId
        width : parent.width
        height: 200
        color: "beige"
        y: 250

        Rectangle {
            id: draggableRect
            width: 50
            height: width
            color: "blue"

            onXChanged: {
                console.log("x coordinate is: "+ x)
            }
        }

        MouseArea{
            anchors.fill: parent
            drag.target: draggableRect
            drag.axis: Drag.XAxis
            drag.minimumX: 0
            drag.maximumX: dragContainerId.width - draggableRect.width

        }
    }
}
