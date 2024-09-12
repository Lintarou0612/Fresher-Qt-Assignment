// Button.qml
import QtQuick 2.0

Rectangle {
    id: root
    property string txt: ""
    property alias color: root.color
    signal pressed
    signal released
    width: 150
    height: 50
    color: "lightsteelblue"
    border.color: "slategrey"
    radius: 8
    anchors.centerIn: parent
    Text {
        id: label
        anchors.horizontalCenter: root.horizontalCenter
        anchors.verticalCenter: root.verticalCenter
        text: txt
    }
    MouseArea {
        anchors.fill: parent
        onPressed: {
            root.pressed()
            //parent.color = "blue"
        }
        onReleased: {
            root.released()
            //parent.color = "red"
        }
    }
}
//    Text {
//        id: label
//        anchors.horizontalCenter: root.horizontalCenter
//        anchors.verticalCenter: root.verticalCenter
//        //horizontalAlignment: Text.AlignHCenter
//        text: txt
//    }
//}
