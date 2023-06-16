/*

        . Exploring TextArea
            . Start out with a raw TextArea without a scrollView
            . Wrap in a scrollView to add some scrolling
            . ScrollView has some binding loops problems especially
                when you try to use that in conjunction with TextArea, example
                below :
                    QML ScrollView: Binding loop detected for property "rightPadding"
            . I haven't cared enough to dig more into this, but if it is for your
                project, you may research more on this.LEAVING THIS FOR NOW.

  */

import QtQuick
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("TextArea")

    Column {
        spacing: 40
        width: parent.width

        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "TextArea is a multi-line text editor."
        }


        ScrollView{
            id : scrollView
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            height: 150
            TextArea {
                id : textAreaId

                font.pointSize: 15
                wrapMode: TextArea.WordWrap
                placeholderText: "Type in your query"
                text: "TextArea is a QML element where you can type in multiple lines of text and more and more and more At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat TextArea is a QML element where you can type in multiple lines of text and more and more and more At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat TextArea is a QML element where you can type in multiple lines of text and more and more and more At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat end"
            }
        }







        Button{
            text : "Submit"
             anchors.horizontalCenter: parent.horizontalCenter
             onClicked: {
                 console.log("The text inside the TextArea is : "+ textAreaId.text)
                 textAreaId.text = textAreaId.text + "sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facili1111"
             }
        }
    }
}
