/*

    . Using XMLHttpRequest to download data from the internet.
    . You get data by calling the open method on yoUR XMLHttpRequest object
    . You can either call open asynchronously (default) or synchronously by putting
        in the 3rd bool parameter. See docs
    . In this lecture we'll just go with the default : asynchronous
    . Use the info you have and improvise.

  */

import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Downloading Http Data")


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
                    //Don't process the response right away, delegate that to the callback
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



    //Process the data right away
    /*
    function downloadData(url){

        //Create the object
        var xhr = new XMLHttpRequest();

        //Apply initial settings to the object
        xhr.onreadystatechange = function(){
            //XMLHttpRequest.HEADERS_RECEIVED
            //XMLHttpRequest.DONE
            if ( xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED){
                console.log("HEADERS RECEIVED")
            }else if(xhr.readyState === XMLHttpRequest.DONE ){
                if( xhr.status == 200){
                    //console.log("Got the data , it is : " + xhr.responseText.toString())
                    //textAreaId.text = xhr.responseText.toString();
                    console.log(xhr.responseText.toString())
                }else{
                    console.log("Something went wrong")
                }
            }
        }
        //Start the download
        xhr.open("GET",url)
        xhr.send()
    }
    */




    TextArea{
        id: textAreaId
        anchors.fill: parent
        textFormat: TextArea.RichText
        text: "Html Data here"
    }

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
            //downloadData("https://www.qt.io/")

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
}
