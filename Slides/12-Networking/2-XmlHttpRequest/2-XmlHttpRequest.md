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
    . Using XMLHttpRequest to download data from the internet.
    . You get data by calling the open method on yoUR XMLHttpRequest object
    . You can either call open asynchronously (default) or synchronously by putting
        in the 3rd bool parameter. See docs
    . In this lecture we'll just go with the default : asynchronous
    . Use the info you have and improvise.
       
---
![bg](images/slide_background.png)
# XMLHttpRequest
![](images/1.png)

---
![bg](images/slide_background.png)
# Download with a callback
```qml
     //Process the data in a callback
    function downloadData(url, callback)
    {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            //XMLHttpRequest.HEADERS_RECEIVED
            //XMLHttpRequest.DONE
            if ( xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED){
                console.log("HEADERS RECEIVED")
            }else if(xhr.readyState === XMLHttpRequest.DONE ){

                if( xhr.status == 200){
                    console.log("Resource found")
                    callback(xhr.responseText.toString())
                }else{
                    console.log("Resource not found")
                    callback(null)
                }
            }
        }
        //Kick off the download
        xhr.open("GET",url)
        xhr.send()
    }
```

---
![bg](images/slide_background.png)
# Download Right Away
```qml
    //Process the data right away

    function downloadData(url){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            //XMLHttpRequest.HEADERS_RECEIVED
            //XMLHttpRequest.DONE
            if ( xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED){
                console.log("HEADERS RECEIVED")
            }else if(xhr.readyState === XMLHttpRequest.DONE ){
                if( xhr.status == 200){
                    //console.log("Got the data , it is : " + xhr.responseText.toString())
                    textAreaId.text = xhr.responseText.toString();
                }else{
                    console.log("Something went wrong")
                }
            }
        }
        //Kick off the download
        xhr.open("GET",url)
        xhr.send()
    }
```

---
![bg](images/slide_background.png)
# Trigger the download
```qml
    MouseArea{
        anchors.fill: parent
        onClicked: {
            /*
              Urls to try :
                . https://www.qt.io/
                . https://github.com/
                . https://jsonplaceholder.typicode.com/
              */

            //Process the data right away
            //downloadData("http://www.icndb.com/")

            //Using callback
            downloadData("https://jsonplaceholder.typicode.com/", function(response){
                if ( response)
                {
                    textAreaId.text = response

                }else{
                    //null
                    textAreaId.text = "Some error"
                }

            })
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

