import QtQuick 2.12

Rectangle {
    id : root
    signal clicked
    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()

    }

}
