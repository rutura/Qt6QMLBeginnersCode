/*
        . Exploring the usage of the embedded SQLite database
        . Storing data
        . Reading data
        . Showing the location of the database files on the system(main.cpp)
        . Use the Qt 5 course as a reference and make better slides.

  */

import QtQuick
import QtQuick.LocalStorage
import QtQuick.Dialogs
import "Database.js" as JS

Window {
    id : rootId
    visible: true
    width: 640
    height: 480
    title: qsTr("SQLite")
    property var db ;

    Rectangle{
        id : rectId
        anchors.fill: parent
        color: "red"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                colorDialogId.open()

            }

            ColorDialog {
                id: colorDialogId
                title: "Please choose a color"
                onAccepted: {
                    console.log("The new color is : "+ selectedColor)
                    rectId.color = selectedColor
                }
                onRejected: {
                    console.log("Canceled")
                }
            }
        }
    }

    Component.onCompleted: {
        //Read data
        JS.dbInit()
        JS.readData()
    }

    Component.onDestruction: {
        JS.storeData()
    }
}
