// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT


import QtQuick
import QtQuick.Dialogs
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("ColorDialog")

    Column {
        spacing: 20
        anchors.centerIn: parent

        Button{
            text : "Choose Color"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                colorDialogId.open()
            }
        }
        Rectangle{
            width: 200
            height: 200
            id : rectangleId
            border.color: "black"
            border.width: 8
            anchors.horizontalCenter: parent.horizontalCenter
        }

        ColorDialog{
            id: colorDialogId
            title: "Please choose a color"
            onAccepted: {
                console.log("User chose color: "+ selectedColor)
                rectangleId.color = selectedColor

            }
            onRejected: {
                console.log("User rejected dialog")
            }
        }
    }
}
