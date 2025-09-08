import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Transforms")

    ClickableRect{
        id: rect1Id
        width: 100
        height: 100
        x: 50
        y: 100
        color: "red"
        onClicked: function(){
            //Translation on x
            x += 20
        }
    }
    ClickableRect{
        id: rect2Id
        width: 100
        height: 100
        transformOrigin: Item.TopRight
        x: 250
        y: 100
        color: "green"
        onClicked: function(){
            // Rotation
            rotation += 15
        }
    }
    ClickableRect{
        id: rect3Id
        width: 100
        height: 100
        transformOrigin: Item.BottomLeft
        x: 450
        y: 100
        color: "blue"
        onClicked: function(){
            //scaling
            scale += 0.05

            //rotation
            rotation += 20
        }
    }

}
