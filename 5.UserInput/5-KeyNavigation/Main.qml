// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Key Navigation Demo")

    Grid {
          anchors.centerIn: parent
          columns: 2

          Rectangle {
              id: topLeft
              width: 100; height: 100
              color: focus ? "red" : "lightgray"
              focus: true

              KeyNavigation.right: topRight
              KeyNavigation.down: bottomLeft
          }

          Rectangle {
              id: topRight
              width: 100; height: 100
              color: focus ? "red" : "lightgray"

              KeyNavigation.left: topLeft
              KeyNavigation.down: bottomRight
          }

          Rectangle {
              id: bottomLeft
              width: 100; height: 100
              color: focus ? "red" : "lightgray"

              KeyNavigation.right: bottomRight
              KeyNavigation.up: topLeft
          }

          Rectangle {
              id: bottomRight
              width: 100; height: 100
              color: focus ? "red" : "lightgray"

              KeyNavigation.left: bottomLeft
              KeyNavigation.up: topRight
          }

    }





    /*
    Row {
        anchors.centerIn: parent

        Rectangle{
            id: firstRectId
            width: 200
            height: width
            border.color: "black"
            color: "red"
            focus: true

            onFocusChanged: {
                color = focus?"red":"gray"
            }

            Keys.onDigit5Pressed: {
                console.log("I am Rect1")
            }
            KeyNavigation.right: secondRectId
        }

        Rectangle{
            id: secondRectId
            width: 200
            height: width
            border.color: "black"
            color: "gray"
            onFocusChanged: {
                color = focus?"red":"gray"
            }

            Keys.onDigit5Pressed: {
                console.log("I am Rect2")
            }
            KeyNavigation.left: firstRectId
        }
    }
    */
}
