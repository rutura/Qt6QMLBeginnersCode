// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

import QtQuick
import QtQuick.Window
import QtQuick.Layouts

Window {
    id: rootId
    visible: true
    width: 640
    height: 480
    title: qsTr("Easings")

    property int animationDuration: 500
    property color startColor: "beige"
    property color endColor: "blue"


    Flickable {
        anchors.fill: parent
        contentHeight: mColumnId.implicitHeight


        ColumnLayout {
            id: mColumnId
            width: parent.width
            spacing: 2

            //The blueprint rectangle
            /*
            Rectangle {
                id: containerRectId
                width: parent.width
                height: 50
                color: "gray"

                Text {
                    text: "Easing.Linear"
                    anchors.centerIn: parent
                }

                Rectangle{
                    id: containedRectId
                    color: startColor
                    width: 50
                    height: 50
                    border {width : 5 ; color : "black" }
                    radius: 10


                    MouseArea{
                        anchors.fill: parent

                        property bool toRight: false
                        onClicked: {

                            if ( toRight === false)
                            {
                                toRight = true
                                //Animate X
                                mNumberAnimationId.to = containerRectId.width - containedRectId.width
                                mNumberAnimationId.start()

                                //Animate color
                                mColorAnimationId.from = startColor
                                mColorAnimationId.to = endColor
                                mColorAnimationId.start()

                                //Move to right
                            }else{
                                //Move to left
                                toRight = false
                                //Animate X
                                mNumberAnimationId.to = 0
                                mNumberAnimationId.start()

                                //Animate color
                                mColorAnimationId.from = endColor
                                mColorAnimationId.to = startColor
                                mColorAnimationId.start()
                            }

                        }
                    }
                    NumberAnimation{
                        id: mNumberAnimationId
                        target: containedRectId
                        property : "x"
                        easing.type : Easing.InOutElastic
                        to : containerRectId.width - containedRectId.width
                        duration: animationDuration
                    }


                    ColorAnimation {
                        id: mColorAnimationId
                        target: containedRectId
                        property : "color"
                        from: startColor
                        to: endColor
                        duration: animationDuration
                    }
                    Component.onCompleted: {
                        //console.log("The width of the contained rect is: " + parent.width)
                    }

                }

            }
            */





            MovingRectangle {
                backgroundColor: "gray"
                startColor: "beige"
                endColor: "blue"
                animDuration: animationDuration
                easingText: "Linear"
                easingType: Easing.Linear
                containerwidth: rootId.width
            }


            MovingRectangle {
                backgroundColor: "gray"
                startColor: "beige"
                endColor: "green"
                animDuration: animationDuration
                easingText: "InQuad"
                easingType: Easing.InQuad
                containerwidth: rootId.width
            }
            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "salmon";
                animDuration: animationDuration; easingText: "OutQuad"; easingType: Easing.OutQuad;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "tomato";
                animDuration: animationDuration; easingText: "InOutQuad"; easingType: Easing.InOutQuad;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "darkorange"
                animDuration: animationDuration; easingText: "OutInQuad"; easingType: Easing.OutInQuad;
                containerwidth: rootId.width}


            //Cubic
            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "gold"
                animDuration: animationDuration; easingText: "InCubic"; easingType: Easing.InCubic;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "yellow"
                animDuration: animationDuration; easingText: "OutCubic"; easingType: Easing.OutCubic;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "peachpuff"
                animDuration: animationDuration; easingText: "InOutCubic"; easingType: Easing.InOutCubic;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "thistle"
                animDuration: animationDuration; easingText: "OutInCubic"; easingType: Easing.OutInCubic;
                containerwidth: rootId.width}

            //Quart
            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "orchid"
                animDuration: animationDuration; easingText: "InQuart"; easingType: Easing.InQuart;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "purple"
                animDuration: animationDuration; easingText: "OutQuart"; easingType: Easing.OutQuart;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "slateblue"
                animDuration: animationDuration; easingText: "InOutQuart"; easingType: Easing.InOutQuart;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "chartreuse"
                animDuration: animationDuration; easingText: "OutInQuart"; easingType: Easing.OutInQuart;
                containerwidth: rootId.width}

            //Quint
            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "limegreen"
                animDuration: animationDuration; easingText: "InQuint"; easingType: Easing.InQuint;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "seagreen"
                animDuration: animationDuration; easingText: "OutQuint"; easingType: Easing.OutQuint;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "darkgreen"
                animDuration: animationDuration; easingText: "InOutQuint"; easingType: Easing.InOutQuint;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "olive"
                animDuration: animationDuration; easingText: "OutInQuint"; easingType: Easing.OutInQuint;
                containerwidth: rootId.width}

            //Sine
            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "darkseagreen"
                animDuration: animationDuration; easingText: "InSine"; easingType: Easing.InSine;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "teal"
                animDuration: animationDuration; easingText: "OutSine"; easingType: Easing.OutSine;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "turquoise"
                animDuration: animationDuration; easingText: "InOutSine"; easingType: Easing.InOutSine;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "steelblue"
                animDuration: animationDuration; easingText: "OutInSine"; easingType: Easing.OutInSine;
                containerwidth: rootId.width}

            //Expo
            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "skyblue"
                animDuration: animationDuration; easingText: "InExpo"; easingType: Easing.InExpo;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "royalblue"
                animDuration: animationDuration; easingText: "OutExpo"; easingType: Easing.OutExpo;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "mediumblue"
                animDuration: animationDuration; easingText: "InOutExpo"; easingType: Easing.InOutExpo;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "midnightblue"
                animDuration: animationDuration; easingText: "OutInExpo"; easingType: Easing.OutInExpo;
                containerwidth: rootId.width}

            //Circ
            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "cornsilk"
                animDuration: animationDuration; easingText: "InCirc"; easingType: Easing.InCirc;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "bisque"
                animDuration: animationDuration; easingText: "OutCirc"; easingType: Easing.OutCirc;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige";  endColor: "rosybrown"
                animDuration: animationDuration; easingText: "InOutCirc"; easingType: Easing.InOutCirc;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "sandybrown"
                animDuration: animationDuration; easingText: "OutInCirc"; easingType: Easing.OutInCirc;
                containerwidth: rootId.width}


            //Elastic
            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "cornsilk"
                animDuration: animationDuration; easingText: "InElastic"; easingType: Easing.InElastic;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "bisque"
                animDuration: animationDuration; easingText: "OutElastic"; easingType: Easing.OutElastic;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "rosybrown"
                animDuration: animationDuration; easingText: "InOutElastic"; easingType: Easing.InOutElastic;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "sandybrown"
                animDuration: animationDuration; easingText: "OutInElastic"; easingType: Easing.OutInElastic;
                containerwidth: rootId.width}


            //Black
            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "maroon"
                animDuration: animationDuration; easingText: "InBack"; easingType: Easing.InBack;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "lavenderblush"
                animDuration: animationDuration; easingText: "OutBack"; easingType: Easing.OutBack;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "mistyrose"
                animDuration: animationDuration; easingText: "InOutBack"; easingType: Easing.InOutBack;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "gainsboro"
                animDuration: animationDuration; easingText: "OutInBack"; easingType: Easing.OutInBack;
                containerwidth: rootId.width}


            //Bounce
            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "silver"
                animDuration: animationDuration; easingText: "InBounce"; easingType: Easing.InBounce;
                containerwidth: rootId.width }

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "dimgray"
                animDuration: animationDuration; easingText: "OutBounce"; easingType: Easing.OutBounce;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "slategray"
                animDuration: animationDuration; easingText: "InOutBounce"; easingType: Easing.InOutBounce;
                containerwidth: rootId.width}

            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "darkslategray"
                animDuration: animationDuration; easingText: "OutInBounce"; easingType: Easing.OutInBounce;
                containerwidth: rootId.width}

            //Bezier
            MovingRectangle {backgroundColor: "gray"; startColor: "beige"; endColor: "darkslategray"
                animDuration: animationDuration; easingText: "Bezier"; easingType: Easing.Bezier;
                containerwidth: rootId.width}

        }
    }
}
