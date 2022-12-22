/*
        . Exploring TextEdit
                . Steal the TextEdit code from the docs and use that as
                    a starting point
                 . Run without using rich text and show the effect
                 . Run using rich text and show how the html tags are shown
                 . Center the TextEdit
                 . Show that you can delete and type text
                 . Try to type text across multiple lines
                 . Show a long piece of text : the text below
                 . The TextEdit will try to show that on one line
                 . Use the wrap property to make it wrap text to new lines
                 . The text wraps but you can't see it all. We need some kind of scrolling
                 . Meet the Flickable element which provides some flicking, swipping capabilities
                 . Try to make this as fun as possible.

  */

import QtQuick
import QtQuick.Window

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("TextEdit Demo")

    Flickable {
        id : mFlickableId

        width : textInputId.width
        contentHeight: textInputId.implicitHeight
        height: 300
        clip: true
        anchors.centerIn: parent

        TextEdit {
            id : textInputId

            width: 240

            text: "<strong>Because</strong> we want to use our server locally, we set our domain name \r to be <font color = 'red' >localhost </font>. If we had set it up  to\n be something  else, we would have to go mess with the host files to resolve whatever we put in here to a recognizable network address. ustleaveinlocalhostitisgoodenoughforourlocalusepurposes. Leave the rest to defaults and hit continue. You are then given a choice for the database you want to use"

            wrapMode: TextEdit.Wrap
            textFormat: TextEdit.RichText
            font.family: "Helvetica"
            font.pointSize: 20
            color: "blue"
            focus: true

            onEditingFinished: {
                console.log("The current text is :"+ text)
            }
        }

    }

    Rectangle {
        id : mRectId
        width: 200
        height: 100
        color: "red"
        anchors.top: mFlickableId.bottom
        MouseArea{
            anchors.fill: parent
            onClicked: {
              console.log("The new text is :"+textInputId.text)
            }
        }
    }

}
