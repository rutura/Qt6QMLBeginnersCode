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
    . Exploring the Dial control
    . Show the wrap property.
        

---
![bg](images/slide_background.png)
# Dial
![](images/1.png)

---
![bg](images/slide_background.png)
# DelayButton
```qml
        Dial{
            anchors.horizontalCenter: parent.horizontalCenter
            from: 1
            to : 100
            value: 50
            //wrap: true

            onValueChanged: {
                console.log(" Current value : " + Math.ceil(value))
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

