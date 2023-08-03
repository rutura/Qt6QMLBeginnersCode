// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Window

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Flow")

    Flow {
        id: containerFlowId
        width : parent.width
        height: parent.height

        flow: Flow.TopToBottom
        layoutDirection: Qt.RightToLeft

        //spacing: 20


        Rectangle {
            id: topLeftRectId
            width : 70
            height: 70
            color: "green"
            Text {
                anchors.centerIn: parent
                color: "black"
                font.pointSize: 30
                text: "1"
            }
        }

        Rectangle {
            id: topCenterRectId
            width : 100
            height: 100
            color: "beige"
            Text {
                anchors.centerIn: parent
                color: "black"
                font.pointSize: 30
                text: "2"
            }
        }

        Rectangle {
            id: topRightRectId
            width : 100
            height: 100
            color: "dodgerblue"
            Text {
                anchors.centerIn: parent
                color: "black"
                font.pointSize: 30
                text: "3"
            }
        }

        Rectangle {
            id: leftCenterRectId
            width : 100
            height: 100
            color: "magenta"
            Text {
                anchors.centerIn: parent
                color: "black"
                font.pointSize: 30
                text: "4"
            }
        }

        Rectangle {
            id: centerRectId
            width : 100
            height: 100
            color: "red"
            Text {
                anchors.centerIn: parent
                color: "black"
                font.pointSize: 30
                text: "5"
            }
        }
        Rectangle {
            id: rightCenterId
            width : 100
            height: 100
            color: "yellow"
            Text {
                anchors.centerIn: parent
                color: "black"
                font.pointSize: 30
                text: "6"
            }
        }

        Rectangle {
            id: bottomLeftRectId
            width : 100
            height: 100
            color: "royalblue"
            Text {
                anchors.centerIn: parent
                color: "black"
                font.pointSize: 30
                text: "7"
            }
        }

        Rectangle {
            id: bottomCenterRect
            width : 100
            height: 100
            color: "greenyellow"
            Text {
                anchors.centerIn: parent
                color: "black"
                font.pointSize: 30
                text: "8"
            }
        }

        Rectangle {
            id: bottomRightRectId
            width : 100
            height: 100
            color: "blue"
            Text {
                anchors.centerIn: parent
                color: "black"
                font.pointSize: 30
                text: "9"
            }
        }
    }
}
