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
            . Exploring some facilities from the Qt global object
            . quitting the applications
            . listing available fonts
            . Hashing a string
            . opening urls and local file paths
            . capturing platform information

       
---
![bg](images/slide_background.png)
# The Qt Global Object
![](images/1.png)

---
![bg](images/slide_background.png)

```qml
//Quit the application
console.log("Quitting the App")
Qt.quit()


```

---
![bg](images/slide_background.png)

```qml
//Get all available fonts on the system
property var fonts: Qt.fontFamilies()

//List the available fonts
for( var i = 0; i < fonts.length ; i++){
    console.log("["+ i + "] :" + fonts[i])
}
```

---
![bg](images/slide_background.png)
```qml
//Hash a string
var mName = "Daniel Gakwaya"
var mNameHash = Qt.md5(mName)
console.log("The hash of the name is :"+ mNameHash)
```

---
![bg](images/slide_background.png)
```qml
//Open url externally
Qt.openUrlExternally("https://www.learnqt.guide/udemy-discounted-9/")

//Open local files with default program
Qt.openUrlExternally("file:///D:/artwork/LearnQt.png")

//Capture platform info
console.log("The current platform is : "+Qt.platform.os)
```








