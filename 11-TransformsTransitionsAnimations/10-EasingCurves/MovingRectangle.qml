// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick

Item {

    property var backgroundColor
    property var startColor
    property var endColor
    property string easingText
    property int animDuration
    property var easingType
    property int containerwidth


    width: containerRectId.width
    height: containerRectId.height

    property int finalX: containerRectId.width - containedRectId.width

    Rectangle {
        id : containerRectId
        width: containerwidth
        height: 50
        color: backgroundColor

        Text {

            text: easingText
            anchors.centerIn: parent
        }

        Rectangle{
            id : containedRectId
            color: startColor
            width: 50
            height: 50
            border {width : 5 ; color : "black" }
            radius: 10


            MouseArea{
                anchors.fill: parent

                property bool toRight : false
                onClicked: {

                    if ( toRight === false)
                    {
                        toRight = true
                        //Animate X
                        mNumberAnimationId.to = finalX
                        mNumberAnimationId.start()

                        //Animate color
                        mColorAnimationId.from = startColor
                        mColorAnimationId.to = endColor
                        mColorAnimationId.start()

                        //Move to right
                    }else{
                        //Move to left
                        toRight = false
                        //Animate X
                        mNumberAnimationId.to = 0
                        mNumberAnimationId.start()

                        //Animate color
                        mColorAnimationId.from = endColor
                        mColorAnimationId.to = startColor
                        mColorAnimationId.start()
                    }

                }
            }
            NumberAnimation{
                id : mNumberAnimationId
                target: containedRectId
                property : "x"
                easing.type : easingType
                to : finalX
                duration: animDuration
            }


            ColorAnimation {
                id : mColorAnimationId
                target: containedRectId
                property : "color"
                from: startColor
                to: endColor
                duration: animDuration
            }
            Component.onCompleted: {
                //console.log("The width of the contained rect is :" + parent.width)
            }

        }
    }

}
