import QtQuick 2.0

Rectangle {
    id: root
    signal clicked
    property string name: ""
    y: parent.height - height
    width: parent.width / 2
    height: parent.height / 10
    color: "orange"
    border.color: "brown"
    border.width: 1
    Text {
        id: text
        color: "white"
        font.pixelSize: 20
        font.bold: true
        text: qsTr(name)
        anchors.centerIn: parent
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.clicked()
        }
    }
}

