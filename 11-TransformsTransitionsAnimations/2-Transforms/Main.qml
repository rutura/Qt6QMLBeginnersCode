// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Transforms")

    Rectangle {
        id: containerRectId
        anchors.fill: parent
        color: "beige"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                rect1Id.x = 50
                rect2Id.rotation = 0
                rect3Id.scale = 1
            }
        }
    }



    ClickableRect{
        id: rect1Id
        width: 100
        height: 100
        x : 50
        y : 100
        color: "red"
        onClicked: {
            //Tranlation on x
            x += 20
        }
    }




    ClickableRect{
        id: rect2Id
        width: 100
        height: 100
        transformOrigin: Item.TopRight
        x : 250
        y : 100
        color: "green"
        onClicked: {
            //Rotation
            rotation += 15
        }
    }

    ClickableRect{
        id: rect3Id
        width: 100
        height: 100
        transformOrigin: Item.BottomLeft
        x : 450
        y : 100
        color: "blue"
        onClicked: {
            //Scaling
            scale += 0.05
            //Rotate
            rotation += 15
        }
    }
}
