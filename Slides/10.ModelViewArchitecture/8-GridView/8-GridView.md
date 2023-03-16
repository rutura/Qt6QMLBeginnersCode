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
        . Exploring GridView
        . Shows elements in a Grid
        . Show layoutDirection and Flow
        . Take ref from the docs and the Qt5 course.



    
---
![bg](images/slide_background.png)
# GridView
![](images/1.png)

---
![bg](images/slide_background.png)
# GridView
```qml
    GridView{
        id : mGridViewId
        anchors.fill: parent
        //flow : GridView.FlowTopToBottom
        //layoutDirection: Qt.RightToLeft
        model: modelId
        delegate: Rectangle {
            width: 100
            height: width
            color: mColor
            Text {
                text : mNumber
                anchors.centerIn: parent
                font.pointSize: 20
            }
        }
    }
```
---

![bg](images/slide_background.png)
# The model
```qml
   ListModel {
        id : modelId
        ListElement {
            mNumber: 1
            mColor: "red"
        }
        ListElement {
            mNumber: 2
            mColor: "green"
        }
        ListElement {...}

    }
```
---

![bg](images/slide_background.png)
## CMake
```cmake
find_package(Qt6 6.2 COMPONENTS Quick QuickControls2 REQUIRED)
...
target_link_libraries(app2-Button
    PRIVATE Qt6::Quick Qt6::QuickControls2)

```

