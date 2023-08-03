// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT


import QtQuick
import QtQuick.Window

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("SpringAnimation")

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

            Behavior on x {
                SpringAnimation{
                    spring: 5
                    damping: 0.2
                    duration: 3000
                }
            }
            Behavior on y {
                SpringAnimation{
                    spring: 5
                    damping: 0.2
                    duration: 3000
                }
            }





//            SpringAnimation{
//                id: springAnimationId
//                target: containedRectId
//                property: "x"
//                spring: 5
//                damping: 0.2
//                duration:  3000
//            }

        }

        MouseArea {
            anchors.fill: parent
            onClicked: (mouse)=> {
               containedRectId.x = mouse.x
               containedRectId.y = mouse.y

//                springAnimationId.stop()
//                springAnimationId.from = containedRectId.x
//                springAnimationId.to = mouse.x
//                springAnimationId.start()
            }
        }
    }
}
