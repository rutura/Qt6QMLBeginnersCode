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
    . Exploring how to import js from other js files

    . Importing JS : https://doc.qt.io/qt-6/qtqml-javascript-imports.html

    . Js code will be stored in regular js files

    . Key syntax :
        . .import "utilities2.js" as Utilities2  //The dot needs to be there
        .  This syntax  is an extension to JavaScript provided by the QML
            engine and will work also with non-modules (mjs). As an extension
            superseded by the ECMAScript standard, its usage is discouraged

        . We'll see how to work with javascript modules (.mjs) in a later lecture

    . By importing utilities2.js into utilities1.js, you don't get to directly
        use the add function from main.qml like so :
            onClicked: {
                 value = Utilities1.add(33,17) //Error

            }

     . If that's what you want, you can use Qt.include, as we'll see in a
        later lecture.

       
---
![bg](images/slide_background.png)
# JS Indirect Import
![](images/1.png)

---
![bg](images/slide_background.png)
# utilities2.js
```qml
function add(a,b) {
    console.log("Method from utilities2.js called")
    return a + b
}

```
---
![bg](images/slide_background.png)
# utilities1.js
```qml
.import "utilities2.js" as Utilities2

function greeting()
{
    console.log("Hello there from external JS file : utilities1.js")
}

function combineAges( age1, age2)
{
    return Utilities2.add(age1,age2)
}

```
---
![bg](images/slide_background.png)
# main.qml
```qml
import "utilities1.js" as Utilities1
Window {
    visible: true
    width: 640
    height: 480

    Rectangle {
        color: "yellowgreen"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                //console.log("Our ages combined yield :" + Utilities1.combineAges(33,17))
                // value = Utilities1.add(33,17) //Error
            }
        }
    }
}


```
