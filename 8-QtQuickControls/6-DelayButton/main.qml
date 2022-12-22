/*

        . Exploring DelayButton
            . Used to delay activation of a button
            . Once the delay runs out , the button is activated
            . The button doesn't process clicks until it is activated
            . We can track the activation progress.

        . Refer to the Qt 5 course when confused.

  */

import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("DelayButton")

    Column {
        width: parent.width
        spacing: 40

        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "Delayed Button. Use it when you want to prevent accidental clicks"
            font.pointSize: 15
        }

        DelayButton {
            property bool activated: false
            text: "DelayButton"
            anchors.horizontalCenter: parent.horizontalCenter
            delay: 1000

            onPressed: {
                if(activated === true)
                {
                    console.log("Button is Clicked")
                    activated = false;
                }
            }

            onActivated: {
                console.log("Button Activated")
                activated = true
            }

            onProgressChanged:{
                console.log(progress)
            }
        }

    }
}
