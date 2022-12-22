/*

    . Exploring specific imports, export with js modules :
            . import :
                . syntax :  import {add,subtract} from "utilities2.mjs"

            . export :
                . syntax : export {add}

     . We explicitly specify that add and subtract are imported from
        utilities2.js into utilities1.js with :
            . import {add,subtract} from "utilities2.mjs"

     . We then explicitly export the add function for use in any file
        that imports utilities1.js

     . The good thing about this is that names can't accidently end up
        in main.qml without our consent, which could happed in we used
        Qt.include.

      . If we want something to be seen on the outside we export it,
        if we don't want to export we leave it unexported and it can
        only be used internally in the file.


  */

import QtQuick
import "utilities1.mjs" as Utilities1


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Javascript Import Demo")

    Rectangle {
        width : 300
        height: 100
        color: "yellowgreen"
        anchors.centerIn: parent

        Text {
            text : "Click Me"
            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {

              //Calling a properly exported mathod
               //console.log("Our ages combined yield :" + Utilities1.combineAges(33,17))


                //Difference
                //console.log("Age diff : " + Utilities1.ageDiff(33,17))


                //Just because add is usable from utilities1.js doesn't mean main.qml
                 // can use it. utilities2.js doesn't export it. You can export explicit names
                //as we'll see in a later lecture.
                 console.log ("The sum is : " + Utilities1.add(33,17))//




            }

        }
    }

}
