import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Image {
        id: myimage
        width: 120
        height: 120
        anchors.centerIn: parent
        source: receiver.getPath(receiver.id)
    }

    Text {
        id: info
        anchors.top: myimage.bottom
        anchors.horizontalCenter: myimage.horizontalCenter
        font.pixelSize: 16
        text: receiver.getname(receiver.id)
    }
}
