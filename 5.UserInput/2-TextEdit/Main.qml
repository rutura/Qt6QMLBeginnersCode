/*
        . Exploring TextEdit
                . Component to show multiple lines of editable text
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
                 . We can't see all the text
                 . There are ways one can make the text scrollable but
                    there are better tools like TextArea that make these
                    this easier so we'll just stop here for TextEdit.




  */

import QtQuick

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("TextEdit Demo")



        /*
        TextEdit {
            id: textInputId
            width: 240
            anchors.centerIn: parent

            text: "<strong>Because</strong> we want to use our server locally, we set our domain name \r to be <font color = 'red' >localhost </font>. If we had set it up  to\n be something  else, we would have to go mess with the host files to resolve whatever we put in here to a recognizable network address. ustleaveinlocalhostitisgoodenoughforourlocalusepurposes. Leave the rest to defaults and hit continue. You are then given a choice for the database you want to use"

            wrapMode: TextEdit.Wrap
            //textFormat: TextEdit.RichText
            font.family: "Helvetica"
            font.pointSize: 20
            color: "blue"
            focus: true

            onEditingFinished: {
                console.log("The current text is: "+ text)
            }
        }
        */

    TextEdit {
        id: textInputId
        wrapMode: TextEdit.Wrap
        textFormat: TextEdit.RichText
        width: 240
        //text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        text: "<strong>Because</strong> we want to use our server locally, we set our domain name \r to be <font color = 'red' >localhost </font>."

        font.family: "Helvetica"
        font.pointSize: 20
        color: "blue"
        focus: true

        onEditingFinished: {
            console.log("The current text is: "+ text)
        }
    }


    Rectangle {
        id: mRectId
        width: 240
        height: 100
        color: "red"
        anchors.top: textInputId.bottom
        MouseArea{
            anchors.fill: parent
            onClicked: {
              console.log("The new text is: "+textInputId.text)
            }
        }
    }


}
