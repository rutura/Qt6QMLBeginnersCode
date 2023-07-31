/*

        . We want to have some gradients applied to the sky and ground.

        . When having gradients that to work with transitions, you don't put a Gradient
            in a property change like this :

            .                 PropertyChanges {
                    target: sky
                    color : "lightblue"
                    //                    gradient : Gradient {
                    //                        GradientStop { position: 0.0; color: "#AA80FF" }
                    //                        GradientStop { position: 1.0; color: "#AACCFF" }
                    //                    }
                }

        . Instead you give your gradient stop elements ids and target them
            in transitions with the desired values :

                .                 PropertyChanges {
                    target: skyStartColorId
                    color : "lightblue"
                }
                PropertyChanges {
                    target: skyEndColorId
                    color : "#EECCFF"
                }

        . Organize the content very well in the slides
        . Use the qt 5 course as a ref and improvise to make this as understandable as possible.

  */
import QtQuick
import QtQuick.Window

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("States With Gradients")

    Rectangle {
        id : containerRectId
        anchors.fill: parent

        Rectangle {
            id: sky
            width: parent.width
            height: 200
            //color : "blue"
            gradient: Gradient {
                GradientStop {id: skyStartColorId; position: 0.0; color: "blue" }
                GradientStop {id : skyEndColorId; position: 1.0; color: "#66CCFF" }
            }
        }

        Rectangle {
            id: ground
            anchors.top: sky.bottom
            anchors.bottom: parent.bottom
            width: parent.width
            //color: "lime"
            gradient: Gradient {
                GradientStop {id: groundStartColorId; position: 0.0; color: "lime" }
                GradientStop {id : groundEndColorId; position: 1.0; color: "#66CCFF" }
            }
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

                //                PropertyChanges {
                //                    target: sky
                //                    color : "lightblue"
                //                }
                PropertyChanges {
                    target: skyStartColorId
                    color : "lightblue"
                }
                PropertyChanges {
                    target: skyEndColorId
                    color : "#EECCFF"
                }



                PropertyChanges {
                    target: treeSummerId
                    opacity : 1
                }
                PropertyChanges {
                    target: treespringId
                    opacity : 0
                }
                //                PropertyChanges {
                //                    target: ground
                //                    color : "darkkhaki"

                //                }

                PropertyChanges {
                    target: groundStartColorId
                    color : "lime"
                }
                PropertyChanges {
                    target: groundEndColorId
                    color : "darkkhaki"
                }
                PropertyChanges {
                    target: sun
                    color : "yellow"

                }


            },
            State {
                name : "spring"

                //                PropertyChanges {
                //                    target: sky
                //                    color : "deepskyblue"
                //                }
                PropertyChanges {
                    target: skyStartColorId
                    color : "deepskyblue"
                }

                PropertyChanges {
                    target: skyEndColorId
                    color : "#AACCFF"
                }

                PropertyChanges {
                    target: treeSummerId
                    opacity : 0
                }
                PropertyChanges {
                    target: treespringId
                    opacity : 1
                }
                //                PropertyChanges {
                //                    target: ground
                //                    color : "lime"
                //                }
                PropertyChanges {
                    target: groundStartColorId
                    color : "lime"
                }
                PropertyChanges {
                    target: groundEndColorId
                    color : "#66CCFF"
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
                containerRectId.state = (containerRectId.state=="spring"?"summer":"spring")
            }
        }

    }
}
