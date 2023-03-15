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

    . Exploring Range Slider
    . Use the docs and improvise.
        
---
![bg](images/slide_background.png)
# RangeSlider
![](images/1.png)

---
![bg](images/slide_background.png)
# RangeSlider
```qml
        RangeSlider{
            //orientation: Qt.Vertical
            from: 1
            to : 100
            first.value: 25
            second.value: 75

            first.onValueChanged: {
                console.log("First value changed to : "+ first.value)
            }
            second.onValueChanged: {
                console.log("Second value changed to :"+ second.value)
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

