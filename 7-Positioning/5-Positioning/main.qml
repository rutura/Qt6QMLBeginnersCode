/*
        . Exploring positioners :
                . Grid
                . Row
                . Column

        . Show Grid with 3 columns
            . Change columns to 4 and 5 and discuss
        . Change to use Row
            . expand the window to see all 9 colored rects
         .Change to use Column :
            . Comment out the centering of containerRectId so you can see
                all the 9 colored rectangles
          . Turn back to Grid :
            . Show spacing :
                    . spacing: 10
                    . rowSpacing and columnSpacing
                    . Note that spacing:10 is equivalent to both setting {rowSpacing:10
                        and columnSpacing:10
            . Show alignment : Align topLeftRectId because it has a small size. The alignmnet
                will be visible:
                    . To make this fun, we add a LearnQt image into topLeftRectId just
                        to remind students how to work with Images.

                        . horizontalItemAlignment: Grid.AlignRight
                        .  verticalItemAlignment: Grid.AlignVCenter

            . Show mirroring :
                . LayoutMirroring.enabled: true
                . LayoutMirroring.childrenInherit: true


  */

import QtQuick

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Posionners")

    Grid {
        columns : 2
        spacing: 10
//        rowSpacing: 10
//        columnSpacing: 10

        horizontalItemAlignment: Grid.AlignRight
        verticalItemAlignment: Grid.AlignVCenter

        LayoutMirroring.enabled: true
        LayoutMirroring.childrenInherit: true

        Rectangle {
            id : topLeftRectId
            width: 60
            height: width
            color: "magenta"
            Text{text: "1"; anchors.centerIn: parent;font.pointSize: 20}
        }

        Rectangle {
            id : topCenterRectId
            width: 100
            height: width
            color: "yellowgreen"
            Text{text: "2"; anchors.centerIn: parent;font.pointSize: 20}
        }

        Rectangle {
            id : topRightRectId
            width: 100
            height: width
            color: "dodgerblue"
            Text{text: "3"; anchors.centerIn: parent;font.pointSize: 20}

        }

        Rectangle {
            id : centerLeftRectId
            width: 100
            height: width
            color: "beige"
            Text{text: "4"; anchors.centerIn: parent;font.pointSize: 20}

        }

    }
}
