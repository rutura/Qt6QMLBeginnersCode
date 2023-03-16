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
        . Used to select folders
        . Use the doc and improvise

        
---
![bg](images/slide_background.png)
# FolderDialog
![](images/1.png)

---
![bg](images/slide_background.png)
# FolderDialog
```qml
    Column {
        Button{
            onClicked: {
                folderDialogId.open()
            }
        }
        Text {
            id : textId
            text : "Use hasn't chosen yet"
        }

        FolderDialog{
            id : folderDialogId
            onAccepted: {
                textId.text = selectedFolder
            }
            onRejected: {
                textId.text = "Dialog rejected"
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

