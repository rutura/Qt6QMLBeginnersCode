/*
    . Go through the book on qt 6 and build this example live
    . Take reference from what you did in the Qt 5 course.

  */
import QtQuick
import QtQuick.Window

Window {
    id : root
    visible: true
    width: 640
    height: 480
    title: qsTr("Animation Demo : Bouncing Ball")

    property int duration: 1000


    Rectangle {
        id: sky
        width: parent.width
        height: 200
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#0080FF" }
            GradientStop { position: 1.0; color: "#66CCFF" }
        }
    }
    Rectangle {
        id: ground
        anchors.top: sky.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#00FF00" }
            GradientStop { position: 1.0; color: "#00803F" }
        }
    }

    Image {
        id: ball
        x: 0; y: root.height-height
        source: "qrc:/images/soccerball.png"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                ball.x = 0;
                ball.y = root.height-ball.height;
                ball.rotation = 0;
                anim.restart()
            }
        }
    }

    ParallelAnimation{
        id : anim
        SequentialAnimation {

            NumberAnimation {
                target: ball
                properties: "y"
                to: 20
                duration: root.duration * 0.4
                easing.type: Easing.OutCirc
            }
            NumberAnimation {
                target: ball
                properties: "y"
                to: root.height-ball.height
                duration: root.duration * 0.6
                easing.type: Easing.OutBounce
            }
        }

        NumberAnimation {
            // X1 animation
            target: ball
            properties: "x"
            to: 400
            duration: root.duration
        }

        RotationAnimation {
                target: ball
                properties: "rotation"
                to: 720
                duration: root.duration
            }
    }



}
