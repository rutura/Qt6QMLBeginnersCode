// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Signal Parameters")

    Rectangle{
        id: rect
        width: 150
        height: 150
        color: "red"

        MouseArea{
            anchors.fill: parent

            /*
            onClicked: {
                //Deprecated
                console.log(mouse.x)
            }
            */

            //Explicit Javascript function
            /*
            onClicked: function(mouse_param){
                console.log(mouse_param.x)
            }
            */

             //Arrow function
             onClicked: (mouse_param) => console.log(mouse_param.x)

        }
    }
}
