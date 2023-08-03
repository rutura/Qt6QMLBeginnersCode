// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("GroupBox")

    Column{
        spacing: 10
        anchors.fill: parent

        //RadioButton controls
        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "A GroupBox wrapping around RadioButtons."
        }

        GroupBox{
            title: "Choose bonus"
            anchors.horizontalCenter: parent.horizontalCenter
            Column{

                RadioButton{
                    text: "Coke"
                    onCheckedChanged: {
                        if( checked){
                            console.log("Coke button checked")
                        }else{
                            console.log("Coke button is NOT checked")
                        }
                    }
                }
                RadioButton{
                    text: "Green Tea"
                }
                RadioButton{
                    text: "Ice Cream"
                }
            }
        }

        //CheckBox Controls
        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "A GroupBox wrapping around CheckBoxes."
        }


        GroupBox{
            title: "Choose Qt supported Desktop Platform"
            anchors.horizontalCenter: parent.horizontalCenter
            Column{

                CheckBox{
                    text: "Windows"
                    onCheckedChanged: {
                        if( checked){
                            console.log("Windows button checked")
                        }else{
                            console.log("Windows button is NOT checked")
                        }
                    }
                }
                CheckBox{
                    text: "Mac"
                }
                CheckBox{
                    text: "Linux"
                }
            }
        }

    }
}
