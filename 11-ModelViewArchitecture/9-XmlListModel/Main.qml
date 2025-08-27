// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Window
import QtQml.XmlListModel


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("XmlListModel")


    XmlListModel {
        id: mXmlListModelId
        source: "qrc:/xml/employees.xml"
        query: "/courses/course"

        XmlListModelRole {
            name: "instructor"
            elementName: "instructor"
        }
        XmlListModelRole {
            name: "year"
            elementName: "year"
        }
        XmlListModelRole {
            name: "coursename"
            elementName: "coursename"
        }
        XmlListModelRole { name: "hot"
            elementName: "coursename"
            attributeName: "hot"
        }
    }

    ListView{
        id: mListViewId
        anchors.fill: parent
        model : mXmlListModelId
        delegate: Rectangle {
            width : parent.width
            height: 50
            color: "beige"
            Row {
                spacing: 30
                Text {
                    text: instructor
                    font.pointSize: 15
                }
                Text {
                    text: coursename + " (" + year + ")"
                    font.bold: hot === "true" ? true : false
                    font.pointSize: 15
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on: "+ hot)
                }
            }
        }
    }
}
