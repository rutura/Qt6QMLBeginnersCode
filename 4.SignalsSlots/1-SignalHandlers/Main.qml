// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Signal Handlers")

    Rectangle {
        id: rect
        width: 150
        height: 150
        color: "red"

        MouseArea {
            anchors.fill: parent
            //hoverEnabled: true

            onClicked: {
                console.log("Clicked on the rect")
            }

            onDoubleClicked: {
                console.log("Double clicked on the rect")
            }

            onEntered: {
                console.log("You're in!")
            }

            onExited: {
                console.log("You're out!")
            }

            onWheel: function(wheel) {
                console.log("Wheel: " + wheel.x)
            }
        }
    }
}
