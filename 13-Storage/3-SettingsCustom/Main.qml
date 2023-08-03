// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Dialogs
import QtCore

Window {
    id: rootId
    visible: true

    //2.Read data from the Settings object
    x: windowSettingsId.x
    y: windowSettingsId.y
    width: windowSettingsId.width
    height: windowSettingsId.height

    title: qsTr("Custom Settings")

    Rectangle {
        id : rectId
        anchors.fill: parent

        //2.Read data from the Settings object
        color: colorSettingsId.rectColor

        MouseArea{
            anchors.fill: parent
            onClicked: {
                colorDialogId.open()
            }

            ColorDialog {
                id: colorDialogId
                title: "Please choose a color"
                onAccepted: {
                    console.log("The new color is: "+ selectedColor)
                    rectId.color = selectedColor
                }
                onRejected: {
                    console.log("Canceled")
                }
            }
        }
    }


    //1. Don't use property aliases in the Settings objects
    Settings{
        id: windowSettingsId
        category: "window"
        property int x: 300
        property int y: 300
        property int width: 640
        property int height: 480
    }

    Settings{
        id: colorSettingsId
        category: "colors"
        property color rectColor: "red"
    }

    //3.Save the data when the Window object is about to die
    Component.onDestruction: {
        //Save the window properties
        windowSettingsId.x = rootId.x
        windowSettingsId.y = rootId.y
        windowSettingsId.width = rootId.width
        windowSettingsId.height = rootId.height

        //Save the color property
        colorSettingsId.rectColor = rectId.color
    }
}
