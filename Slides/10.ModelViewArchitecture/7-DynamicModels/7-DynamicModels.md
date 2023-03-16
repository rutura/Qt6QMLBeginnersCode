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
    . Dynamically adding/removing data from the model
        . append()
        . clear()
        . remove()
        . set()

     . Point to the docs for the student to see other methods they can play with


    
---
![bg](images/slide_background.png)
# Dynamic Model(Modifications)
![](images/1.png)

---
![bg](images/slide_background.png)
# Append
```qml
     ColumnLayout {
        anchors.fill: parent
        ListView{
            id : mListViewId
            model:mListModel
            delegate :delegateId
            Layout.fillWidth : true
            Layout.fillHeight: true

        }

        Button {
            text : "Add Item"
            Layout.fillWidth : true
            onClicked: {
               mListModel.append({"firstName": "Daniel", "lastName":"Gakwaya"})
            }
        }
       
    }
```
---

![bg](images/slide_background.png)
# Clear
```qml
        Button {
            text : "Clear"
            Layout.fillWidth : true
            onClicked: {
                mListModel.clear()
            }
        }
```
---

![bg](images/slide_background.png)
# Remove
```qml
        Button {
            text : "Delete Item at index 2"
            Layout.fillWidth : true
            onClicked: {
                if ( 2  < mListViewId.model.count){
                    mListModel.remove(2,1)
                }else{
                    console.log("index is invalid")
                }
            }
        }
```
---

![bg](images/slide_background.png)
# Set
```qml
        Button {
            text : "Set item at index 2"
            Layout.fillWidth : true
            onClicked: {
                mListModel.set(2,{"firstName": "John", "lastName":"Doe"})

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

