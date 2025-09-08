import QtQuick
import QtQuick.Layouts

Window {
    id: rootId
    width: 640
    height: 480
    visible: true
    title: qsTr("Easing Curves")

    property int animDuration: 500
    property color startColor : "beige"
    property color endColor: "blue"


    Flickable{
        anchors.fill: parent
    contentHeight: columnId.implicitHeight
        ColumnLayout{
            id: columnId
            width: parent.width
            spacing: 2

            //The container rectangle
            /*
            Rectangle{
                id: containerRectId
                width: parent.width
                height: 50
                color: "gray"

                Text{
                    text: "Easing.Linear"
                    anchors.centerIn: parent
                }

                Rectangle{
                    id: containedRectId
                    color: startColor
                    width: 50
                    height: 50
                    border{
                        width: 5
                        color: "black"
                    }
                    radius: 10

                    MouseArea{
                        anchors.fill: parent
                        property bool toRight: false

                        onClicked: function(){
                            if( toRight === false){
                                //Move towards the right
                                toRight = true
                                //Animate x
                                numberAnimationId.to = containerRectId.width - containedRectId.width
                                numberAnimationId.start()

                                //Animate the color
                                colorAnimationId.from = startColor
                                colorAnimationId.to = endColor
                                colorAnimationId.start()
                            }else{
                                //Move towards the left
                                toRight = false
                                //Animate x
                                numberAnimationId.to = 0
                                numberAnimationId.start()

                                //Animate the color
                                colorAnimationId.from = endColor
                                colorAnimationId.to = startColor
                                colorAnimationId.start()
                            }
                        }

                    }


                    NumberAnimation {
                        id: numberAnimationId
                        target: containedRectId
                        property: "x"
                        easing.type: Easing.Linear
                        to: containerRectId.width - containedRectId.width
                        duration: animDuration
                    }

                    ColorAnimation{
                        id: colorAnimationId
                        target: containedRectId
                        property: "color"
                        from: startColor
                        to: endoColor
                        duration: animDuration
                    }
                }
            }
            */

            MovingRectangle {
                backgroundColor: "gray"
                startColor: "beige"
                endColor: "blue"
                animDuration: rootId.animDuration
                easingText: "Linear"
                easingType: Easing.Linear
                containerwidth: rootId.width
            }

            MovingRectangle {
                backgroundColor: "gray"
                startColor: "beige"
                endColor: "green"
                animDuration: rootId.animDuration
                easingText: "InQuad"
                easingType: Easing.InQuad
                containerwidth: rootId.width
            }

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "salmon";
                animDuration:rootId.animDuration ; easingText: "OutQuad"; easingType: Easing.OutQuad;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "tomato";
                animDuration:rootId.animDuration ; easingText: "InOutQuad"; easingType: Easing.InOutQuad;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "darkorange"
                animDuration:rootId.animDuration ; easingText: "OutInQuad"; easingType: Easing.OutInQuad;
                containerwidth: rootId.width}


            //Cubic
            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "gold"
                animDuration:rootId.animDuration ; easingText: "InCubic"; easingType: Easing.InCubic;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "yellow"
                animDuration:rootId.animDuration ; easingText: "OutCubic"; easingType: Easing.OutCubic;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "peachpuff"
                animDuration:rootId.animDuration ; easingText: "InOutCubic"; easingType: Easing.InOutCubic;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "thistle"
                animDuration:rootId.animDuration ; easingText: "OutInCubic"; easingType: Easing.OutInCubic;
                containerwidth: rootId.width}

            //Quart
            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "orchid"
                animDuration: rootId.animDuration; easingText: "InQuart"; easingType: Easing.InQuart;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "purple"
                animDuration:rootId.animDuration ; easingText: "OutQuart"; easingType: Easing.OutQuart;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "slateblue"
                animDuration:rootId.animDuration ; easingText: "InOutQuart"; easingType: Easing.InOutQuart;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "chartreuse"
                animDuration:rootId.animDuration ; easingText: "OutInQuart"; easingType: Easing.OutInQuart;
                containerwidth: rootId.width}

            //Quint
            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "limegreen"
                animDuration:rootId.animDuration ; easingText: "InQuint"; easingType: Easing.InQuint;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "seagreen"
                animDuration:rootId.animDuration ; easingText: "OutQuint"; easingType: Easing.OutQuint;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "darkgreen"
                animDuration:rootId.animDuration ; easingText: "InOutQuint"; easingType: Easing.InOutQuint;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "olive"
                animDuration:rootId.animDuration ; easingText: "OutInQuint"; easingType: Easing.OutInQuint;
                containerwidth: rootId.width}

            //Sine
            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "darkseagreen"
                animDuration:rootId.animDuration ; easingText: "InSine"; easingType: Easing.InSine;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "teal"
                animDuration:rootId.animDuration ; easingText: "OutSine"; easingType: Easing.OutSine;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "turquoise"
                animDuration: rootId.animDuration; easingText: "InOutSine"; easingType: Easing.InOutSine;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "steelblue"
                animDuration:rootId.animDuration ; easingText: "OutInSine"; easingType: Easing.OutInSine;
                containerwidth: rootId.width}

            //Expo
            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "skyblue"
                animDuration:rootId.animDuration ; easingText: "InExpo"; easingType: Easing.InExpo;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "royalblue"
                animDuration:rootId.animDuration ; easingText: "OutExpo"; easingType: Easing.OutExpo;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "mediumblue"
                animDuration:rootId.animDuration ; easingText: "InOutExpo"; easingType: Easing.InOutExpo;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "midnightblue"
                animDuration:rootId.animDuration ; easingText: "OutInExpo"; easingType: Easing.OutInExpo;
                containerwidth: rootId.width}

            //Circ
            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "cornsilk"
                animDuration:rootId.animDuration ; easingText: "InCirc"; easingType: Easing.InCirc;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "bisque"
                animDuration:rootId.animDuration ; easingText: "OutCirc"; easingType: Easing.OutCirc;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige";  endColor: "rosybrown"
                animDuration:rootId.animDuration ; easingText: "InOutCirc"; easingType: Easing.InOutCirc;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "sandybrown"
                animDuration:rootId.animDuration ; easingText: "OutInCirc"; easingType: Easing.OutInCirc;
                containerwidth: rootId.width}


            //Elastic
            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "cornsilk"
                animDuration:rootId.animDuration ; easingText: "InElastic"; easingType: Easing.InElastic;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "bisque"
                animDuration:rootId.animDuration ; easingText: "OutElastic"; easingType: Easing.OutElastic;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "rosybrown"
                animDuration:rootId.animDuration ; easingText: "InOutElastic"; easingType: Easing.InOutElastic;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "sandybrown"
                animDuration:rootId.animDuration ; easingText: "OutInElastic"; easingType: Easing.OutInElastic;
                containerwidth: rootId.width}


            //Black
            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "maroon"
                animDuration:rootId.animDuration ; easingText: "InBack"; easingType: Easing.InBack;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "lavenderblush"
                animDuration:rootId.animDuration ; easingText: "OutBack"; easingType: Easing.OutBack;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "mistyrose"
                animDuration:rootId.animDuration ; easingText: "InOutBack"; easingType: Easing.InOutBack;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "gainsboro"
                animDuration:rootId.animDuration ; easingText: "OutInBack"; easingType: Easing.OutInBack;
                containerwidth: rootId.width}


            //Bounce
            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "silver"
                animDuration:rootId.animDuration ; easingText: "InBounce"; easingType: Easing.InBounce;
                containerwidth: rootId.width }

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "dimgray"
                animDuration:rootId.animDuration ; easingText: "OutBounce"; easingType: Easing.OutBounce;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "slategray"
                animDuration:rootId.animDuration ; easingText: "InOutBounce"; easingType: Easing.InOutBounce;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "darkslategray"
                animDuration:rootId.animDuration ; easingText: "OutInBounce"; easingType: Easing.OutInBounce;
                containerwidth: rootId.width}

            //Bezier
            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "darkslategray"
                animDuration:rootId.animDuration ; easingText: "Bezier"; easingType: Easing.Bezier;
                containerwidth: rootId.width}

        }
    }
}
