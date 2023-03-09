/*

        . Working with custom componets in QML
            . We start out by exploring Row and Column
            . Then we build the button in the main.qml file
            . We export the button code to its own qml file
            . Encapsulate some properties as invisible from the outside
            . Take notes from the Qt 5 course.

  */


import QtQuick


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")


//    Row {
//        spacing: 20
//        Rectangle {
//            width : 300
//            height: 100
//            color: "red"
//        }
//        Rectangle {
//            width : 300
//            height: 100
//            color: "blue"
//        }
//    }


    Column {
        MButton{
            buttonText : "Button1"

            onButtonClicked: {
                console.log("Clicked on Button 1 from main file")
            }

        }

        MButton{
            buttonText: "Button2"
            onButtonClicked: {
                console.log("Clicked on Button 2 from main file")
            }

        }

    }


}
