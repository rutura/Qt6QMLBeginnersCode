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
        . Exploring standalone animations
        . Animations in which you explicitly specify the target element
            to be animated.
        . You have to explicitly start the animation by default
        . Improvise and use the Qt 5 course as a reference if necessary.
        . Ofcourse use the docs


        
---
![bg](images/slide_background.png)
# Standalone Animations
![](images/1.png)

---
![bg](images/slide_background.png)
# Animated Rectangle
```qml
        Rectangle {
            id : containedRectId
            color: "dodgerblue"

            NumberAnimation {
                id : mXAnimationId
                target: containedRectId
                property: "x"
                duration: 2000
                to : 530

            }
            RotationAnimation{
                id : mRotationAnimation
                target: containedRectId
                property : "rotation"
                to : 2000
                duration: 2000
            }
        }
```

---
![bg](images/slide_background.png)
# Freedom
* These animations can live outside the element they are animating. They are free!
* They have to be explicitly started or stoped
* Unlike just going through the running property like we did earlier in the chapter

---
![bg](images/slide_background.png)
# Control the animation
```qml
        MouseArea {
            anchors.fill: parent
            onPressed : {
                mXAnimationId.start()
                mRotationAnimation.start()

            }
            onReleased: {
                mXAnimationId.stop()
                mRotationAnimation.stop()

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

