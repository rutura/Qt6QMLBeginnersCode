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
        . Showing some custom dialogs you can use even on mobile
        . Start by running the gallery example and show the dialogs
            . just like in the Qt 5 course
        . From there, create a project and steal the code for the
            custom dialogs and learn from them

        . Change the contentHeight property in the Button for content
                to not cause binding loops by making it depend on the parent height.

        . The goal here is to help students steal things from Qt examples.

        . Use the info above as a base and improvise.
     
---
![bg](images/slide_background.png)
# Custom Dialogs
![](images/1.png)

---
![bg](images/slide_background.png)
# Message
![](images/2.png)

---
![bg](images/slide_background.png)
# Confirmation
![](images/3.png)

---
![bg](images/slide_background.png)
# Content
![](images/4.png)

---
![bg](images/slide_background.png)
# Input
![](images/5.png)



---
![bg](images/slide_background.png)
# Using the Qt Examples
* There are tons of examples from the Qt project you can learn from
* We'll learn from the Gallery example and build all these cool dialogs

---

![bg](images/slide_background.png)
## CMake
```cmake
find_package(Qt6 6.2 COMPONENTS Quick QuickControls2 REQUIRED)
...
target_link_libraries(app2-Button
    PRIVATE Qt6::Quick Qt6::QuickControls2)

```

