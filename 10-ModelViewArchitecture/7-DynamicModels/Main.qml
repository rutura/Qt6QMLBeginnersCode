// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Dynamic Models Demo")

    ListModel {
        id: mListModel

        ListElement {
            firstName: "John"; lastName: "Snow"
        }
        ListElement {
            firstName: "Nicholai"; lastName: "Itchenko"
        }
        ListElement {
            firstName: "Mitch"; lastName: "Mathson"
        }
        ListElement {
            firstName: "Ken"; lastName: "Kologorov"
        }
        ListElement {
            firstName: "Vince"; lastName: "Luvkyj"
        }


    }

    ColumnLayout {
        anchors.fill: parent
        ListView{
            id: mListViewId
            model: mListModel
            delegate: delegateId
            Layout.fillWidth : true
            Layout.fillHeight: true

        }



        Button {
            text: "Add Item"
            Layout.fillWidth : true
            onClicked: {
               mListModel.append({"firstName": "Daniel", "lastName": "Gakwaya"})
            }
        }


        Button {
            text: "Clear"
            Layout.fillWidth : true
            onClicked: {
                mListModel.clear()

            }
        }

        Button {
            text: "Delete Item at index 2"
            Layout.fillWidth: true
            onClicked: {
                if ( 2  < mListViewId.model.count){
                    mListModel.remove(2,1)
                }else{
                    console.log("index is invalid")
                }
            }
        }

        Button {
            text: "Set item at index 1"
            Layout.fillWidth: true
            onClicked: {
                mListModel.set(1,{"firstName": "John", "lastName": "Doe"})

            }
        }

    }

    Component {
        id: delegateId
        Rectangle {
            id: rectangleId
            width: mListViewId.width
            height: 50
            color: "beige"
            border.color: "yellowgreen"
            radius: 14

            Text {
                id: textId
                anchors.centerIn: parent
                text : firstName + " " + lastName
                font.pointSize: 20
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on: " + firstName + " " + lastName)
                }
            }
        }
    }
}
