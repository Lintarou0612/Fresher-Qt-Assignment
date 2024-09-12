import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id: rec
        width: 100
        height: 150
        x: parent.width / 2 - width / 2
        y: parent.height / 2 - height / 2
        //anchors.centerIn: parent
        color: "red"
        border.color: "green"
        border.width: 5
        radius: 8
        MouseArea {
            id: backgroundClick
            anchors.fill: parent
            drag.target: rec
            drag.axis: Drag.XAndYAxis
            onClicked: {
                rec.rotation += 20;
            }
            focus: true
        }
    }
}
