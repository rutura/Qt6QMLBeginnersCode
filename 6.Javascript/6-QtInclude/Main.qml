/*

        . Qt.include also makes content from utilities2.js available in
            qml files importing utilities1.js

        . For example, in main.qml we can access the add function, even if
            it was just imported in utilities1.js.

        . Qt.include pollutes the scope of utilities1.js and is not advised
            in projects.

         . It's instead recommended to use js modules where you have greater control
            on what is exported from  your js files. We see that in the next lecture.

  */

import QtQuick
import "utilities1.js" as Utilities1

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Javascript Import Demo")

    Rectangle {
        width: 300
        height: 100
        color: "yellowgreen"
        anchors.centerIn: parent

        Text {
            text: "Click Me"
            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
            //console.log("The ages yield: " + Utilities1.combineAges(33,17))
            console.log("The ages yield: " + Utilities1.add(33,17))
            }
        }
    }
}

