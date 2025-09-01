import QtQuick

Rectangle{
    id: rootId
    signal clicked
    MouseArea{
        anchors.fill: parent
        onClicked: function(){
            rootId.clicked()
        }
    }
}
