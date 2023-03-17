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
    . Introduce property bindings
    . Show that changing the binding with a static value breaks the binding
    . Show how to update the binding with the Qt.binding thing

       
---
![bg](images/slide_background.png)
# Property Bindings
![](images/1.png)

---
![bg](images/slide_background.png)
# Red
```qml
    Rectangle {
        id : redRectId
        width: 50
        height: width * 1.5
        color: "red"
    }


```

---
![bg](images/slide_background.png)
# Blue
```qml
    Rectangle {
        id : blueRectId
        color: "blue"
        width: 100
        height: 100
        anchors.bottom: parent.bottom
        MouseArea {
            anchors.fill: parent
            onClicked: {
                redRectId.width = redRectId.width +10
            }
        }
    }
```

---
![bg](images/slide_background.png)
# Green
```qml
    Rectangle {
        id : greenRectId
        color: "green"
        width: 100
        height: 100
        anchors.bottom: parent.bottom
        anchors.left: blueRectId.right
        MouseArea {
            anchors.fill: parent
            onClicked: {
              //redRectId.height = 100 // Doesn't work
              //redRectId.height = redRectId.width * 1.5 // Doesn't work either

              redRectId.height = Qt.binding(function(){
                return redRectId.width * 2
              })

            }
        }
    }
```






