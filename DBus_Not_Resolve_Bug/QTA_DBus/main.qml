import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
//    Rectangle {
//        width: parent.width
//        height: parent.height

//        Text {
//            id: activeUserText
//            text: "Active User: " + profileManager.activeUserId
//            anchors.centerIn: parent
//        }

//        Component.onCompleted: {
//            profileManager.setActiveUser(1);
//        }

//        Connections {
//            target: profileManager
//            onUserActived: {
//                activeUserText.text = "Active User: " + id;
//            }
//        }
//    }
}
