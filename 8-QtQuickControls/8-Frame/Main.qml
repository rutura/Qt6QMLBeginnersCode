// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Frame")

    Frame {
        anchors.centerIn: parent

        ColumnLayout {

            Button {
                text: "Button1"
            }
            Button {
                text: "Button2"
            }
            Button {
                text: "Button3"
            }

        }
    }
}
