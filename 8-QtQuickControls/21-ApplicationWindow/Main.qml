// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Controls

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("ApplicationWindow Demo")

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            Action {
                id: newActionId
                text: qsTr("&New")
                icon.source: "qrc:/images/newFileIcon.png"
                onTriggered: {
                    console.log("Clicked on new")
                }
            }


            Action {
                id: openActionId
                text: qsTr("&Open...")
                icon.source: "qrc:/images/openIcon.png"

            }
            Action {
                id: saveActionId
                text: qsTr("&Save")
                icon.source: "qrc:/images/saveIcon.png"
            }
            Action {
                id: saveAsActionId
                text: qsTr("Save &As...")
                icon.source: "qrc:/images/saveAsIcon.png"
            }

            MenuSeparator{}
            Action {
                id: quitActionId
                text: qsTr("Quit")
                icon.source: "qrc:/images/quitIcon.png"
                onTriggered: Qt.quit()

            }
        }

        Menu {
            title: qsTr("&Edit")
            Action {id: cutMenuId; icon.source: "qrc:/images/cutIcon.png"; text: qsTr("Cut") }
            Action {
                text: qsTr("Copy")
                icon.source: "qrc:/images/copyIcon.png"
            }
            Action { text: qsTr("Paste") ; icon.source: "qrc:/images/pasteIcon.png"}
            MenuSeparator { }
            Action { text: qsTr("Undo"); icon.source: "qrc:/images/undoIcon.png" }
            Action { text: qsTr("Redo") ; icon.source: "qrc:/images/redoIcon.png"}
        }
        Menu {
            id: helpMenu
            title: qsTr("&Help")
            Action {
                text: qsTr("&About")
                icon.source: "qrc:/images/info.png"
            }
        }
    }

    header: ToolBar {
        Row {
            anchors.fill: parent
            ToolButton{
                action: newActionId
            }
            ToolButton{
                action: saveActionId
            }
            ToolButton{
                action: saveAsActionId
            }
            ToolButton{
                action: quitActionId
            }
        }
    }

    footer: TabBar {
        id: mTabBar
        width: parent.width

        TabButton {
            text : qsTr("Page1")
            onClicked: {
                mStackId.pop()
                mStackId.push("Page1.qml")
                console.log("Number of items : " + mStackId.depth)
            }
        }
        TabButton {
            text : qsTr("Page2")
            onClicked: {
                mStackId.pop()
                mStackId.push("Page2.qml")
                console.log("Number of items : " + mStackId.depth)
            }
        }
        TabButton {
            text : qsTr("Page3")
            onClicked: {
                mStackId.pop()
                mStackId.push("Page3.qml")
                console.log("Number of items : " + mStackId.depth)
            }
        }
    }

    //Main Content
    StackView {
        id : mStackId
        anchors.fill: parent
        initialItem: Page1{

        }
    }
}
