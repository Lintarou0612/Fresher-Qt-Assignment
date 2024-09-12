import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
Window {
    visible: true
    width: 1280
    height: 720
    title: qsTr("Assignment 2")

    Header {
        id: senderH
        anchors.left: parent.left
        txt: "Sender"
    }
    Header {
        id: receiverH
        anchors.left: senderH.right
        txt: "Receiver"
    }
    Rectangle {
        id: sendButton
        anchors.right: senderH.right
        anchors.rightMargin: 3
        anchors.top: senderH.bottom
        width: senderH.width / 4
        height: 100
        color: "orange"
        border.color: "brown"
        border.width: 1
        radius: 10
        Text {
            id: txtBtn
            anchors.centerIn: parent
            font.bold: true
            color: "white"
            font.pixelSize: 20
            text: qsTr("Send Button")
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("button clicked")
                if(messageField.text != "")
                    sender.emitMessage(messageField.text)
                else
                    console.log("enter message and then click button")
                messageField.text = ""
            }
        }
    }
//    Rectangle {
//        id: textInput

//        width: sender.width - sendButton.width - 5
//        height: 100
//        border.width: 2
//        TextInput {
//            id: txtInput
//            anchors.centerIn: parent
//            font.bold: true
//            font.pixelSize: 20
//            text: qsTr("Send Button")
//            cursorVisible: false
//        }
    TextField {
        id: messageField
        anchors.left: senderH.left
        anchors.top: senderH.bottom
        width: senderH.width - sendButton.width - 5
        height: 100
        font.pixelSize: 20
        placeholderText: "Enter message"
    }

    // Receiver
    ListView {
        anchors.left: receiverH.left
        anchors.top: receiverH.bottom
        width: receiverH.width
        height: parent.height - receiverH.height
        boundsBehavior: Flickable.StopAtBounds // khi keo se ko co hieu ung bouncing
        model: receiver.messages
        clip: true
        delegate: Rectangle {
            width: receiverH.width
            height: 100
            border.color: "black"
            border.width: 2
            Text {
                anchors.centerIn: parent
                text: modelData
                width: 600
                font.pixelSize: 20
                elide: Text.ElideRight
                wrapMode: Text.Wrap
                maximumLineCount: 2
            }
        }
    }
}
