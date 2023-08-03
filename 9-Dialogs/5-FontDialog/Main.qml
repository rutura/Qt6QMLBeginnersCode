// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Window
import QtQuick.Dialogs
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("FontDialog Demo")

    Column {
        spacing: 20
        anchors.centerIn: parent

        Button{
            text: "Change Font"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                fontDialogId.open()
            }
        }

        Text {
            id: textId
            text: "Hello World"
        }

        FontDialog{
            id: fontDialogId
            title: "Choose Font"
            currentFont: Qt.font({ family: "Arial", pointSize: 24, weight: Font.Normal })

            onAccepted: {
                console.log("Chose font: "+selectedFont)
                textId.font = fontDialogId.selectedFont
            }
            onRejected: {
                console.log("Dialog rejected")
            }
        }
    }
}






























