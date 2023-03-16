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

        . Exploring fontDialog
        . Used to select fonts
        . Use the doc and improvise based on the code here


        
---
![bg](images/slide_background.png)
# FontDialog
![](images/1.png)

---
![bg](images/slide_background.png)
# FontDialog
```qml
    Column {
        Button{
            onClicked: {
                fontDialogId.open()
            }
        }
        Text {
            id : textId
            text : "Hello World"
        }
        FontDialog{
            id : fontDialogId
            currentFont : Qt.font({ family: "Arial", pointSize: 24, weight: Font.Normal })
            onAccepted: {
                textId.font = fontDialogId.selectedFont
            }
            onRejected: {
                console.log("Dialog rejected")
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

