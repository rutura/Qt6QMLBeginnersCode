// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Window

Window {
    id: rootId
    visible: true
    width: 640
    height: 480
    title: qsTr("Grouped Animations")
    property int animationDuration: 500
    property bool going_down: false


    function animateCircle() {
        if( going_down === false){
            //Go down
            going_down = true;
            xAnimationId.from = 0
            xAnimationId.to = rootId.width - circleId.width
            yAnimationId.from = 0
            yAnimationId.to = rootId.height - circleId.height

        }else{
            //Go up
            going_down = false;
            xAnimationId.from = rootId.width - circleId.width
            xAnimationId.to = 0
            yAnimationId.from = rootId.height - circleId.height
            yAnimationId.to = 0
        }
        groupedAnimId.start()
    }

    Rectangle {
        anchors.fill: parent
        color: "gray"

        Rectangle {
            id: circleId
            width: 100
            height: 100
            radius: 70
            color: "yellowgreen"
        }

        //SequentialAnimation{
        ParallelAnimation{
            id: groupedAnimId

            //Animate X
            NumberAnimation{
                id: xAnimationId
                target: circleId
                property : "x"
                duration: animationDuration

            }

            //Animate Y
            NumberAnimation{
                id: yAnimationId
                //easing.type: Easing.OutBounce
                //easing.amplitude: 3
                target: circleId
                property : "y"
                duration: animationDuration
            }
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                animateCircle()
            }
        }
    }
}
