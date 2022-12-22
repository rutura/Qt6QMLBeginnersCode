/*
        . Getting data from a remote rest api
        . We use : https://jsonplaceholder.typicode.com/users
        . The fetching of the data is exactly the same as in the last lecture
        . Once we get the data we parse it into json :
            . var object = JSON.parse(response)
        . And loop through the json array we get from the internet
        . Adding json objects to the listmodel :
             .   //Loop over the json object capturing joke data
                        object.forEach(function(userdata){
                            mListModelId.append({"userdata" : userdata.name})

                        })

        . Improvise.

  */

import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Rest APIs Demo")

    function fetchData( url , callback){

        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
                print('HEADERS_RECEIVED');
            } else if(xhr.readyState === XMLHttpRequest.DONE) {
                print('DONE')
                if ( xhr.status == 200)
                {
                    console.log("resource found" + xhr.responseText.toString())
                    callback(xhr.responseText.toString())
                }else
                {
                    callback(null)
                }
            }
        }
        xhr.open("GET",url );
        xhr.send();

    }

    ColumnLayout{
        anchors.fill: parent
        spacing: 0


        ListModel{
            id : mListModelId
        }

        ListView{
            id : mListViewId
            model: mListModelId
            delegate: delegateId
            Layout.fillWidth: true
            Layout.fillHeight: true

        }

        Button{
            id : buttonId
            Layout.fillWidth: true
            text : "Fetch"
            onClicked: {
                fetchData("https://jsonplaceholder.typicode.com/users", function(response){
                    if ( response){
                        //Parse the data
                        //Turn the returned JSON string into a JSON object that you can parse
                        var object = JSON.parse(response)

                        //Loop over the json object capturing joke data
                        object.forEach(function(userdata){
                            mListModelId.append({"userdata" : userdata.name})

                        })
                    }else{
                        console.log("Something went wrong")
                    }


                })


            }


        }

        Component {
            id : delegateId
            Rectangle {
                id : rectangleId
                width : parent.width
                height: textId.implicitHeight+30
                color: "beige"
                border.color: "yellowgreen"
                radius: 5

                Text {
                    width : parent.width
                    height: parent.height
                    id : textId
                    anchors.centerIn: parent
                    text : userdata //Or modelData
                    //text : modelData
                    font.pointSize: 13
                    wrapMode: Text.WordWrap
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }

            }



        }

    }

}
