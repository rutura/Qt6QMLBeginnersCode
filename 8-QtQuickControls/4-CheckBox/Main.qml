// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("CheckBox")

    Column {
        spacing: 20
        anchors.horizontalCenter: parent.horizontalCenter

        CheckBox {
            text: "Option1"
            checked: true
            onCheckStateChanged: {
                if (checked)
                {
                    console.log("Option1 is checked")
                }else{
                    console.log("Option1 is unchecked")
                }
            }
        }
        CheckBox {
            text: "Option2"
        }
        CheckBox {
            text: "Option3"
            checked: false
            enabled: false
        }
    }
}
