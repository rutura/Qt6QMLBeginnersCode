// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Window

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Section  (Decoration)")


    ListModel {
        id: mListModel

        ListElement {
            names: "Seth Moris"; company: "GOOGLE"
        }
        ListElement {
            names: "Miriam Katv"; company: "GOOGLE"
        }

        ListElement {
            names: "Eugene Fitzgerald"; company: "GOOGLE"
        }
        ListElement {
            names: "Kantkl Vikney"; company : "GOOGLE"
        }
        ListElement {
            names: "Mary Beige"; company: "TESLA"
        }
        ListElement {
            names: "Bamba Pikt"; company: "TESLA"
        }
        ListElement {
            names: "Jeffery Mor"; company: "SIEMENS"
        }
        ListElement {
            names: "Pick Mo"; company: "SIEMENS"
        }

    }


    ListView {
        id: mListViewId
        anchors.fill: parent
        model : mListModel
        delegate: delegateId
        section {
            property: "company"
            criteria: ViewSection.FullString
            delegate: Rectangle{
                id: sectionRectId
                width : parent.width
                height: 50
                color: "red"
                border.color: "yellowgreen"
                radius: 14

                Text {
                    id: sectionTextId
                    text : section
                    anchors.centerIn: parent
                    font.pointSize: 20
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("Clicked on: " + section)
                    }
                }
            }
        }
    }


    Component {
        id: delegateId
        Rectangle {
            id: rectangleId
            width : parent.width  // Remember to specify these sizes or you'll have problems
            height: 50
            color: "beige"
            border.color: "yellowgreen"
            radius: 14

            Text {
                id: textId
                anchors.centerIn: parent
                text: names
                font.pointSize: 20
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on: " + names)
                }
            }

        }
    }
}
