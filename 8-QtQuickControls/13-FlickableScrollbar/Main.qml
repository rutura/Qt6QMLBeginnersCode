// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Flickable and Scrollbar")

    Flickable{

        width: parent.width
        height: parent.height
        contentHeight: mColumnId.implicitHeight


        Column{
            id: mColumnId
            anchors.fill: parent

            Rectangle {
                color: "red"
                width: parent.width
                height: 200
                Text {
                    anchors.centerIn: parent
                    text: "Element 1"
                    font.pointSize: 30
                    color: "white"
                }
            }


            Rectangle {
                color: "blue"
                width: parent.width
                height: 200
                Text {
                    anchors.centerIn: parent
                    text: "Element 2"
                    font.pointSize: 30
                    color: "white"
                }
            }

            Rectangle {
                color: "yellow"
                width: parent.width
                height: 200
                Text {
                    anchors.centerIn: parent
                    text: "Element 3"
                    font.pointSize: 30
                    color: "white"
                }
            }

            Rectangle {
                color: "magenta"
                width: parent.width
                height: 200
                Text {
                    anchors.centerIn: parent
                    text: "Element 4"
                    font.pointSize: 30
                    color: "white"
                }
            }
            Rectangle {
                color: "yellowgreen"
                width: parent.width
                height: 200
                Text {
                    anchors.centerIn: parent
                    text: "Element 5"
                    font.pointSize: 30
                    color: "white"
                }
            }
            /*
            Rectangle {
                color: "red"
                width: parent.width
                height: 200
                Text {
                    anchors.centerIn: parent
                    text: "Element 6"
                    font.pointSize: 30
                    color: "white"
                }
            }
            Rectangle {
                color: "beige"
                width: parent.width
                height: 200
                Text {
                    anchors.centerIn: parent
                    text: "Element 7"
                    font.pointSize: 30
                    color: "white"
                }
            }
            Rectangle {
                color: "royalblue"
                width: parent.width
                height: 200
                Text {
                    anchors.centerIn: parent
                    text: "Element 8"
                    font.pointSize: 30
                    color: "white"
                }
            }
            */



        }

        ScrollBar.vertical: ScrollBar{}
    }
}
