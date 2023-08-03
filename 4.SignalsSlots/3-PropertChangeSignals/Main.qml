// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Property change handlers")

    Rectangle {
        id: rect
        width: 300
        height: width
        color: "dodgerblue"

        property string description: "A rectangle to play with"

        onWidthChanged: function() {
            console.log("Width changed to: " + rect.width)
        }

        onHeightChanged: function() {
            console.log("Height changed to: " + rect.height)
        }

        onColorChanged: {

        }

        onVisibleChanged: {

        }

        onDescriptionChanged: {

        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                rect.width = rect.width + 20
            }
        }
    }
}
