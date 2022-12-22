/*
    . Exploring the Button Control

            . Showing the Button code
            . It's just a clickable button
            . Under the hood it may be built using raw components like
                Rectange and MouseArea but it makes it easy to have a button without
                wrapping MouseAreas in Rectangles

            . Handle the clicked and doubleClicked signals and show them in the docs

            . Show it in a :
                . RowLayout
                . ColumnLayout

             . To set custom styles in main.cpp :
                . We need QQuickStyle
                . To get access to that we need to bring QuickControls2 into our cmake file :
                    . find_package(Qt6 6.2 COMPONENTS Quick QuickControls2 REQUIRED)
                    . target_link_libraries(app2-Button PRIVATE Qt6::Quick Qt6::QuickControls2)
                . We can then include the header and set the styles in main.cpp :
                    . #include <QQuickStyle>
                    .       //Load our style
                            //QQuickStyle::setStyle("Material");
                            //QQuickStyle::setStyle("Universal");
                            //QQuickStyle::setStyle("Fusion");
                            //QQuickStyle::setStyle("Imagine");
                            QQuickStyle::setStyle("Default");
                    . Document the differences in these styles well.


            . Show the styles :
                . Default
                . Universal
                . Material
                . Fusion


  */

import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Button")

    RowLayout {
        anchors.left: parent.left
        anchors.right: parent.right

        Button {
            id : button1
            text: "Button1"
            Layout.fillWidth: true
            onClicked: {
                console.log("Clicked on button1")
            }
            onDoubleClicked: {
                console.log("Double clicked on button1")
            }
        }

        Button{
            id : button2
            text : "Button2"
            Layout.fillWidth: true
            onClicked: {
                console.log("Clicked on button2")
            }
        }
    }
}
