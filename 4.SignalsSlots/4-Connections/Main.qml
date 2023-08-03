// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQml
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Connections")

    Rectangle{
        id: rectId
        width : 200
        height: 200
        color: "blue"

        MouseArea{
            id:mouseAreaId
            anchors.fill: parent
        }
    }

    Connections  {
        target : mouseAreaId
        function onClicked(){
            console.log("Hello")
        }
        function onDoubleClicked(mouse){
            console.log("Doubleclicked at: "+mouse.x)
        }
    }
}
