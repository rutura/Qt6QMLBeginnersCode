/*
    . Exploring Settings
    . We let the system save the data automatically
    . All you have to do is put these Settings  components in your
        qml file :
                    Settings{
                        category: "window"
                        property alias x : rootId.x
                        property alias y : rootId.y
                        property alias width : rootId.width
                        property alias height : rootId.height
                    }

                    Settings{
                        category: "colors"
                        property alias rectColor : rectId.color
                    }

      . In other words, we are telling Qt to keep track of these properties for us
            and update them next time when the system starts, with the newest data :
                    . rootId.x
                    . rootId.y
                    . rootId.width
                    . rootId.height
                    . rectId.color
      . Qt does the heavy lifting to achieve that behind the scenes.

      . The price we pay is that any simple change in the properties will trigger a
        call to save the data and that can be heavy performance wise.
      . There is an option to choose when the data is saved, and we look at that in the
        next lecture.

  */
import QtQuick
import QtQuick.Dialogs
import QtCore

Window {
    id: rootId
    visible: true

    //2.Read data from the Settings object
    x: windowSettingsId.x
    y: windowSettingsId.y
    width: windowSettingsId.width
    height: windowSettingsId.height

    title: qsTr("Custom Settings")

    Rectangle {
        id : rectId
        anchors.fill: parent

        //2.Read data from the Settings object
        color: colorSettingsId.rectColor

        MouseArea{
            anchors.fill: parent
            onClicked: {
                colorDialogId.open()
            }

            ColorDialog {
                id: colorDialogId
                title: "Please choose a color"
                onAccepted: {
                    console.log("The new color is: "+ selectedColor)
                    rectId.color = selectedColor
                }
                onRejected: {
                    console.log("Canceled")
                }
            }
        }
    }


    //1. Don't use property aliases in the Settings objects
    Settings{
        id: windowSettingsId
        category: "window"
        property int x: 300
        property int y: 300
        property int width: 640
        property int height: 480
    }

    Settings{
        id: colorSettingsId
        category: "colors"
        property color rectColor: "red"
    }

    //3.Save the data when the Window object is about to die
    Component.onDestruction: {
        //Save the window properties
        windowSettingsId.x = rootId.x
        windowSettingsId.y = rootId.y
        windowSettingsId.width = rootId.width
        windowSettingsId.height = rootId.height

        //Save the color property
        colorSettingsId.rectColor = rectId.color
    }
}
