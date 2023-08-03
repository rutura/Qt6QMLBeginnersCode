// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Window

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Repeater")

    Flickable {
        contentHeight: columnId.implicitHeight
        anchors.fill : parent


        Column {
            id: columnId
            anchors.fill: parent
            spacing: 2

            Repeater {
                id: repeaterId

                //model: 15
                model: ["Jan", "Feb", "March"]
                delegate: Rectangle {
                    width: parent.width
                    height: 50
                    color: "dodgerblue"

                    Text {
                        anchors.centerIn: parent
                        text: modelData
                        font.pointSize: 20
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            console.log("Clicked on: "+modelData)
                            console.log("count: " + repeaterId.count)
                        }
                    }
                }

            }
        }
    }
}
