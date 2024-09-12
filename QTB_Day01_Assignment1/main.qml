import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Button {
        id: button
        txt: "Start"
        onPressed: {
            button.color = "green"
        }
        onReleased: {
            button.color = "orange"
        }
    }
//    Button {
//        x: 100
//        y: 100
//        opacity: 0.7
//        txt: "Stop"
//    }
}
