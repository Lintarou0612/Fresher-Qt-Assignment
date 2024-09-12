import QtQuick 2.0

Rectangle {
    id:root
    signal clicked
    width: 60; height: 60
    //x: 18; y: 18
    color: "transparent"
    anchors.left: parent.left
    anchors.leftMargin: 18
    anchors.top: parent.top
    anchors.topMargin: 18
    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.clicked()
        }
    }
}
