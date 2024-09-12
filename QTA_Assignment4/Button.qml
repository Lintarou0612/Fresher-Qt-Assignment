import QtQuick 2.0

Rectangle {
    id: root
    property alias text: numAndOpe.text
    property alias color: root.color
    property int widthB: 0
    property int heightB: 0
    signal clicked
    width: widthB
    height: heightB
    border.color: "#E1E1E1"
    border.width: 0.5
    radius: 10
    Text {
        anchors.centerIn: parent
        id: numAndOpe
        font.pixelSize: 16
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.clicked()
        }
    }
}
