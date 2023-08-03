// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick

FocusScope {

    width: containerRectId.width
    height: containerRectId.height
    property alias color: containerRectId.color

    Rectangle {
        id : containerRectId
        width: 300
        height: 50
        color: "beige"
        focus: true

        Text {
            id : textId
            anchors.centerIn: parent
            text: "Default"
        }

        Keys.onPressed:function(event) {
            if(event.key === Qt.Key_1)
            {
               textId.text = "Pressed on Key1"
            }else  if(event.key === Qt.Key_2)
            {
               textId.text = "Pressed on Key2"
            }else{
                textId.text = "Pressed on another key : "+ event.key
            }
        }
    }

}


