/*

    . Exploring grouped animations
        . Sequencialanimation
        . ParallelAnimation

     . Start without the easing
     . Then show the easing.
    . Improvise as you go
  */

import QtQuick
import QtQuick.Window

Window {
    id : rootId
    visible: true
    width: 640
    height: 480
    title: qsTr("Grouped Animations")
    property int animationDuration: 500

    Rectangle {
        anchors.fill: parent
        color: "gray"

        Rectangle {
            id : circleId
            width: 100
            height: 100
            radius: 70
            color: "yellowgreen"
        }

        //SequentialAnimation{
        ParallelAnimation{
            id : groupedAnimId

            //Animate X
            NumberAnimation{
                target: circleId
                property : "x"
                to : rootId.width - circleId.width
                from : 0
                duration: animationDuration

            }

            //Animate Y
            NumberAnimation{
                easing.type: Easing.OutBounce
                easing.amplitude: 3
                target: circleId
                property : "y"
                to : rootId.height - circleId.height
                from : 0
                duration: animationDuration

            }
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                console.log("Clicked on gray")
                //Reset the values : x and y
                circleId.x = 0
                circleId.y = 0

                //Animate
                groupedAnimId.start()
            }
        }

    }
}
