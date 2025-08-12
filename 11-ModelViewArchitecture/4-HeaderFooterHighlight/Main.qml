// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Window

Window {
    id: rootId
    visible: true
    width: 640
    height: 480
    title: qsTr("Header Footer and Highlight")

    ListView {
        id: mListViewId
        anchors.fill: parent
        header: headerId
        footer: Rectangle{
            width: rootId.width
            height: 50
            color: "dodgerblue"
        }
        highlight: Rectangle{
            width: rootId.width
            color: "blue"
            radius: 14
            border.color: "yellowgreen"
            z: 3
            opacity: 0.1
        }

        model: ["January", "February", "March", "April", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"]
        delegate: Rectangle {
            id: delegateId
            width: rootId.width
            height: 50
            color: "beige"
            border.color: "yellowgreen"
            radius: 10

            Text {
                id: textId
                anchors.centerIn: parent
                font.pointSize: 20
                text : modelData
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on: "+ modelData)
                    mListViewId.currentIndex = index
                }
            }
        }
    }

    Component {
        id: headerId
        Rectangle {
            id: headerRectId
            width: rootId.width
            height: 50
            color: "yellowgreen"
            border {color: "#9EDDF2"; width: 2}

            Text {
                anchors.centerIn: parent
                text: "Months"
                font.pointSize: 20
            }

        }
    }
}
