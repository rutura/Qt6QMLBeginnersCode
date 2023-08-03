// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Window

Window {
    id: rootId
    width: 640
    height: 480
    visible: true
    title: qsTr("PathAnimation")

    Rectangle {
        id: containerRectId
        anchors.fill: parent
        color: "beige"

        Rectangle {
            id: containedRectId
            width: 100
            height: 100
            x: rootId.width/2 -50 // Take into account the anchor point : -50
            y: rootId.height - 50 - 50 // Take into account the anchor point : -50
            color: "dodgerblue"
            radius: 80

            PathAnimation{
                id: pathAnimationId
                target: containedRectId
                duration: 1000
                anchorPoint : Qt.point(50, 50)
                path: Path {
                    //Bottom : Starting Point
                    startX: rootId.width/2
                    startY: rootId.height - 50

                    // Towards Left
                    PathCubic {
                        x: 50
                        y: rootId.height/2

                        control1X: rootId.width/2 - rootId.width/8
                        control1Y: rootId.height
                        control2X: 0
                        control2Y: rootId.height/2 + rootId.height/8

                    }

                    //Towards Top: Q2
                    PathCubic {
                        x: rootId.width/2
                        y: 50
                        control1X: 0
                        control1Y: (rootId.height/2 - rootId.height/8)
                        control2X : (rootId.width/2 - rootId.width/8)
                        control2Y:  0
                    }

                    //Towards Right: Q3
                    PathCubic {
                        x: rootId.width - 50
                        y: rootId.height/2
                        control1X: rootId.width/2 + rootId.width/8
                        control1Y: 0
                        control2X: rootId.width
                        control2Y: rootId.height/2 - rootId.height/8
                    }

                    //Towards bottom: Q4
                    PathCubic {
                        x: rootId.width/2
                        y: rootId.height - 50
                        control1X: rootId.width
                        control1Y: rootId.height/2 + rootId.height/8
                        control2X: rootId.width/2 + rootId.width/8
                        control2Y: rootId.height
                    }
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: (mouse)=> {
                pathAnimationId.start()
            }
        }
    }
}
