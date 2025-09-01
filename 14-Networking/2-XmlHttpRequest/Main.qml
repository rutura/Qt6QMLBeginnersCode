import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("XmlHttpRequest")

    //Process the data right away
    /*
    function downloadData(url){
        //Create the object
        var xhr = new XMLHttpRequest()

        //Apply initial settings to the object
        xhr.onreadystatechange = function(){
            //HEADERS_RECEIVED
            //DONE

            if(xhr.readyState === XMLHttpRequest.HEADERS_RECEVED){
                console.log("Headers received")
            }else if(xhr.readyState === XMLHttpRequest.DONE){
                if(xhr.status == 200){
                    //console.log("Got the data from the server it is: " + xhr.responseText.toString())
                    textAreaId.text = xhr.responseText.toString()
                }else{
                    console.log("Something went wrong")
                }

            }
        }
        xhr.open("GET",url)
        xhr.send()
    }
    */

    //Go through a callback
    function downloadData(url,callback){
        //Create the object
        var xhr = new XMLHttpRequest()

        //Apply initial settings to the object
        xhr.onreadystatechange = function(){
            //HEADERS_RECEIVED
            //DONE

            if(xhr.readyState === XMLHttpRequest.HEADERS_RECEVED){
                console.log("Headers received")
            }else if(xhr.readyState === XMLHttpRequest.DONE){
                if(xhr.status == 200){
                    //console.log("Got the data from the server it is: " + xhr.responseText.toString())
                    //textAreaId.text = xhr.responseText.toString()
                    callback(xhr.responseText.toString())
                }else{
                    console.log("Something went wrong")
                }

            }
        }
        xhr.open("GET",url)
        xhr.send()
    }

    TextArea{
        id: textAreaId
        anchors.fill: parent
        textFormat: TextArea.RichText
        text: "Click to download html data"

    }

    MouseArea{
        anchors.fill: parent
        onClicked: function(){
            /*
              Urls to try :
                . https://www.qt.io/
                . https://github.com/
                . https://jsonplaceholder.typicode.com/
              */
            //Download data right away
            /*
            console.log("Clicked")
            downloadData("https://www.qt.io")
            */

            //Download the data through a callback
            downloadData("https://jsonplaceholder.typicode.com/",function(response){
                if(response){
                    textAreaId.text = response
                }else{
                    console.log("Something went wrong")
                }

            })
        }
    }
}
