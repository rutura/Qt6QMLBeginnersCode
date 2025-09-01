import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("SmoothedAnimation")

    /*
    Rectangle{
        id: containerRectId
        anchors.fill: parent
        color: "beige"

        Rectangle{
            id: containedRectId
            width: 100
            height: 100
            x: 50
            y: 50
            color: "dodgerblue"


            SmoothedAnimation{
                id: smoothedAnimationId
                target: containedRectId
                property: "x"
                duration: 2000
            }
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: function(mouse){
            smoothedAnimationId.from = containedRectId.x
            smoothedAnimationId.to = mouse.x
            smoothedAnimationId.start()
        }
    }
    */

    Rectangle{
        anchors.fill: parent
        color: "lightgray"

        Rectangle {
            //The rectangle doing the tracking
            width: 60; height: 60
            x: rect1.x - 5; y: rect1.y - 5
            color: "green"

            Behavior on x { SmoothedAnimation { velocity: 200 } }
            Behavior on y { SmoothedAnimation { velocity: 200 } }
        }

        Rectangle {
            //The rectangle being tracked.
            id: rect1
            width: 50; height: 50
            color: "red"
        }

        focus: true
        Keys.onRightPressed: rect1.x = rect1.x + 100
        Keys.onLeftPressed: rect1.x = rect1.x - 100
        Keys.onUpPressed: rect1.y = rect1.y - 100
        Keys.onDownPressed: rect1.y = rect1.y + 100
    }

}
