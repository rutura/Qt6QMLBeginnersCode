/*
    . Exploring Inline Models
    . You can specify a list of things that the model will display in a
        square bracketted list.

    . The delegate fetches what to display throught the modelData property.

  */

import QtQuick
import QtQuick.Window

Window {
    id: rootId
    visible: true
    width: 640
    height: 480
    title: qsTr("Inline Model")


    ListView {
        id: mListViewId
        anchors.fill: parent
        //model : ["January", "February", "March", "April", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"]
        model: 100
        delegate: Rectangle {
            id: rectangleId
            width: rootId.width
            height: 50
            color: "beige"
            border.color: "yellowgreen"
            radius: 10

            Text {
                id: textId
                anchors.centerIn: parent
                font.pointSize: 20
                text: modelData
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on: "+ modelData)
                }
            }
        }
    }
}
