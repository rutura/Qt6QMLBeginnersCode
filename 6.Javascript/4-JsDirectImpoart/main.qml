/*
        . Importing js files : https://doc.qt.io/qt-5/qtqml-javascript-imports.html
        . You add them as QML files in the CMake file
        . This lecture : Import js into QML
            . The syntax :
                . import "utilities1.js" as Utilities1
        . What if we want to import JS from another js file? That's indirect import.
            We cover that in the next lecture.

  */

import QtQuick
import QtQuick.Window
import "utilities1.js" as Utilities1


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Javascript Direct Import")

    Rectangle {
        width : 300
        height: 100
        color: "yellowgreen"
        anchors.centerIn: parent

        Text {
            text : "Click Me"
            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
               //console.log("Hello there")
               Utilities1.greeting()
            }
        }
    }
}
