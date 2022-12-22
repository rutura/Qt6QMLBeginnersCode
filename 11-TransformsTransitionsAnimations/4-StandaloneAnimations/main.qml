/*
        . Exploring standalone animations
        . Animations in which you explicitly specify the target element
            to be animated.
        . You have to explicitly start the animation by default
        . Improvise and use the Qt 5 course as a reference if necessary.

  */

import QtQuick
import QtQuick.Window

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Standalone Animation")

    Rectangle {
        id  : containerRectId
        anchors.fill: parent
        color: "beige"

        Rectangle {
            id : containedRectId
            width: 100
            height: 100
            color: "dodgerblue"
            x : 50; y : 50

            NumberAnimation {
                id : mXAnimationId
                target: containedRectId
                property: "x"
                duration: 2000
                to : 530

            }

            RotationAnimation{
                id : mRotationAnimation
                target: containedRectId
                property : "rotation"
                to : 2000
                duration: 2000
            }
        }

        MouseArea {
            anchors.fill: parent
            onPressed : {
                mXAnimationId.start()
                mRotationAnimation.start()

            }
            onReleased: {
                mXAnimationId.stop()
                mRotationAnimation.stop()

            }
        }
    }
}
