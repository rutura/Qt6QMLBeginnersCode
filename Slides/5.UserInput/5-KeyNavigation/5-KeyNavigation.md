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
              . Exploring the KeyNavigation attached property
            . Allows to shift focus to other components in a ui
            . start out with the commented code below
            . Then steal the snippet from the docs and use it
                just for the fun of it.
     
---
![bg](images/slide_background.png)
# KeyNavigation
![](images/1.png)

---
![bg](images/slide_background.png)
# KeyNavigation
```qml
          Rectangle {
              id: topLeft
              color: focus ? "red" : "lightgray"
              focus: true

              KeyNavigation.right: topRight
              KeyNavigation.down: bottomLeft
          }

          Rectangle {
              id: topRight
              color: focus ? "red" : "lightgray"

              KeyNavigation.left: topLeft
              KeyNavigation.down: bottomRight
          } 
          //...
```

