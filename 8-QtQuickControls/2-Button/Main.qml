// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Button")

    ColumnLayout {
        anchors.left: parent.left
        anchors.right: parent.right

        Button {
            id: button1
            text: "Button1"
            Layout.fillWidth: true
            onClicked: {
                console.log("Clicked on button1")
            }
        }
        Button{
            id: button2
            text : "Button2"
            Layout.fillWidth: true
            onClicked: {
                console.log("Clicked on button2")
            }
        }
    }
}
