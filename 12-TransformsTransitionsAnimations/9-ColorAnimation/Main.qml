import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("ColorAnimation")


    Rectangle{
        id: rectId
        width: 100
        height: 100
        color: "red"

        ColorAnimation{
            id: colorAnimationId
            target: rectId
            property: "color"
            from: rectId.color
            to: "blue"
            duration: 1000
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: function(){
            colorAnimationId.start()
        }
    }
}
