/*

        . Exploring the Image element
        . Different ways to load images :
            . from working directory
            . from resource file
            . from full path on the local file system
            . from web url path

        . To load image from resource, you have to :
            . set(CMAKE_AUTORCC ON)   in your CMakeLists.txt file
            . use the
                source: "qrc:/images/LearnQt.png"
                syntax in your Image element.

  */

import QtQuick

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("QML Basic Elements Demo")

    Item {
        id : containerItemId
        x : 150 ;y : 50

        width: 600
        height: 300

        //Load image from working directory
        Image {
            x : 10
            y : 150
            width: 100
            height: 100
            //Load image from the working directory
            source: "file:LearnQt.png"
        }


        Image {
            x : 150
            y : 150
            width: 100
            height: 100
            //Loading image from the resource file
            source: "qrc:/images/LearnQt.png"
        }

        //Load image from a full path

        Image {
            x : 300
            y : 150
            width: 100
            height: 100
            //Specify the full path to the image
            source: "file:///D:/Artwork/LearnQt.png"
        }


        Image {
            x : 450
            y : 150
            width: 100
            height: 100
            //Specify the full web path to the image
            source: "https://www.learnqt.guide/images/qt_gui_intermediate.png"
        }


    }
}
