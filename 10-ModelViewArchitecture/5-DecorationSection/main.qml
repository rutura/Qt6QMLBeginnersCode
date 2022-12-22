/*
    . Exploring how to group list items by criteria
    . We that by adding a section property in the ListView
    . Steal the explanations in the Qt5 course and put them
        in the slides

     . Based on provided info, do improvise.

  */

import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Section  (Decoration)")


    ListModel {
        id : mListModel

        ListElement {
            names : "Seth Moris"; company : "GOOGLE"
        }
        ListElement {
            names : "Miriam Katv"; company : "GOOGLE"
        }

        ListElement {
            names : "Eugene Fitzgerald"; company : "GOOGLE"
        }
        ListElement {
            names : "Kantkl Vikney"; company : "GOOGLE"
        }
        ListElement {
            names : "Mary Beige"; company : "TENCENT"
        }
        ListElement {
            names : "Bamba Pikt"; company : "TENCENT"
        }
        ListElement {
            names : "Jack May"; company : "APPLE"
        }
        ListElement {
            names : "Brad Mend"; company : "APPLE"
        }
        ListElement {
            names : "Jeffery Mor"; company : "BAIDU"
        }
        ListElement {
            names : "Pick Mo"; company : "BAIDU"
        }

    }


    ListView {
        id : mListViewId
        anchors.fill: parent
        model : mListModel
        delegate: delegateId
        section {
            property: "company"
            criteria: ViewSection.FullString
            delegate: Rectangle{
                id : sectionRectId
                width : parent.width
                height: 50
                color: "red"
                border.color: "yellowgreen"
                radius: 14

                Text {
                    id : sectionTextId
                    text : section
                    anchors.centerIn: parent
                    font.pointSize: 20
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("Clicked on : " + section)
                    }
                }
            }
        }
    }


    Component {
        id : delegateId
        Rectangle {
            id : rectangleId
            width : parent.width  // Remember to specify these sizes or you'll have problems
            height: 50
            color: "beige"
            border.color: "yellowgreen"
            radius: 14

            Text {
                id : textId
                anchors.centerIn: parent
                text : names
                font.pointSize: 20
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on : " + names)
                }
            }

        }
    }
}
