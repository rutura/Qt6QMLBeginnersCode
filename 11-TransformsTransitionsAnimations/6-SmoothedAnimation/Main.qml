// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT


import QtQuick
import QtQuick.Window

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("SmoothedAnimation")

    /*

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



//            Behavior on x {
//                NumberAnimation{
//                    duration: 1000
//                }


//                SmoothedAnimation{
//                    velocity: 200
//                    //duration: 2000
//                }
//            }


            SmoothedAnimation {
                id: smoothedAnimationId
                target: containedRectId
                property: "x"
                //from: 50
                //to: 500
                duration: 1000
            }

        }

        MouseArea {
            anchors.fill: parent


            onClicked: (mouse)=> {
                //containedRectId.x = mouse.x

                //Using a standalone SmoothedAnimation object
                smoothedAnimationId.from = containedRectId.x
                smoothedAnimationId.to = mouse.x
                smoothedAnimationId.start()
            }

        }
    }
    */


    //The tracking example, borrowed from the official docs
    Rectangle {
        anchors.fill: parent
        color: "gray"

        Rectangle {
            width: 60; height: 60
            x: rect1.x - 5; y: rect1.y - 5
            color: "green"

            Behavior on x { SmoothedAnimation { velocity: 200 } }
            Behavior on y { SmoothedAnimation { velocity: 200 } }
        }

        Rectangle {
            id: rect1
            width: 50; height: 50
            color: "red"
        }

        focus: true
        Keys.onRightPressed: rect1.x = rect1.x + 100
        Keys.onLeftPressed: rect1.x = rect1.x - 100
        Keys.onUpPressed: rect1.y = rect1.y - 100
        Keys.onDownPressed: rect1.y = rect1.y + 100
    }

}
