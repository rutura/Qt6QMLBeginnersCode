// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick.Window
import QtQuick.Controls
import QtQuick.Dialogs


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("FolderDialog")

    Column {
        spacing: 20
        anchors.centerIn: parent

        Button{
            text: "Choose Folder"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                folderDialogId.open()
            }
        }

        Text {
            id: textId
            text : "Use hasn't chosen yet"
            wrapMode: Text.Wrap
        }

        FolderDialog{
            id: folderDialogId
            title: "Choose Folder"

            onAccepted: {
                textId.text = selectedFolder

            }

            onRejected: {
                textId.text = "Dialog rejected"
            }
        }
    }
}























