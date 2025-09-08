import QtQuick

Window {
    id: rootId
    width: 640
    height: 480
    visible: true
    title: qsTr("Animations Intro")
    property bool running: false

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

            PropertyAnimation on x {
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

        MouseArea{
            anchors.fill: parent
            onPressed: function(){
                rootId.running = true
            }
            onReleased: function(){
                rootId.running = false
            }
        }

    }
}
