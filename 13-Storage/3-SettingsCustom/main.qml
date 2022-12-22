/*


        . Settings saved at an explicit time
        . We use the states and transitions example here just to have
            something different to play with here

        . The flow is :
            . Having a Settings component with the property you want saved :
                .         Settings {
                                id: settings
                                property string state: "spring"
                            }

            . When you need the property in your app, read it from the Settings
                component :
                    .         state : settings.state

            . Change the property as you see fit in your app logic :
                .         MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    containerRectId.state = (containerRectId.state==="spring"?"summer":"spring")
                                }
                            }

             . Save the property when you choose to :
                .         Component.onDestruction: {
                                settings.state = containerRectId.state

                          }

         . Whether you use Settings automatically or save the data customly like we do
            here is going to be your design choice. My job here is to show you the
            possibilities.


  */

import QtQuick
import QtQuick.Window
import Qt.labs.settings
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Custom Settings Demo")

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

        //state : "spring"
        state : settings.state

        //States
        states : [
            State {
                name : "summer"
                PropertyChanges {
                    target: sky
                    color : "lightblue"

                }

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
                PropertyChanges {
                    target: sky
                    color : "deepskyblue"
                }

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

                PropertyChanges {
                    target: groundStartColorId
                    color : "lime"
                }
                PropertyChanges {
                    target: groundStartColorId
                    color : "lime"
                }

                PropertyChanges {
                    target: sun
                    color : "lightyellow"

                }

            }


        ]

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


        Settings {
            id: settings
            property string state: "spring"
        }

        Component.onDestruction: {
            settings.state = containerRectId.state

        }

    }
}
