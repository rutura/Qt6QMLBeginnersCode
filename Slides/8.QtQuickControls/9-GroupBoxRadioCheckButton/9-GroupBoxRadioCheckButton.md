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
        . Using GroupBox to wrap around RadioButton and CheckBox
        . Knowing when the checked state of a button changes
        . The rest is intuitional
        

---
![bg](images/slide_background.png)
# RadioButton and CheckBox
![](images/1.png)

---
![bg](images/slide_background.png)
# RadioButton
```qml
        GroupBox{
            title: "Choose bonus"
            Column{

                RadioButton{
                    text : "Coke"
                    onCheckedChanged: {
                        if( checked){
                            console.log("Coke button checked")
                        }else{
                            console.log("Coke button is NOT checked")
                        }
                    }
                }
                RadioButton{
                    text : "Green Tea"
                }
                RadioButton{
                    text : "Ice Cream"
                }
            }
        }
```

---

![bg](images/slide_background.png)
# CheckBox
```qml
        GroupBox{
            title: "Choose Qt supported Desktop Platform"
            Column{
                CheckBox{
                    text : "Windows"
                    onCheckedChanged: {
                        if( checked){
                            console.log("Windows button checked")
                        }else{
                            console.log("Windows button is NOT checked")
                        }
                    }
                }
                CheckBox{
                    text : "Mac"
                }
                CheckBox{
                    text : "Linux"
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

