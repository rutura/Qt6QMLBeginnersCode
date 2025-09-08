import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("States with Gradients")

    Rectangle{
        id: containerRectId
        anchors.fill: parent

        //Sky
        Rectangle{
            id: skyId
            width: parent.width
            height: 200
            //color: "blue"
            gradient: Gradient{
                GradientStop{
                    id: skyStartColorId
                    position: 0.0
                    color: "blue"
                }
                GradientStop{
                    id: skyEndColorId
                    position: 1.0
                    color: "#66CCFF"
                }
            }
        }


        Rectangle{
            id: groundId
            anchors.top: skyId.bottom
            anchors.bottom: parent.bottom
            width: parent.width
            //color: "lime"
            gradient: Gradient{
                GradientStop{
                    id: groundStartColorId
                    position: 0.0
                    color: "lime"
                }
                GradientStop{
                    id: groundEndColorId
                    position: 1.0
                    color: "#66CCFF"
                }
            }
        }


        Image{
            id: treeSummerId
            x: 50
            y: 100
            width: 200
            height: 300
            source: "qrc:/images/treesummersmall.png"
        }

        Image{
            id: treeSpringId
            x: 50
            y: 100
            width: 200
            height: 300
            source: "qrc:/images/treespringsmall.png"
        }

        Rectangle{
            id: sunId
            x: parent.width - width - 100
            y: 50
            width: 100
            height: 100
            color: "yellow"
            radius: 600
        }

        state: "spring"

        states: [

           //Spring
            State{
                name: "spring"
                /*
                PropertyChanges {
                   target: skyId
                   color: "deepskyblue"
                }
                */
                PropertyChanges {
                    target: skyStartColorId
                    color: "deepskyblue"
                }

                PropertyChanges {
                    target: skyEndColorId
                    color: "#AACCFF"
                }

                PropertyChanges {
                    target: treeSummerId
                    opacity: 0
                }
                PropertyChanges {
                    target: treeSpringId
                    opacity: 1
                }
                /*
                PropertyChanges {
                    target: groundId
                    color: "lime"
                }
                */
                PropertyChanges {
                    target: groundStartColorId
                    color: "lime"
                }
                PropertyChanges {
                    target: groundEndColorId
                    color: "#66CCFF"
                }

                PropertyChanges {
                    target: sunId
                    color: "lightyellow"

                }
            },

            //Summer
            State{
                name: "summer"
                /*
                PropertyChanges {
                   target: skyId
                   color: "lightblue"
                }
                */
                PropertyChanges{
                    target: skyStartColorId
                    color: "lightblue"
                }
                PropertyChanges{
                    target: skyEndColorId
                    color: "#EECCFF"
                }
                PropertyChanges {
                    target: treeSummerId
                    opacity: 1
                }
                PropertyChanges {
                    target: treeSpringId
                    opacity: 0
                }
                /*
                PropertyChanges {
                    target: groundId
                    color: "darkkhaki"
                }
                */
                PropertyChanges {
                    target: groundStartColorId
                    color: "lime"
                }
                PropertyChanges {
                    target: groundEndColorId
                    color: "darkkhaki"
                }
                PropertyChanges {
                    target: sunId
                    color: "yellow"

                }
            }

        ]

        //Transitions
        /*
        transitions: [
            Transition{
                from: "summer"
                to: "spring"
                ColorAnimation{
                    duration: 500
                }
                NumberAnimation{
                    property: "opacity"
                    duration: 500
                }
            },

            Transition{
                from: "spring"
                to: "summer"
                ColorAnimation{
                    duration: 500
                }
                NumberAnimation{
                    property: "opacity"
                    duration: 500
                }

            }
        ]
        */

        transitions: Transition{
            from: "*"
            to: "*"
            ColorAnimation{
                duration: 500
            }
            NumberAnimation{
                property: "opacity"
                duration: 500
            }
        }


        MouseArea{
            anchors.fill: parent
            onClicked: function(){
                containerRectId.state = (containerRectId.state === "spring" ? "summer" : "spring")
            }
        }
    }
}
