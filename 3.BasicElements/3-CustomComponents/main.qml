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
    title: qsTr("Custom Components Demo")

    //You can change Column to Row to have rectangles laid out horizontally
    /*
    Column {
        spacing: 20
        Rectangle {
            width : 300
            height: 100
            color: "red"
        }
        Rectangle {
            width : 300
            height: 100
            color: "blue"
        }
    }
    */

    /*
    //Button code living in the main.qml file
    Rectangle {
        id : containerRectId
        color: "red"
        border { color: "blue"; width : 3}

        //The width and height of the rectangle depend on the dimensions of the text in buttonTextId
        width: buttonTextId.implicitWidth + 20
        height: buttonTextId.implicitHeight + 20

        Text {
            id : buttonTextId
            text : "Button"
            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("Clicked on the button")
            }
        }
    }
    */

    /*
    SButton{
        id : button1
        buttonText: "Button1"
        color : "gray"
    }
    SButton{
        id: button2
        buttonText: "Button2"
        color : "yellow"
        anchors.top : button1.bottom
    }
    */



    Column {
        MButton{
            buttonText : "Button1"

            onButtonClicked: {
                console.log("Clicked on button1")
            }

        }

        MButton{
            buttonText: "Button2"
            onButtonClicked: {
                console.log("clicked on button2")
            }

        }

    }


}
