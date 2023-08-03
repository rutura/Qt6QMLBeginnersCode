// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Window

Window {
    id : rootId
    visible: true
    width: 640
    height: 480
    title: qsTr("Targets")
//    property bool running: false

    Rectangle {
        id: containerRectId
        anchors.fill: parent
        color: "beige"


        Rectangle {
            id: containedRectId
            width: 100
            height: 100
            x: 50
            y: 50
            color: "dodgerblue"

            PropertyAnimation{
                id: xAnimation
                target: containedRectId
                property: "x"
                to: 530
                duration: 2000
//                running: rootId.running
            }

            NumberAnimation{
                id: yAnimation
                target: containedRectId
                property: "y"
                to: 300
                duration: 2000
                //running: rootId.running
            }

            RotationAnimation {
                id: rotationAnimation
                target: containedRectId
                property: "rotation"
                to: 600
                duration: 2000
                //running: rootId.running
            }

        }

        MouseArea {
            anchors.fill: parent
            /*
            onPressed: {
               rootId.running = true

            }
            onReleased: {
              rootId.running = false
            }
            */


            onPressed: {
                xAnimation.start()
                yAnimation.start()
                rotationAnimation.start()
            }

            onReleased:{
                xAnimation.stop()
                yAnimation.stop()
                rotationAnimation.stop()
            }
        }
    }
}
