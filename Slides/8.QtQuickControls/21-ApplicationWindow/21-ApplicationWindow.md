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

    . Exploring ApplicationWindow
        . Menus and menu items and actions
        . toolbars and actions
        . main content : stackView
        . footer

    . Note : Note: A pop() operation on a stack with
        depth 1 or 0 does nothing. In such cases, the
        stack can be emptied using the clear() method.

    . This explains why we see a depth of 2 when we change pages.
     . Improvise and refer to the Qt 5 course if necessary.

        
---
![bg](images/slide_background.png)
# Drawer
![](images/1.png)

---


![bg](images/slide_background.png)
# A bird's eye view
```qml
ApplicationWindow {
    visible: true
    width: 640
    height: 480

    menuBar: MenuBar {...}
    header: ToolBar {...}
    footer: TabBar {...}

    //Main Content
    StackView {
        id : mStackId
        anchors.fill: parent
        initialItem: Page1{

        }
    }
}
```

---

![bg](images/slide_background.png)
# Page component
```qml
import QtQuick 2.12
Rectangle {
    color: "red"
} 
```

---


![bg](images/slide_background.png)
# Menus
```qml
 menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            Action {
                id : newActionId
                text: qsTr("&New")
                icon.source: "qrc:/images/newFileIcon.png"
                onTriggered: {
                    console.log("Clicked on new")
                }
            }
            Action {...}
            MenuSeparator{}
            Action {...}
        }
        Menu {...}
        Menu {...}
    }
```

---

![bg](images/slide_background.png)
# ToolBar
```qml
    header: ToolBar {
        Row {
            anchors.fill: parent
            ToolButton{
                action: newActionId
            }
            ToolButton{
                action: saveActionId
            }
            ToolButton{
                action: saveAsActionId
            }
            ToolButton{
                action: quitActionId
            }
        }
    }
```

---

![bg](images/slide_background.png)
# Footer
```qml
    footer: TabBar {
        id : mTabBar
        width: parent.width

        TabButton {
            text : qsTr("Page1")
            onClicked: {
                mStackId.pop()
                mStackId.push("Page1.qml")
                console.log("Number of items : " + mStackId.depth)
            }
        }
        TabButton {...}
        TabButton {...}
    }
```

---
![bg](images/slide_background.png)
# NoCode
```qml

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

