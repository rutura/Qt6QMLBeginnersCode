/*
    . Exploring the Repeater
    . The Repeater type is used to create a large number of similar items
    . The Repeater type creates all of its delegate items when the repeater
        is first created. This can be inefficient if there are a large
        number of delegate items and not all of the items are required
        to be visible at the same time. If this is the case, consider
        using other view types like ListView (which only creates delegate
        items when they are scrolled into view) or use the Dynamic Object
        Creation methods to create items as they are required.

    . Use info above , docs and Qt5 course to improvise on this.
  */
import QtQuick
import QtQuick.Window

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Repeater ")

    Flickable {
        contentHeight: columnId.implicitHeight
        anchors.fill : parent


        Column {
            id : columnId
            anchors.fill: parent
            spacing: 2

            Repeater {

                model : 100
               // model: ["Jan","Feb","March","April","May","June","July","Aug","Sept","Oct","Nov","Dec"]
                delegate : Rectangle {
                    width: parent.width
                    height: 50
                    color: "dodgerblue"
                    Text {
                        anchors.centerIn: parent
                        text: modelData
                        font.pointSize: 20
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            console.log("Clicked on :"+modelData)
                        }
                    }
                }

            }
        }
    }
}
