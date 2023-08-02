/*


             . Show how to handle parameters from signals :
                . The Wf parameters into signal handlers is deprecated. Use JavaScript functions with formal parameters instead warning
                        console.log(mouse.x)
                    }
               . Using explicit js functions  :
                    onClicked: function(mouse){
                        console.log(mouse.x)
                    }
               . Using arrow functions :
                    onClicked: (mouse) => console.log(mouse.x)

               . Multiple parameter signals :
                    . We'll see about that when we know how to setup
                        custom signals.


  */

import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Signal Parameters")

    Rectangle{
        id: rect
        width: 150
        height: 150
        color: "red"

        MouseArea{
            anchors.fill: parent

            /*
            onClicked: {
                //Deprecated
                console.log(mouse.x)
            }
            */

            //Explicit Javascript function
            /*
            onClicked: function(mouse_param){
                console.log(mouse_param.x)
            }
            */

             //Arrow function
             onClicked: (mouse_param) => console.log(mouse_param.x)

        }
    }
}
