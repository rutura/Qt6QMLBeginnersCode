// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Controls
import TableModel // Import the custom model from C++

ApplicationWindow {
    width: 680
    height: 400
    visible: true

    HorizontalHeaderView {
        id: horizontalHeader
        anchors.left: tableViewId.left
        anchors.top: parent.top
        syncView: tableViewId
        clip: true

    }

    VerticalHeaderView {
        id: verticalHeader
        anchors.top: tableViewId.top
        anchors.left: parent.left
        syncView: tableViewId
        clip: true

    }

    TableModel{
        id: tableModelId
    }

    TableView {
        id: tableViewId
        anchors.left: verticalHeader.right
        anchors.top: horizontalHeader.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        columnSpacing: 1
        rowSpacing: 1
        boundsBehavior: Flickable.StopAtBounds

        model: tableModelId

        delegate:  Label {
            text: model.tabledata
            width: 100
            padding: 12

            Rectangle {
                anchors.fill: parent
                color: "#efefef"
                z: -1
            }
        }
    }

    Button{
        text: "See the data"
        anchors.bottom: parent.bottom
        onClicked: {
            console.log(tableModelId.get_display_data(tableModelId.index(0,1)))
        }
    }
}
