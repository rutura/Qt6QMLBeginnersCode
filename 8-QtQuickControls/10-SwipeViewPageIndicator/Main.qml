// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("PageIndicator and SwipeView")

    SwipeView{
        id: swipeViewId
        anchors.fill: parent
        currentIndex: pageIndicatorId.currentIndex
        anchors.bottomMargin: 20

       Image {
           id: image1
           fillMode: Image.PreserveAspectFit
           //source: "https://www.learnqt.guide/images/qt_quick_fundamentals.png"
           source:"qrc:/images/1.png"
       }
       Image {
           id: image2
           fillMode: Image.PreserveAspectFit
           //source: "https://www.learnqt.guide/images/qt_quick_intermediate.png"
           source: "qrc:/images/2.png"
       }
       Image {
           id: image3
           fillMode: Image.PreserveAspectFit
           //source: "https://www.learnqt.guide/images/qt_quick_advanced.png"
           source: "qrc:/images/3.png"
       }

    }

    PageIndicator{
        id: pageIndicatorId
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        //Page indicator specific properties
        currentIndex: swipeViewId.currentIndex
        interactive: true
        count: swipeViewId.count
    }


}
