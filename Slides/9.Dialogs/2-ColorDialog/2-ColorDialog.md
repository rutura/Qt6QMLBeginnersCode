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
    .   Exploring colorDialog
    . Just make sure you use the documentation for QtQuick.Dialogs
        
---
![bg](images/slide_background.png)
# ColorDialog
![](images/1.png)

---
![bg](images/slide_background.png)
# ColorDialog
```qml
  Column {
        Button{
            text : "Choose Color"
            onClicked: {
                colorDialogId.open()
            }
        }
        Rectangle{
            id : rectangleId
        }
        ColorDialog{
            id : colorDialogId
            title: "Please Choose a Color"
            onAccepted: {
                rectangleId.color = selectedColor
            }
            onRejected: {
                console.log("User rejected dialog")
            }
        }
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

