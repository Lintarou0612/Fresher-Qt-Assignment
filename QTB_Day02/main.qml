import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    property variant colorArray: ["green", "red"]
    ListModel {
        id: modelList
        ListElement {name: "Nguyen Tien Manh"}
        ListElement {name: "Nguyen Trung Kien"}
        ListElement {name: "Nguyen Van A"}
        ListElement {name: "Pham Anh Quan"}
        ListElement {name: "Le Viet Long"}
        ListElement {name: "Le Viet Dung"}
        ListElement {name: "Tran Quoc Hieu"}
        ListElement {name: "Nguyen Duy Hieu"}
        ListElement {name: "Nguyen Duc Viet"}
        ListElement {name: "Nguyen Dac Nogn"}
        ListElement {name: "Tran Anh Loi"}
        ListElement {name: "Le Van Loi"}
        ListElement {name: "Hoang Van A"}
        ListElement {name: "Hoang Manh Ha"}
        ListElement {name: "Nguyen Thi My"}
        ListElement {name: "Doan Quoc Dam"}
        ListElement {name: "Nguyen Khanh Minh"}
        ListElement {name: "Tran Anh Hung"}
        ListElement {name: "Trna viet long"}
        ListElement {name: "Nguyen duc manh"}
    }
//    Flickable {
//        width: parent.width
//        height: parent.height
    ListView {
        model: modelList
        spacing: 5
        anchors.fill: parent
        Rectangle {
            anchors.fill: parent
            color: "red";
            opacity: 0.3
        }

        //anchors.centerIn: parent
        //flickableDirection: Flickable.AutoFlickDirection
        delegate: Rectangle {
            width: 200
            height: 40
            x: parent.width / 2 - width / 2
            border.width: 2
            color: {
                if(index % 2 == 0)
                    colorArray[0]
                else
                    colorArray[1]
            }
            radius: 8
            border.color: Qt.lighter(color)
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#f0f0f0"
                text: (index + 1) + ". " + name
            }
        }
    }
}
