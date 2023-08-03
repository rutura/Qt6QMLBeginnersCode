// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("ComboBox")

    ColumnLayout{
        width: parent.width
        height:parent.height

        //Non Editable ComboBox

        Label {
            text: "Non Editable Combo"
            wrapMode: Label.Wrap
            //horizontalAlignment: Qt.AlignHCenter
            //width: parent.width
            Layout.fillWidth: true
        }

        ComboBox {
            id: nonEditableComboId
            model: ["One", "Two", "Three", "Four"]
            //anchors.horizontalCenter: parent.horizontalCenter
            onActivated: {
                console.log("[" + currentIndex +"] " + currentText + " is activated")
            }
            Layout.fillWidth: true

        }



        //Editable ComboBox
        Label {
            text: "Editable Combo"
            wrapMode: Label.Wrap
            Layout.fillWidth: true
        }

        ComboBox {
            id: editableComboId
            editable: true
            textRole : "text"
            Layout.fillWidth: true
            model: ListModel {
                id : model
                ListElement { text: "Dog"; location:"Kigali" }
                ListElement { text: "Chicken"; location : "Beijing" }
                ListElement { text: "Cat" ; location : "Mumbai" }
                ListElement { text: "Meerkat" ; location : "Paris" }
            }


            onActivated: {
                console.log("[" + currentIndex +"] " + currentText + " is activated")
            }

            onAccepted: {
                if ( find(editText) === -1)
                {
                    model.append({text : editText , location : "US"})
                }
            }
        }



        Button{
            text : "Capture current element"
            Layout.fillWidth: true
            onClicked: {
                console.log("["  + model.get(editableComboId.currentIndex).text   +"]: " +
                             model.get(editableComboId.currentIndex).location)
            }
        }

        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
