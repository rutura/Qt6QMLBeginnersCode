---
marp: true
theme: default
class: invert
paginate : true
size: 16:9
footer: 'Slides by [Daniel Gakwaya](https://rutura.github.io/daniel.gakwaya/) at [LearnQtGuide](https://www.learnqt.guide/)'
---
![bg](images/slide_background.png)
# Notes to self
            . Exploring more about MouseArea
            . The onClicked handler
            . Using the event parameter to print x and y
                . Use functions for this
            . Handling wheel events
            . Handling hover
            . Dragging in another separate rectangle below

       
---
![bg](images/slide_background.png)
# MouseArea
![](images/1.png)

---
![bg](images/slide_background.png)
# MouseArea(1)
```qml
        MouseArea{
            anchors.fill: parent
            onClicked: function(mouse) {
                console.log(mouse.x)
                movingRectId.x =  mouse.x
            }

            onWheel:function(wheel) {
                console.log(" X : "+ wheel.x + " y : "+ wheel.y + " angleData :"+ wheel.angleDelta)
            }

            hoverEnabled: true
            onHoveredChanged: {
                if (containsMouse)
                {
                    containerRectId.color = "red"
                }else {
                    containerRectId.color = "green"
                }
            }
        }
```



---
![bg](images/slide_background.png)
# MouseArea(2)
```qml
        MouseArea{
            anchors.fill : parent
            drag.target: draggableRect
            drag.axis: Drag.XAxis
            drag.minimumX: 0
            drag.maximumX: dragContaierId.width - draggableRect.width

        }
```