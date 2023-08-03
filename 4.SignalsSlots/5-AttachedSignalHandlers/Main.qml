// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Attached signal handlers")

    Rectangle{
        width : 200
        height: 200
        color : "green"
        anchors.left: parent.left

        Component.onCompleted: {
            console.log("Finished setting up the rectangle")
        }
    }
}
