import QtQuick 2.0
import QtQuick.Window 2.12
Rectangle {
    width: parent.width
    height: parent.height
    Rectangle {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        width: 150; height: 50
        color: "#a9a9a9"
        radius: 10
        Text {
            anchors.centerIn: parent
            color: "white"
            font.bold: true
            text: "Home"
            font.pixelSize: 20
        }
        MouseArea {
            anchors.fill: parent
            onClicked: appLoader.source = "Home.qml"
        }
    }
}
