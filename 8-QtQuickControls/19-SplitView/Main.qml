// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
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
