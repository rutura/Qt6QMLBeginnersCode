// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Slider")

    Column {
        width: parent.width
        spacing: 20

        Slider {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            from: 1
            to: 100
            value: 40
            onValueChanged: {
                progressBarId.value = value
            }
        }

        ProgressBar {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            id: progressBarId
            from : 1
            to: 100
            value: 40

        }
    }
}
