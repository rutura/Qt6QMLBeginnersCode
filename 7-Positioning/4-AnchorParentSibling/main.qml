/*

        . Showing that you can only anchor to parent or sibling items.
        . We try to anchor topLeftRectId to siblingRect but that won't work :
                Rectangle {
                    id : topLeftRectId
                    width: 100
                    height: width
                    color: "magenta"

                    //This anchor won't work because siblingRect isn't either a
                    //sibling or a parent
                    anchors.top: siblingRect.bottom
                }

  */
import QtQuick
import QtQuick.Window

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Anchors")

    Rectangle {
        id : containerRectId
        width: 300
        height: width
        border.color: "black"
        anchors.centerIn: parent

        Rectangle {
            id : topLeftRectId
            width: 100
            height: width
            color: "magenta"

            //This anchor won't work because siblingRect isn't either a
            //sibling or a parent
            anchors.top: siblingRect.bottom
        }

        Rectangle {
            id : topCenterRectId
            width: 100
            height: width
            color: "yellowgreen"
            anchors.left: topLeftRectId.right
        }

        Rectangle {
            id : topRightRectId
            width: 100
            height: width
            color: "dodgerblue"
            anchors.left: topCenterRectId.right
        }

        Rectangle {
            id : centerLeftRectId
            width: 100
            height: width
            color: "red"
            anchors.top: topLeftRectId.bottom
        }

        Rectangle {
            id : centerCenterRectId
            width: 100
            height: width
            color: "green"
            anchors.left: centerLeftRectId.right
            anchors.top: topRightRectId.bottom
        }

        Rectangle {
            id : centerRightRectId
            width: 100
            height: width
            color: "blue"
            anchors.left: centerCenterRectId.right
            anchors.top: topRightRectId.bottom
        }


        //The bottom row will be positioned in terms of centerCenterRectId
        Rectangle {
            id : bottomLeftRectId
            width: 100
            height: width
            color: "royalblue"
            anchors.right: centerCenterRectId.left
            anchors.top: centerCenterRectId.bottom
        }
        Rectangle {
            id : bottomCenterRectId
            width: 100
            height: width
            color: "yellow"
            anchors.left: centerCenterRectId.left
            anchors.top: centerCenterRectId.bottom
        }

        Rectangle {
            id : bottomRightRectId
            width: 100
            height: width
            color: "pink"
            anchors.left: centerCenterRectId.right
            anchors.top: centerCenterRectId.bottom
        }
    }

    Rectangle {
        id : siblingRect
        width: 200
        height: 200
        color : "black"
        anchors.right: containerRectId.left
    }


}
