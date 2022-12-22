/*
        . Using Page control together with tabBar
        . Use the doc and improvise
        . Use the Qt5 course as a reference if necessary.
  */

import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Page and TabBar")

    Page {
        id : pageId
        anchors.fill: parent

        header: Rectangle{
            width: parent.width
            height: 50
            color: "red"
        }

        SwipeView{
            id : swipeViewId
            anchors.fill: parent
            currentIndex: tabBarId.currentIndex

            Image{
                source: "https://www.learnqt.guide/images/qt_quick_fundamentals.png"
            }

            Image{
                source: "https://www.learnqt.guide/images/qt_quick_intermediate.png"
            }
            Image{
                source: "https://www.learnqt.guide/images/qt_quick_advanced.png"
            }


        }

        footer: TabBar{
            id : tabBarId
            currentIndex: swipeViewId.currentIndex

            TabButton{
                text : "First"
            }
            TabButton{
                text : "Second"
            }
            TabButton{
                text : "Third"
            }
        }
    }
}
