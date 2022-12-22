/*

        . In Qt6 XmlListModel doesn't support XPath queries
        . It supports simple slash-separated paths and,
            optionally, one attribute for each element
        . The querry :
            . query: "/courses/course"
          will target each course element in the XML file and turn it into
            an item for our model

        . We grab the data in the instructor element and make it available
             in our model under the rold "instructor" :
                . XmlListModelRole { name: "instructor"; elementName: "instructor" }
                . elementName specifies the element name in the xml file
                . name specifies the role this will be available as in the view

        . We also read the year and coursename in the same way

        . We also read the hot attribute of the coursename element and make
            it available under the role hot, in the model.

        . All these XmlListModelRoles are just setting up the roles under which
            the data will be available in our model :

                XmlListModelRole { name: "instructor"; elementName: "instructor" }
                XmlListModelRole { name: "year"; elementName: "year" }
                XmlListModelRole { name: "coursename"; elementName: "coursename" }
                XmlListModelRole { name: "hot"; elementName: "coursename"; attributeName: "hot" }

        . Point to the documentation for XmlListModel and XmlListModelRole for more examples.

  */

import QtQuick
import QtQuick.Window
import QtQml.XmlListModel


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("XmlListModel")


    XmlListModel {
        id: mXmlListModelId
        source: "qrc:/xml/employees.xml"
        query: "/courses/course"

        XmlListModelRole { name: "instructor"; elementName: "instructor" }
        XmlListModelRole { name: "year"; elementName: "year" }
        XmlListModelRole { name: "coursename"; elementName: "coursename" }
        XmlListModelRole { name: "hot"; elementName: "coursename"; attributeName: "hot" }

    }

    ListView{
        id : mListViewId
        anchors.fill: parent
        model : mXmlListModelId
        delegate: Rectangle {
            width : parent.width
            height: 50
            color : "beige"
            Row {
                spacing: 30
                Text {
                    text : instructor
                    font.pointSize: 15
                }
                Text {
                    text : coursename + " (" + year + ")"
                    font.bold: hot==="true"?true:false
                    font.pointSize: 15
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on : "+ hot)
                }
            }
        }
    }



}
