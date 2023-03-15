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
        Exploring the slider.
        . Same thing as slider
        . May be set this up as an exercise.
        
---
![bg](images/slide_background.png)
# Slider
![](images/1.png)

---
![bg](images/slide_background.png)
# Slider
```qml
    Column {
        Slider {
            from : 1; to : 100
            value: 40
            onValueChanged: {
                progressBarId.value = value
            }
        }

        ProgressBar {
            id : progressBarId
            from : 1; to : 100
            value: 40
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

