// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Keys Attached Property")

    Rectangle {
        id: containedRect
        anchors.centerIn: parent
        width: 300
        height: 50
        color: "dodgerblue"
        focus: true // The rectangle needs focus for key events to fire properly

        /*
        Keys.onDigit5Pressed:function(event) {
            console.log("Specific Signal: Pressed on Key 5")
            event.accepted = true
        }
        */


        /*
        Keys.onDigit5Pressed:function(event) {
           if ( event.modifiers === Qt.ControlModifier)
           {
               console.log("Pressed Control + 5")
           }else{
               console.log("Pressed regular 5")
           }
           event.accepted = false

        }
        */

        Keys.onPressed: function(event){
            if ((event.key === Qt.Key_5) && (event.modifiers & Qt.ControlModifier)){
                console.log("General Signal: Pressed Control + 5")
            }else if(event.key === Qt.Key_5){
                console.log("General Signal: Key 5 was pressed alone.")
            }
        }
    }
}
