/*
    . Exploring how to import js from other js files

    . Importing JS : https://doc.qt.io/qt-6/qtqml-javascript-imports.html

    . Js code will be stored in regular js files

    . Key syntax :
        . .import "utilities2.js" as Utilities2  //The dot needs to be there
        .  This syntax  is an extension to JavaScript provided by the QML
            engine and will work also with non-modules (mjs). As an extension
            superseded by the ECMAScript standard, its usage is discouraged

        . We'll see how to work with javascript modules (.mjs) in a later lecture

    . By importing utilities2.js into utilities1.js, you don't get to directly
        use the add function from main.qml like so :
            onClicked: {
                 value = Utilities1.add(33,17) //Error

            }

     . If that's what you want, you can use Qt.include, as we'll see in a
        later lecture.




  */
import QtQuick
import QtQuick.Window
import "utilities1.js" as Utilities1
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Javascript Import Demo")

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
                //console.log("Our ages combined yield :" + Utilities1.combineAges(33,17))
                // value = Utilities1.add(33,17) //Error
            }
        }
    }
}

