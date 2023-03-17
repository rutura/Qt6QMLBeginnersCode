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
            . Exploring the TextInput Component :
            . Allows user to type a single line of text
            . Handle the editingFinished signal.
            . Show other signals in the docs 

       
---
![bg](images/slide_background.png)
# TextInput
![](images/1.png)

---
![bg](images/slide_background.png)
# TextInput
```qml
        Rectangle {
            id : firstNameRectId
            color : "beige"
            Text {
                id : firstNameLabelId
                text : "FirstName :"
            }
        }

        Rectangle {
            id : firstNameTextRectId
            color : "beige"

            TextInput {
                id : firstNameTextId
                focus: true
                text : "Type in your first name"
                onEditingFinished: {
                    console.log("The first name changed to :"+ text)
                }
            }
        }
```