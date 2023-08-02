/*

        . This section introduces animations
        . We do that using:
            . PropertyAnimation on x
            . NumberAnimation y
            . RotationAnimation on rotation

       . We set up animations through property value sources:
            . the syntax NumberAnimation on ...

       . This just we start from somewhere. We'll see targets and other things
            later on in the chapter.

       . The animation will automatically run

       . We can use a property binding with the running property
            control when the animation starts.

  */

import QtQuick
import QtQuick.Window

Window {
    id: rootId
    visible: true
    width: 640
    height: 480
    title: qsTr("Animations: Property value sources")
    property bool running: false

    Rectangle {
        id: containerRectId
        anchors.fill: parent
        color: "beige"


        Rectangle {
            id: containedRectId
            width: 100
            height: 100
            x: 50
            y: 50
            color: "dodgerblue"



            PropertyAnimation on x { // The property value  source syntax.
                to: 530
                duration: 2000
                running: rootId.running
            }


            NumberAnimation on y {
                to: 300
                duration: 2000
                running: rootId.running
            }


            RotationAnimation on rotation {
                to: 600
                duration: 2000
                running: rootId.running
            }

        }

        MouseArea {
            anchors.fill: parent
            /*
            onClicked: {
                containedRectId.x = 530
            }
            */

            onPressed: {
               rootId.running = true

            }
            onReleased: {
              rootId.running = false
            }

        }
    }
}


