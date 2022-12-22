/*
        . When you define a property, Qt automatically sets up
                a signal that's fired everytime something changes about the property

        . The signal is named on[Propertyname with first leter capitalized]changed

        . Show the signal for existing properties in the app liek width and height.

  */

import QtQuick

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Properties and Handlers Demo")

    property string mFirstName: "Daniel"
    onMFirstNameChanged: {
        console.log("The firsname changed to :"+ mFirstName)
    }



    Rectangle {
        width : 300
        height: 100
        color: "greenyellow"
        anchors.centerIn: parent

        MouseArea{
            anchors.fill: parent
            onClicked: {
                mFirstName = "John"

            }
        }
    }
    Component.onCompleted: {
        console.log("The firstname is :"+mFirstName)
    }
}
