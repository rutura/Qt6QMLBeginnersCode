/*
        . Exploring states and transitions.

        . Start out by putting in the components :
            . sky
            . ground
            . trees
            . sun

        . Put in the states and change them statically in code

        . Put in the states
            . Change states upon mouse click

        . Put in the transitions verbosely

        . Show the other more general syntax for transitions.

        . Improvise.

  */

import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("States and Transitions")

    Rectangle {
        id : containerRectId
        anchors.fill: parent

        Rectangle {
            id: sky
            width: parent.width
            height: 200
            color : "blue"
        }

        Rectangle {
            id: ground
            anchors.top: sky.bottom
            anchors.bottom: parent.bottom
            width: parent.width
            color: "lime"
        }

        Image {
            id: treespringId
            x : 50
            y : 100
            width : 200
            height: 300
            source: "qrc:/images/treespringsmall.png"
        }
        Image {
            id: treeSummerId
            x : 50
            y : 100
            width : 200
            height: 300
            source: "qrc:/images/treesummersmall.png"
        }

        Rectangle {
            id : sun
            x : parent.width - width -100
            y : 50
            width : 100
            height: 100
            color : "yellow"
            radius: 60
        }

        state : "spring"

        //States
        states : [
            State {
                name : "summer"
                PropertyChanges {
                    target: sky
                    color : "lightblue"
                }

                PropertyChanges {
                    target: treeSummerId
                    opacity : 1
                }
                PropertyChanges {
                    target: treespringId
                    opacity : 0
                }
                PropertyChanges {
                    target: ground
                    color : "darkkhaki"

                }
                PropertyChanges {
                    target: sun
                    color : "yellow"

                }


            },
            State {
                name : "spring"
                PropertyChanges {
                    target: sky
                    color : "deepskyblue"
                }

                PropertyChanges {
                    target: treeSummerId
                    opacity : 0
                }
                PropertyChanges {
                    target: treespringId
                    opacity : 1
                }
                PropertyChanges {
                    target: ground
                    color : "lime"
                }

                PropertyChanges {
                    target: sun
                    color : "lightyellow"

                }

            }


        ]

        /*
        //Transitions
       transitions : [

           Transition {
               from : "summer"
               to : "spring"
               ColorAnimation {
                   duration: 500
               }
               NumberAnimation {
                   properties : "opacity"
                   duration: 500
               }

           },
           Transition {
               from : "spring"
               to : "summer"
               ColorAnimation {
                   duration: 500
               }
               NumberAnimation {
                   properties : "opacity"
                   duration: 500
               }

           }


       ]
       */


        transitions : Transition {
            from : "*" ; to : "*"

            ColorAnimation {
                duration: 500
            }
            NumberAnimation {
                properties : "opacity"
                duration: 500
            }
        }


        MouseArea{
            anchors.fill: parent
            onClicked: {
                containerRectId.state = (containerRectId.state==="spring"?"summer":"spring")
            }
        }

    }
}
