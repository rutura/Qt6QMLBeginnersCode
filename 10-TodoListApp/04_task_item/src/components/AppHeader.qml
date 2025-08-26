import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    height: 80

    signal toggleDarkMode()

    // Properties that will be bound from parent
    property color textColor: "#333333"
    property color textSecondary: "#999999"
    property bool darkMode: false

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        RowLayout{
            anchors.fill: parent
            anchors.leftMargin: 8
            anchors.rightMargin: 8
            spacing: 12

            // App icon
            Text {
                text: "📝"
                font.pixelSize: 32
            }

            // App title and subtitle
            Column {
                Layout.fillWidth: true
                spacing: 2

                Text {
                    text: "My Tasks"
                    font.pixelSize: 28
                    font.weight: Font.Bold
                    color: root.textColor
                }

                Text {
                    text: qsTr("Stay organized, stay productive")
                    font.pixelSize: 12
                    color: root.textSecondary
                    opacity: 0.8
                }
            }

            // Dark mode toggle
            Button {
                id: themeToggle
                Layout.preferredWidth: 50
                Layout.preferredHeight: 50

                background: Rectangle {
                    color: themeToggle.pressed ?
                           (root.darkMode ? "#404040" : "#e0e0e0") :
                           (root.darkMode ? "#2d2d2d" : "#f5f5f5")
                    radius: 25
                    border.color: root.darkMode ? "#555555" : "#d0d0d0"
                    border.width: 1
                }

                contentItem: Text{
                    text: root.darkMode ? "☀️" : "🌙"
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                // Emit the signal when the button is clicked
                onClicked: root.toggleDarkMode()
            }
        }
    }
}
