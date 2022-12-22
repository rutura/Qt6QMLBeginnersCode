import QtQuick

Item {

    //Why do we use an alias here ?
    property color rectColor: "black"
    width: notifierRectId.width
    height: notifierRectId.height
    property int count: 0
    signal notify( string count)//Declare signal
    property Receiver target : null

    onTargetChanged: {
        notify.connect(target.receiveInfo)
    }
    onRectColorChanged: {
        notifierRectId.color = rectColor
    }


    Rectangle {
        id : notifierRectId
        width: 200
        height: 200
        color: "red"


        Text {
            id : displayTextId
            anchors.centerIn: parent
            font.pointSize: 20
            text : count
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                count++
                notify(count)
            }
        }
    }

}
