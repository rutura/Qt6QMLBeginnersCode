import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Rest API")

    function fetchData(url, callback) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
                print('HEADERS_RECEIVED');
            } else if (xhr.readyState === XMLHttpRequest.DONE) {
                print('DONE');
                if (xhr.status == 200) {
                    console.log("resource found" + xhr.responseText.toString());
                    callback(xhr.responseText.toString());
                } else {
                    callback(null);
                }
            }
        };
        xhr.open("GET", url);
        xhr.send();
    }


    ColumnLayout{
        anchors.fill: parent
        spacing: 0

        ListModel{
            id: listModelId
        }

        ListView{
            id: listViewId
            model: listModelId
            delegate: delegateId
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        Button{
            id: buttonId
            Layout.fillWidth: true
            text: "Fetch"
            onClicked: function(){
                listModelId.clear()

                //Call the function to download data
                fetchData("https://jsonplaceholder.typicode.com/users",function(response){

                    if(response){
                        console.log("Response is good")
                        //Parse the data
                        var object = JSON.parse(response)

                        //Loop over the JSON array
                        object.forEach(function(userdata){
                            listModelId.append({
                                                   "userdata": userdata.name
                                               })
                        })

                    }else{
                        console.log("Something went wrong")
                    }



                })

            }

        }

        Component {
            id: delegateId
            Rectangle {
                id: rectangleId
                width: parent.width
                height: textId.implicitHeight + 30
                color: "beige"
                border.color: "yellowgreen"
                radius: 5

                Text {
                    id: textId
                    width: parent.width
                    height: parent.height
                    anchors.centerIn: parent
                    text: userdata //Or modelData
                    //text: modelData
                    font.pointSize: 13
                    wrapMode: Text.WordWrap
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }
}
