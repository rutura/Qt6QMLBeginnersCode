// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Connect Signal to Method")

    Rectangle{
        id: rectId
        width: 300
        height: 300
        color: "dodgerblue"

        //Set up the signal
        signal greet(string message)

        //WE DON'T WANT TO USE THIS THIS TIME.
        // Once you set up the signal, Qt setup a signal handler automatically
        /*
        onGreet: function(message){
            console.log("Greeting with message: "+ message)
        }
        */

        //We want to connect, not to a built in signal handler, but to a custom
        //regular function
        function respond_your_way(message){
            console.log("Responding our way; greeting with message: "+ message)
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                //Fire the signal by just calling it like a function
                rectId.greet("The sky is blue")
            }
        }
        Component.onCompleted: {
            //Make the connection explicitly
            rectId.greet.connect(rectId.respond_your_way)
        }
    }
}
