import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Test FProfile Library")

    Column {
        spacing: 20
        anchors.centerIn: parent

        Button {
            text: "Set Active User to Guest"
            onClicked: fProfile.setActiveUser(0)
        }

        Button {
            text: "Set Active User to Driver 1"
            onClicked: fProfile.setActiveUser(1)
        }

        Button {
            text: "Set Active User to Driver 2"
            onClicked: fProfile.setActiveUser(2)
        }

        Image {
            id: avatarImage
            width: 100
            height: 100
            source: ""
        }

        Text {
            id: activeUserText
            text: "Active User: None"
        }
    }

    Connections {
        target: profileListener
        onActiveUserChanged: {
            activeUserText.text = "Active User: " + id;
            console.log("Active user changed to ID: " + id);

            // Update avatar image based on active user ID
            switch(id) {
                case 0:
                    avatarImage.source = "qrc:/images/guest.png";
                    break;
                case 1:
                    avatarImage.source = "qrc:/images/driver1.png";
                    break;
                case 2:
                    avatarImage.source = "qrc:/images/driver2.png";
                    break;
                default:
                    avatarImage.source = "";
                    break;
            }
        }
    }
}
