// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Switch")

    Column {
        width: parent.width
        spacing: 20

        Switch{
            anchors.horizontalCenter: parent.horizontalCenter
            text: "WiFi"
            checked: true
            onCheckedChanged: {
                if(checked)
                {
                    console.log("WiFi switch is turned ON")
                }else{
                    console.log("WiFi switch is turned OFF")
                }
            }
        }
        Switch{
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Bluetooth"
        }
        Switch{
            anchors.horizontalCenter: parent.horizontalCenter
            text: "NFC"
            enabled: false
        }
    }
}
