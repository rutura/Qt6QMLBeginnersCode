/*

. This lecture won't be added in the Qt 6 course. It's a relic from the
        Qt 5 course and we'll follow the structure from the base
        source link below :

. Exploring signals and slots in QML :
        . base source : https://doc.qt.io/qt-6/qtqml-syntax-signals.html

     . Chapter outline :
            . 1. Signal handlers
            . 2. Property change signal handlers
            . 3. signal parameters
            . 4. Connections object
            . 5. Attached Signal handlers
            . 6. Adding signals to custom types
            . 7. Connecting custom signals to methods(slots)
            . 8. Connecting signals to signals
            . 9. Signals between QML Componets

. Another interesting read : https://doc.qt.io/qt-6/qtqml-syntax-objectattributes.html#attached-properties-and-attached-signal-handlers
  */

import QtQuick
import QtQuick.Window


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Signals and Slots Demo")

    property int increment: 50


    Rectangle {
        id : rectangleId
        width: 200 + increment
        height: 300
        color: "red"



        signal greet(string message) //Declare Signal

        onGreet: {
            //console.log("onGreet : greet signal emited, parameter is : "+ message)
        }
        onWidthChanged: {

        }

        function myGreeting(mMessage){
            console.log(" myGreeting slot called. The parameter is :" + mMessage)
            increment += 50 // increment = increment +50

        }

        MouseArea {
            anchors.fill: parent
            onClicked: {

                rectangleId.greet("Hello there") //Fire the signal

            }
        }

        Component.onCompleted: {
            greet.connect(rectangleId.myGreeting)
        }
    }
}
