/*
        . Layout 9 simple rectangles in a GridLayout
            . Show the difference from Grid, by just changing GridLayout to Grid
                . GridLayout tries to adjust to the size of the container when changed.
                . Grid keeps the same size.
                . You can use Layouts if you want this kind of resizing.

        . Change GridLayout to RowLayout
            . You will need to comment out the columns property

        . Show Layout.alignment on topLeftRectId
            . Layout.alignment: Qt.AlignRight

        . Show the fillWidth and fillHeight props :
            .    Layout.fillWidth: true
                Layout.fillHeight: true
            . First apply these to topLeftRectId, show how it tries to occupy
                as much space as possible.
            . Apply the property to all other rectangles to have the thing risize
                reasonably.

        . Show the maximum width and height props on the yellow centerRightRectId :
                . Layout.maximumWidth: 200
                .  Layout.maximumHeight: 150

         . Show row span and column span :
            . topCenterRectId will span two columns
            . centerLeftRectId will span two rows

         . Show Layout direction on GridLayout :
            . layoutDirection: Qt.RightToLeft

  */

import QtQuick
import QtQuick.Window
import QtQuick.Layouts
Window {
    visible: true
    width: mGridLayoutId.implicitWidth
    height: mGridLayoutId.implicitHeight
    title: qsTr("Layouts")

    GridLayout{
        id : mGridLayoutId
        anchors.fill: parent
        columns: 3
        //layoutDirection: Qt.RightToLeft

        Rectangle {
            id : topLeftRectId
            width: 70
            height: width
            color: "green"

            //Showing Layout alignment
            //Layout.alignment: Qt.AlignRight
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Rectangle {
            id : topCenterRectId
            width: 100
            height: width
            color: "red"
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.columnSpan: 2
        }

        //Taking this out because topCenterRectId will span two columns
        /*
        Rectangle {
            id : topRightRectId
            width: 100
            height: width
            color: "blue"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        */

        Rectangle {
            id : centerLeftRectId
            width: 100
            height: width
            color: "beige"
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.rowSpan: 2

        }
        Rectangle {
            id : centerCenterRectId
            width: 100
            height: width
            color: "pink"
            Layout.fillWidth: true
            Layout.fillHeight: true

        }
        Rectangle {
            id : centerRightRectId
            width: 100
            height: width
            color: "yellow"
            Layout.fillWidth: true
            Layout.fillHeight: true
//            Layout.maximumWidth: 200
//            Layout.maximumHeight: 150

        }


        //Taking this out because the beige centerLeftRectId rectangle will span two rows
        /*
        Rectangle {
            id : bottomLeftRectId
            width: 100
            height: width
            color: "magenta"
            Layout.fillWidth: true
            Layout.fillHeight: true

        }
        */


        Rectangle {
            id : bottomCenterRectId
            width: 100
            height: width
            color: "yellowgreen"
            Layout.fillWidth: true
            Layout.fillHeight: true

        }
        Rectangle {
            id : bottomRightRectId
            width: 100
            height: width
            color: "dodgerblue"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }


}
