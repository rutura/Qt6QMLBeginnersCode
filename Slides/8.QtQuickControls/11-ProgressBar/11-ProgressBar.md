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
        . Exploring ProgressbAR
            . The usual thing
            . The styles show up bad on Windows11 by default
                . We try Universal and Material to show how they look on
                    mobile and embedded devices

        . Improvise on the rest
        

---
![bg](images/slide_background.png)
# ProgressBar
![](images/1.png)

---
![bg](images/slide_background.png)
# ProgressBar getting values from Dial
```qml
        Dial {
           id : dialId
           from : 1;to : 100
           value : 40
           onValueChanged: {
               progressBarId.value = value
           }
        }

        ProgressBar {
           id : progressBarId
           from : 1;to : 100
           value : 40
        }
```

---

![bg](images/slide_background.png)
# Indeterminate ProgressBar
```qml
        ProgressBar {
            id : progressBarId1
            indeterminate: true
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

