// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Dialogs

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("MessageDialog ")

    Button{
        text: "Push Me"
        onClicked: {
            messageDialog.open()
        }
    }

    MessageDialog {
        id: messageDialog
        title: "Message"
        text: "Lie down and watch the sky."
        buttons: MessageDialog.Ok | MessageDialog.Close
        onAccepted: {
            console.log("Dialog accepted.")
        }
        onRejected: {
            console.log("Dialog rejected")
        }
    }
}
