// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import "utilities1.js" as Utilities1

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Javascript Import Demo")

    Rectangle {
        width: 300
        height: 100
        color: "yellowgreen"
        anchors.centerIn: parent

        Text {
            text: "Click Me"
            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
            //console.log("The ages yield: " + Utilities1.combineAges(33,17))
            console.log("The ages yield: " + Utilities1.add(33,17))
            }
        }
    }
}

