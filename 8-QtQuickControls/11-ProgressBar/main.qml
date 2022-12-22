/*

        . Exploring ProgressbAR
            . The usual thing
            . The styles show up bad on Windows11 by default
                . We try Universal and Material to show how they look on
                    mobile and embedded devices

        . Improvise on the rest

  */

import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("ProgressBar")

    Column {
        width: parent.width
        spacing: 20

        Button {
            text : "Start"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                progressBarId.value = 78
            }
        }

        Dial {
            id : dialId
           from : 1
           to : 100
           value : 40
           anchors.horizontalCenter: parent.horizontalCenter
           onValueChanged: {
               progressBarId.value = value
           }

        }

        ProgressBar {
            id : progressBarId
           from : 1
           to : 100
           value : 40
           anchors.horizontalCenter: parent.horizontalCenter

        }

        ProgressBar {
            id : progressBarId1
            indeterminate: true

           anchors.horizontalCenter: parent.horizontalCenter

        }


    }
}
