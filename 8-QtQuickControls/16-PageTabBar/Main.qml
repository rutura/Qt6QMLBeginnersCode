// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Controls

Window {
    visible: true
    width: 480
    height: 640
    title: qsTr("Page and TabBar")

    Page {
        id: pageId
        anchors.fill: parent

        header: Rectangle{
            width: parent.width
            height: 50
            color: "yellowgreen"
            Text{
                text: "Some header text"
                anchors.centerIn: parent
            }
        }

        SwipeView{
            id: swipeViewId
            anchors.fill: parent
            currentIndex: tabBarId.currentIndex

            Image{
                fillMode: Image.PreserveAspectFit
                source: "qrc:/images/1.png"
            }

            Image{
                fillMode: Image.PreserveAspectFit
                source: "qrc:/images/2.png"
            }
            Image{
                fillMode: Image.PreserveAspectFit
                source: "qrc:/images/3.png"
            }


        }

        footer: TabBar{
            id: tabBarId
            currentIndex: swipeViewId.currentIndex

            TabButton{
                text: "First"
            }
            TabButton{
                text: "Second"
            }
            TabButton{
                text: "Third"
            }
        }
    }
}
