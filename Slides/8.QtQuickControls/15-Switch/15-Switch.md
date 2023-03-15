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
        . Exploring the Switch control
            . Allows you to turn things on and off
            . Show it in different styles for the best experience.
        
---
![bg](images/slide_background.png)
# Switch
![](images/1.png)

---
![bg](images/slide_background.png)
# Switch
```qml
    Column {
        Switch{
            text : "WiFi"; checked: true
            onCheckedChanged: {
                if(checked){
                    console.log("WiFi switch is turned ON")
                }else{
                    console.log("WiFi switch is turned OFF")
                }
            }
        }
        Switch{...}
        Switch{
            text : "NFC"; enabled: false
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

