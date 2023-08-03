// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick

Item {

    //Could have used an alias for rectColor here, but I just want you
    //to see that you can also do it this way, and rely on the property handler
    // to save the new color when applied.


    width: notifierRectId.width
    height: notifierRectId.height
    property int count: 0
    signal notify( string count)//Declare signal


    property Receiver target: null
    onTargetChanged: {
        notify.connect(target.receiveInfo)
    }

    property color rectColor: "black"
    onRectColorChanged: {
        notifierRectId.color = rectColor
    }



    Rectangle {
        id: notifierRectId
        width: 200
        height: 200
        color: "red"


        Text {
            id: displayTextId
            anchors.centerIn: parent
            font.pointSize: 20
            text: count
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                count++
                notify(count)
            }
        }
    }

}
