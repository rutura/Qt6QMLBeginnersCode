// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Custom Signals")

    Rectangle{
        id: rectId
        width: 300
        height: 300
        color: "dodgerblue"
        anchors.left: parent.left

        //Set up the signal
        signal greet(string message)
        signal forward_greeting(string message)

        //We want to connect, not to a build in signal handler, but to a custom
        //regular function
        function respond_your_way(message){
            console.log("Responding our way;Greeting with message: "+message)
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                //Fire the signal by just calling it like a function
                rectId.greet("The sky is blue")
            }
        }
        Component.onCompleted: {
            //Connect a signal to another signal
            rectId.greet.connect(rectId.forward_greeting)
            //Respond to the final signal
            rectId.forward_greeting.connect(rectId.respond_your_way)
        }


    }
}
