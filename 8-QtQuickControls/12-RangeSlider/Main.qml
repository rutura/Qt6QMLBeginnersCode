// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("RangeSlider")

    Row {
        spacing: 40
        width: parent.width

        RangeSlider{
            //orientation: Qt.Vertical
            from: 1
            to: 100
            first.value: 25
            second.value: 75

            first.onValueChanged: {
                console.log("First value changed to: "+ first.value)
            }
            second.onValueChanged: {
                console.log("Second value changed to: "+ second.value)
            }
        }
    }
}
