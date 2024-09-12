import QtQuick 2.12
import QtQuick.Controls 2.12
//import QtQuick.Window 2.12
Item {
    id: formSubmit
    Text {
        id: familyNameTxt
        anchors {
            left: parent.left
            leftMargin: 15
            top: parent.top
            topMargin: 30
        }

        text: translator.FAMILYNAME_TITLE_FORM_STRING_ID//qsTr("Family name")
        font.bold: true
        font.pixelSize: 14
    }
    TextField {
        id: familyName
        width: parent.width - 50
        height: 40
        anchors {
            left: parent.left
            leftMargin: 15
            top: familyNameTxt.bottom
            topMargin: 10
        }
        placeholderText: translator.FAMILYNAME_PLACEHOLD_STRING_ID//qsTr("Enter family name")

        background: Rectangle {
            implicitWidth: parent.width
            implicitHeight: parent.height
            radius: 3
            color: "transparent"
            border.color: "black"//textNameForm.enabled ? "#21be2b" : "transparent"
        }
    }
    Text {
        id: nameTxt
        anchors {
            left: parent.left
            leftMargin: 15
            top: familyName.bottom
            topMargin: 20
        }

        text: translator.NAME_TITLE_FORM_STRING_ID//qsTr("Name")
        font.bold: true
        font.pixelSize: 14
    }
    TextField {
        id: name
        width: parent.width - 50
        height: 40
        anchors {
            left: parent.left
            leftMargin: 15
            top: nameTxt.bottom
            topMargin: 10
        }
        placeholderText: translator.NAME_PLACEHOLD_STRING_ID//qsTr("Enter name")

        background: Rectangle {
            implicitWidth: parent.width
            implicitHeight: parent.height
            radius: 3
            color: "transparent"
            border.color: "black"//textNameForm.enabled ? "#21be2b" : "transparent"
        }
    }
    Text {
        id: emailTxt
        anchors {
            left: parent.left
            leftMargin: 15
            top: name.bottom
            topMargin: 20
        }

        text: translator.EMAIL_TITLE_FORM_STRING_ID//qsTr("E-Mail*")
        font.bold: true
        font.pixelSize: 14
    }
    TextField {
        id: email
        width: parent.width - 50
        height: 40
        anchors {
            left: parent.left
            leftMargin: 15
            top: emailTxt.bottom
            topMargin: 10
        }
        placeholderText: translator.EMAIL_PLACEHOLD_STRING_ID//qsTr("Enter e-mail")

        background: Rectangle {
            implicitWidth: parent.width
            implicitHeight: parent.height
            radius: 3
            color: "transparent"
            border.color: "black"//textNameForm.enabled ? "#21be2b" : "transparent"
        }
    }
    Text {
        id: addressTxt
        anchors {
            left: parent.left
            leftMargin: 15
            top: email.bottom
            topMargin: 20
        }

        text: translator.ADDRESS_TITLE_FORM_STRING_ID//qsTr("Address")
        font.bold: true
        font.pixelSize: 14
    }
    TextField {
        id: address
        width: parent.width - 50
        height: 40
        anchors {
            left: parent.left
            leftMargin: 15
            top: addressTxt.bottom
            topMargin: 10
        }
        placeholderText: translator.ADDRESS_PLACEHOLD_STRING_ID//qsTr("Enter address")

        background: Rectangle {
            implicitWidth: parent.width
            implicitHeight: parent.height
            radius: 3
            color: "transparent"
            border.color: "black"//textNameForm.enabled ? "#21be2b" : "transparent"
        }
    }
    Rectangle {
        id: backHomeButton
        anchors {
            left: parent.left
            leftMargin: 15
            top: address.bottom
            topMargin: 30
        }
        width: 150; height: 50
        color: "#a9a9a9"
        radius: 10
        Text {
            anchors.centerIn: parent
            color: "white"
            font.bold: true
            text: translator.SUBMIT_STRING_ID//qsTr("Submit")
            font.pixelSize: 20
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                //creationForm.source = "creation.qml"
                //formSubmit.visible = false
                console.log("submited")
                stackView.pop("Form.qml")
                //stackView.push("Creation.qml")
            }
        }
    }
}
