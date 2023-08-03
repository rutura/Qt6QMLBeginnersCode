// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick.Window
import QtQuick.Controls
import QtQuick.Dialogs


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("FileDialog")

    Column {
        spacing: 20
        anchors.centerIn: parent

        Button{
            text: "Choose File"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                fileDialogId.open()
            }
        }

        Text {
            id: textId
            text: "Use hasn't chosen yet"
            wrapMode: Text.Wrap
        }

        FileDialog{
            id: fileDialogId
            title: "Choose File"
            nameFilters: ["Text files (*.txt)", "HTML files (*.html *.htm)", "Images (*.jpg *.png)"]

            onAccepted: {
                textId.text = selectedFile
            }

            onRejected: {
                textId.text = "Dialog rejected"
            }
        }
    }
}























