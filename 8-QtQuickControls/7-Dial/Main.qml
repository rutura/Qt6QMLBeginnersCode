// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Dial")

    Column {
        width: parent.width
        spacing: 40

        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "A Knob used to let the user choose a value from a range"
            font.pointSize: 15
        }

        Dial{
            anchors.horizontalCenter: parent.horizontalCenter
            from: 1
            to: 100
            value: 50
            wrap: true

            onValueChanged: {
                console.log(" Current value: " + Math.ceil(value))
            }

        }

    }
}
