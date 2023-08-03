// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("BusyIndicator")

    ColumnLayout {
        width: parent.width
        //height: parent.height

        BusyIndicator{
            id: busyIndicatorId
            Layout.alignment: Qt.AlignHCenter
            running: false
            //visible: false
        }

        ColumnLayout {
            Button{
                id: button1
                text: "Running"
                Layout.fillWidth: true
                onClicked: {
                    busyIndicatorId.running = true
                    //busyIndicatorId.visible = true

                }
            }

            Button {
                id: button2
                text: "Not Running"
                Layout.fillWidth: true
                onClicked: {
                    busyIndicatorId.running = false
                    //busyIndicatorId.visible = false

                }
            }
        }

        /*
        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Rectangle {
                anchors.fill: parent
                color: "red"
            }
        }
        */

    }
}
