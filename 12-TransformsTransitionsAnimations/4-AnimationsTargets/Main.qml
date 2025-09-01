import QtQuick

Window {
    id: rootId
    width: 640
    height: 480
    visible: true
    title: qsTr("Animations with targets")

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

            PropertyAnimation {
                id: xAnimationId
                target: containedRectId
                property: "x"
                to: 530
                duration: 2000
            }

            NumberAnimation {
                id: yAnimationId
                target: containedRectId
                property: "y"
                to: 300
                duration: 2000
            }

            RotationAnimation {
                id: rotationAnimationId
                target: containedRectId
                property: "rotation"
                to: 600
                duration: 2000
            }
        }

        MouseArea{
            anchors.fill: parent
            onPressed: function(){
                //Start the animations
                xAnimationId.start()
                yAnimationId.start()
                rotationAnimationId.start()
            }
            onReleased: function(){
                ///Stop the animations
                xAnimationId.stop()
                yAnimationId.stop()
                rotationAnimationId.stop()
            }
        }
    }

}
