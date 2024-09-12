import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 720
    height: 480
    title: qsTr("Hello World")
//    property bool isSelected: false
    property string pAccount: ""
    property int pAge: 0
    property string pFullName: ""
    property string pAddress: ""
    Header {
        id: listMember
        anchors.top: parent.top
        anchors.left: parent.left
        txt: "List Member"
    }
    Header {
        id: detailInfo
        anchors.top: parent.top
        anchors.left: listMember.right
        txt: "Detail Info"
    }
    ListView {
        id: listview
        anchors.top: listMember.bottom
        width: parent.width / 2; height: 400
        model: userData
        currentIndex: -1
        delegate: Rectangle {
            width: parent.width; height: 65
            color: "orange"
            border.width: 1
            border.color: "brown"
            Text {
                id: txt1
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width - txt2.contentWidth - 40
                elide: Text.ElideRight
                text: qsTr("Account: " + accountName)
                font.pixelSize: 15
                font.bold: true
                color: listview.currentIndex === index ? "red" : "white"
            }
            Text {
                id: txt2
                anchors.left: txt1.right
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                elide: Text.ElideRight
                text: qsTr("Year old: " + yearOld)
                font.pixelSize: 15
                font.bold: true
                color: listview.currentIndex === index ? "red" : "white"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Item selected");
                    listview.currentIndex = index;
                    pAccount = accountName;
                    pAge = yearOld;
                    pFullName = fullName;
                    pAddress = address;
//                    if(listview.currentIndex == index){
//                        console.log("current item")
//                        isSelected = true;
//                    }
                }
            }
        }
        onCurrentIndexChanged: {
            console.log("Current index changed to:", currentIndex)
        }
//        Rectangle {
//            width: parent.parent.width / 2; height: 400
//            color: "red"
//            opacity: 0.5
//        }
    }
    Rectangle {
        id: account
        anchors.top: detailInfo.bottom
        anchors.left: listview.right
        width: parent.width / 2; height: 100
        color: "orange"
        border.width: 1
        border.color: "brown"
        Text {
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width - 40
            elide: Text.ElideRight
            wrapMode: Text.WordWrap
            text: qsTr("Account: " + pAccount)
            font.pixelSize: 15
            maximumLineCount: 2
            font.bold: true
            color: "white"
        }
    }
    Rectangle {
        id: age
        anchors.top: account.bottom
        anchors.left: listview.right
        width: parent.width / 2; height: 100
        color: "orange"
        border.width: 1
        border.color: "brown"
        Text {
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            elide: Text.ElideRight
            text: pAge == 0 ? qsTr("Year old: ") : qsTr("Year old: " + pAge)
            font.pixelSize: 15
            font.bold: true
            color: "white"
        }
    }
    Rectangle {
        id: fullname
        anchors.top: age.bottom
        anchors.left: listview.right
        width: parent.width / 2; height: 100
        color: "orange"
        border.width: 1
        border.color: "brown"
        Text {
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width - 40
            elide: Text.ElideRight
            text: qsTr("Full name: " + pFullName)
            wrapMode: Text.WordWrap
            maximumLineCount: 2
            font.pixelSize: 15
            font.bold: true
            color: "white"
        }
    }
    Rectangle {
        id: address
        anchors.top: fullname.bottom
        anchors.left: listview.right
        width: parent.width / 2; height: 100
        color: "orange"
        border.width: 1
        border.color: "brown"
        Text {
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width - 40
            elide: Text.ElideRight
            wrapMode: Text.WordWrap
            maximumLineCount: 2
            text: qsTr("Address: " + pAddress)
            font.pixelSize: 15
            font.bold: true
            color: "white"
        }
    }
}
