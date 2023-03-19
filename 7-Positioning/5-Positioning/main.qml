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
import QtQuick.Window

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Posionners")

    Rectangle {
        id : containerRectId
        width: 300
        height: width
        border.color: "black"
        anchors.centerIn: parent
//        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.verticalCenter: parent.verticalCenter

        Row {
           //columns: 3
           //spacing: 10
//           rowSpacing: 10
//           columnSpacing: 10

           //horizontalItemAlignment: Grid.AlignRight
           //verticalItemAlignment: Grid.AlignVCenter

           //LayoutMirroring.enabled: true
           //LayoutMirroring.childrenInherit: true

            Rectangle {
                id : topLeftRectId
                width: 60
                height: width
                color: "magenta"


                Image {

                    anchors.centerIn: parent
                    width: 50
                    height: 50
                    source: "qrc:/images/LearnQt.png"
                }


            }

            Rectangle {
                id : topCenterRectId
                width: 100
                height: width
                color: "yellowgreen"
            }

            Rectangle {
                id : topRightRectId
                width: 100
                height: width
                color: "dodgerblue"
            }

            Rectangle {
                id : centerLeftRectId
                width: 100
                height: width
                color: "beige"
            }

            Rectangle {
                id : centerCenterRectId
                width: 100
                height: width
                color: "green"
            }
            Rectangle {
                id : centerRightRectId
                width: 100
                height: width
                color: "blue"
            }
            Rectangle {
                id : bottomLeftRectId
                width: 100
                height: width
                color: "royalblue"
            }
            Rectangle {
                id : bottomCenterRectId
                width: 100
                height: width
                color: "yellow"
            }

            Rectangle {
                id : bottomRightRectId
                width: 100
                height: width
                color: "pink"
            }

        }
    }
}
