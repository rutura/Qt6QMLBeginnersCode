/*

        . Exploring ComboBox
        . Non Editable Combobox
            . Just feed the model property
            . Know when an item is activated
        . Editable combobox : We want to add items dynamically at run time
            . We add new data when the item is accepted.(Return pressed)

        . If confused, refer to the Qt 5 course for clarity.



  */

import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("ComboBox")

    Column{
        spacing: 40
        width: parent.width

        Label {
            text: "Non Editable Combo"
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            width: parent.width
        }

        ComboBox {
            id : nonEditableComboId
            model: ["One","Two","Three","Four"]
            anchors.horizontalCenter: parent.horizontalCenter
            onActivated: {
                console.log("[" + currentIndex +"]" + currentText + " is activated")
            }

        }

        Label {
            text: "Editable Combo"
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            width: parent.width
        }

        ComboBox {
            id : editableComboId
            editable: true
            textRole : "text"
            model: ListModel {
                id : model
                ListElement { text: "Dog";location:"Kigali" }
                ListElement { text: "Chicken";location : "Beijing" }
                ListElement { text: "Cat" ; location : "Mumbai" }
                ListElement { text: "Meerkat" ; location : "Paris" }
            }

            anchors.horizontalCenter: parent.horizontalCenter
            onActivated: {
                console.log("[" + currentIndex +"]" + currentText + " is activated")
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
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                console.log("["  + model.get(editableComboId.currentIndex).text   +"] :" +
                             model.get(editableComboId.currentIndex).location)
            }
        }
    }
}
