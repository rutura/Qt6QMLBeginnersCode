// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Window

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("GridView")


    ListModel {
        id: modelId

        ListElement {
            mNumber: 1
            mColor: "red"
        }
        ListElement {
            mNumber: 2
            mColor: "green"
        }
        ListElement {
            mNumber: 3
            mColor: "beige"
        }
        ListElement {
            mNumber: 4
            mColor: "yellowgreen"
        }
        ListElement {
            mNumber: 5
            mColor: "dodgerblue"
        }
        ListElement {
            mNumber: 6
            mColor: "lightyellow"
        }
        ListElement {
            mNumber: 7
            mColor: "pink"
        }
        ListElement {
            mNumber: 8
            mColor: "magenta"
        }
        ListElement {
            mNumber: 9
            mColor: "silver"
        }
    }

    GridView{
        id: mGridViewId
        anchors.fill: parent
        flow : GridView.FlowTopToBottom
        layoutDirection: Qt.RightToLeft
        model: modelId
        delegate: Rectangle {
            width: 100
            height: width
            color: mColor
            Text {
                text: mNumber
                anchors.centerIn: parent
                font.pointSize: 20

            }
        }
    }
}
