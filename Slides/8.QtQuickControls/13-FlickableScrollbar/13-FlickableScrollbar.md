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

        . Exploring Flickable and ScrollBar
        . Allows visualize content that is bigger than the available
            screen space.
        . Content can be dragged and moved around.
        . This element forms the basis of Items that are designed to
            show large numbers of child items, such as ListView and GridView
        . Gives the ability to also set up scrollbars if you need them.
        . Use the docs and improvise for the rest.
        
---
![bg](images/slide_background.png)
# Flickable and ScrollBar
![](images/1.png)

---
![bg](images/slide_background.png)
# Flickable and ScrollBar
```qml
    Flickable{
        Column{
            id : mColumnId
            Rectangle {
                Text {
                    text: "Element 1"
                }
            }
            Rectangle {}
            Rectangle {}
            Rectangle {}
            //...
        }
        ScrollBar.vertical: ScrollBar{}
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

