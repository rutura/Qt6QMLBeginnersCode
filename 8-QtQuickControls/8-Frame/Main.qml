/*

        . Exploring Frame
            . Gives us a logical grouping of elements
            . Doesn't give us any layout. You have to provide your own
                positioning.

         . Looks bad by default on Windows11, so we change the style to
            show different looks.

  */

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Frame")

    Frame {
        anchors.centerIn: parent

        ColumnLayout {

            Button {
                text: "Button1"
            }
            Button {
                text: "Button2"
            }
            Button {
                text: "Button3"
            }

        }
    }
}
