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
        . Exploring SwipeView and PageIndicator

            . We use them to allow the user to swipe through pages
            . Use the docs and the Qt5 course to fill in the details.
            . Improvise.
        

---
![bg](images/slide_background.png)
# RadioButton and CheckBox
![](images/1.png)

---
![bg](images/slide_background.png)
# SwipeView
```qml
    SwipeView{
        id : swipeViewId
       Image {
           id : image1
           fillMode: Image.PreserveAspectFit
           //source: "https://www.learnqt.guide/images/qt_quick_fundamentals.png"
           source:"qrc:/images/1.png"
       }
       Image {
           id : image2
           fillMode: Image.PreserveAspectFit
           //source: "https://www.learnqt.guide/images/qt_quick_intermediate.png"
           source: "qrc:/images/2.png"
       }
       //...
    }
```

---

![bg](images/slide_background.png)
# PageIndicator
```qml
    PageIndicator{
        id : pageIndicatorId
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        //Page indicator specific properties
        currentIndex: swipeViewId.currentIndex
        interactive: true
        count : swipeViewId.count
    }
```

---

![bg](images/slide_background.png)
# All together
```qml
import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480

    SwipeView{
        id : swipeViewId
        //...
    }
    PageIndicator{
        //...
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

