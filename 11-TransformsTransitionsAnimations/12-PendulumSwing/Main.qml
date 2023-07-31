/*
        . An example to combine sequentialanimation and easing curves
            to build something cool.

        . Improvise.
  */
import QtQuick
import QtQuick.Window

Window {
    width: 400
    height: 400
    visible: true
    title: "pendulum Swing"

    property int pendulumId_angle: 30
    property int anim_duration: 900

    Rectangle {
        id: pendulumId
        width: 20
        height: 200
        color: "black"
        x: (parent.width - width) / 2
        y: 50
        transformOrigin: Item.Top

        Rectangle {
            id: bobId
            width: 50
            height: 50
            color: "red"
            radius: width / 2
            x: (pendulumId.width - width) / 2
            y: pendulumId.height
            transformOrigin: Item.Bottom // Play with Item.Top here to see what you like
            rotation: pendulumId.rotation // The bob will also pick up the angle from the pendulum arm
        }

        SequentialAnimation{
            loops: Animation.Infinite
            running: true

            NumberAnimation {
                id: right_to_left_id
                target: pendulumId
                property: "rotation"
                from: -pendulumId_angle
                to: pendulumId_angle
                duration: anim_duration
                easing.type: Easing.InOutQuad
            }

            NumberAnimation {
                id: left_to_right_id
                target: pendulumId
                property: "rotation"
                from: pendulumId_angle
                to: -pendulumId_angle
                duration: anim_duration
                easing.type: Easing.InOutQuad
            }
        }
    }
}