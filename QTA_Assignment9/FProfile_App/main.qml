import QtQuick 2.12
import QtQuick.Controls 2.12
import com.assigment9 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Set Active User")

    Column {
        spacing: 20
        anchors.centerIn: parent

        ComboBox {
            id: userComboBox
            width: 200
            model: ListModel {
                ListElement { userName: "Guest"; userId: 0 }
                ListElement { userName: "Driver 1"; userId: 1 }
                ListElement { userName: "Driver 2"; userId: 2 }
            }
            textRole: "userName"
        }

        Button {
            id: activateButton
            text: qsTr("Activate")
            onClicked: {
                console.log(userComboBox.currentIndex)
                FProfile.setActiveUser(userComboBox.currentIndex)
            }
        }

        Label {
            id: statusLabel
            font.pixelSize: 20
            text: "Active user: " + userComboBox.currentText
        }
    }
}
