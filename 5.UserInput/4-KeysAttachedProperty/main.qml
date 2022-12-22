/*
        . Exploring the Keys attached property
            . You attach it to components that wouldn't know how to
                handle key events otherwise

             . Handle digits without modifiers :
                .  Keys.onDigit1Pressed
                .  Keys.onDigit5Pressed:
                .         Keys.onPressed: function(event){
                                if ( event.key ===Qt.Key_1)
                                {
                                     console.log("General Signal :Pressed on Key 1")
                                }
                           }
                . Then talk about modifiers and add them in the code you already have
                    . Do this first :
                                    Keys.onDigit5Pressed:function(event) {
                                       if ( event.modifiers === Qt.ControlModifier)
                                       {
                                           console.log("Pressed Control + 5")
                                       }else{
                                           console.log("Pressed regular 5")
                                       }
                                    }

                   . Then this :
                            Keys.onPressed: function(event){
                                if ( event.key ===Qt.Key_1)
                                {
                                     console.log("General Signal :Pressed on Key 1")
                                }

                                if ((event.key === Qt.Key_5) && (event.modifiers & Qt.ControlModifier)){
                                    console.log("Pressed Control + 5")
                                }

                            }

  */

import QtQuick
import QtQuick.Window

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Keys Attached Property")

    Rectangle {
        id : containedRect
        anchors.centerIn: parent
        width : 300
        height: 50
        color: "dodgerblue"
        focus: true

        Keys.onDigit1Pressed:function(event) {
            console.log("Specific Signal : Pressed on Key 1")
            //event.accepted = true

        }

        Keys.onDigit5Pressed:function(event) {
           if ( event.modifiers === Qt.ControlModifier)
           {
               console.log("Pressed Control + 5")
           }else{
               console.log("Pressed regular 5")
           }
        }

        /*
        Keys.onPressed: function(event){
            if ( event.key ===Qt.Key_1)
            {
                 console.log("General Signal :Pressed on Key 1")
            }

            if ((event.key === Qt.Key_5) && (event.modifiers & Qt.ControlModifier)){
                console.log("Pressed Control + 5")
            }

        }
        */
    }
}
