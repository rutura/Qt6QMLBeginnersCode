/*

        . Exploring elements :
            . Rectangle
            . Item
            . Text

  */

import QtQuick

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("QML Basic Elements Demo")

    Item {
        id : containerItemId
        x : 150 ;y : 50

        width: 600
        height: 300

        Rectangle{
            anchors.fill: parent
            color: "beige"
            border.color: "black"
        }

        Rectangle{
            x : 0
            y : 10
            width : 50
            height: 50
            color: "red"
            MouseArea{
                anchors.fill: parent
                onClicked: {

                }
            }
        }

        Rectangle{
            x : 60
            y : 10
            width : 50
            height: 50
            color: "green"
            MouseArea{
                anchors.fill: parent
                onClicked: {

                }
            }
        }

        Rectangle{
            x : 120
            y : 10
            width : 50
            height: 50
            color: "blue"
            MouseArea{
                anchors.fill: parent
                onClicked: {

                }
            }
        }

        Rectangle{
            x : 180
            y : 10
            width : 50
            height: 50
            color: "magenta"
            MouseArea{
                anchors.fill: parent
                onClicked: {

                }
            }
        }

        Text {
            x : 100
            y : 100
            id : mTextId
            text: "Hello World!"
            //font.family: "Helvetica"; font.pointSize: 13; font.bold: true
            /*
            font {
                family: "Helvetica"
                pointSize: 13
                bold: true
            }
            */
            font {
                family: "Helvetica";pointSize: 13;bold: true
            }

            color: "red"
        }



    }
}
