/*
     . Exploring SplitView
        . This useful only on desktop.
        . May be you can figure out a usecase for mobile and embedded.
        . The code here is different from Qt5. Qt6 here insists on providing
            a preferedwidth. If we don't it defaults to 0 and I don't like that
            as the rectangles are invisible.
        . Improvise

  */

import QtQuick
import QtQuick.Window
import QtQuick.Controls
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("SplitView")


    SplitView {
          anchors.fill: parent
          orientation: Qt.Horizontal

          Rectangle {
              SplitView.preferredWidth: 150
              SplitView.minimumWidth: 100
              color: "lightblue"
              Text {
                  text: "View 1"
                  anchors.centerIn: parent
              }
          }
          Rectangle {
              SplitView.preferredWidth: 100
              color: "lightgray"
              Text {
                  text: "View 2"
                  anchors.centerIn: parent
              }
          }
          Rectangle {
              SplitView.preferredWidth: 150
              color: "lightgreen"
              Text {
                  text: "View 3"
                  anchors.centerIn: parent
              }
          }
      }
}
