// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import "utilities1.mjs" as Utilities1
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Javascript Import Demo")

    Rectangle {

        width: 300
        height: 100
        color: "yellowgreen"
        anchors.centerIn: parent
        Text {
            text: "Click Me"
            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
               //Calling a properly exported mathod
                /*
               console.log("The ages yield: " + Utilities1.combineAges(33,17))
                */


                //Can't call a method that's not exported: subtract isn't exported from utilities2.mjs
                console.log("Age diff: " + Utilities1.ageDiff(33,17))

                //Just because add is usable from utilities1.js doesn't mean main.qml
                 // can use it. utilities2.js doesn't export it.
                 //console.log ("The sum is: " + Utilities1.add(33,17))//Error
            }
        }
    }
}
