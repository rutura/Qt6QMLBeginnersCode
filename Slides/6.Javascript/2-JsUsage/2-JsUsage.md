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
    . Exploring JS usage in QML
        . Show its usage
            . in property bindings
            . in functions
            . in signal handlers

       
---
![bg](images/slide_background.png)
# Javascript  Usage
![](images/1.png)

---
![bg](images/slide_background.png)
# Javascript Usage
```qml
     Rectangle {
        id : containerRectId
        width : getHeight()  //JS in Function
        height: 100
        color: x > 300 ? "red" : "green" //property binding

        //JS in signal handler
        onXChanged: {
            console.log("Current value of x : "+ x)
        }

        //Custom function
        function getHeight()
        {
            return  height * 2
        }
    }
```