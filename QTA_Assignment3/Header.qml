import QtQuick 2.0

Rectangle {
    property string txt: ""
    width: parent.width / 2
    height: 100
    color: "orange"
    border.color: "brown"
    border.width: 1
    Text {
        anchors.centerIn: parent
        text: txt
        color: "white"
        font.bold: true
        font.pixelSize: 20
    }
}
