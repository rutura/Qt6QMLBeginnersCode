/*
    Exploring attached signal handlers

        . an attached signal handler receives a signal
            from an attaching type rather than the object within which the handler is declared.

        . For example, Component.onCompleted is an attached signal handler.
            It is often used to execute some JavaScript code when its creation process is complete.

         . The onCompleted handler is not responding to a completed signal
            from the Rectangle type. Instead, an object of the Component
            attaching type with a completed signal has automatically been
            attached to the Rectangle object by the QML engine. The engine
            emits this signal when the Rectangle object is created, thus
            triggering the Component.onCompleted signal handler.

         . Attached signal handlers allow objects to be notified of particular
            signals that are significant to each individual object. If there was no
            Component.onCompleted attached signal handler, for example, an object
            could not receive this notification without registering for some special
            signal from some special object. The attached signal handler mechanism
            enables objects to receive particular signals without extra code.


            EXPLAIN THIS :
          . A rectangle can't know when it finishes being created because it doesn't
                create itself. The QML engine which creates objects knows. A component
                property is automatically attached to the rectangle, and it's through
                that that we're able to process the Component.onCompleted handler letting
                us know that the rectangle is fully created. The completed signal isn't emited
                by the Rectangle here, it's emited by the QML engine.

  */

import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Attached signal handlers")

    Rectangle{
        width : 200
        height: 200
        color : "green"
        anchors.left: parent.left

        Component.onCompleted: {
            console.log("Finished setting up the rectangle")
        }
    }
}
