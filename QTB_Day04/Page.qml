import QtQuick 2.0

Rectangle {
    id: rootPage
    property string txt: ""
    property string colorText: ""
    property int txtHeight: idText.contentHeight
//    property int topMarginTxt: 18
//    property int leftMarginTxt: 30
    property bool visibleText: true
    property int xText: 30
    property int yText: 18
    property alias xTxt: idText.x
    property alias yTxt: idText.y
    signal clicked
    width: parent.width
    height: parent.height
    radius: 10
    color: "transparent"
    Text {
        id: idText
        text: txt
        color: colorText
        font.family: "Calibri"
        font.pointSize: 18
        font.bold: true
        visible: visibleText
        x:xText; y:yText
//        anchors.top: rootPage.top
//        anchors.topMargin: topMarginTxt
//        anchors.left: rootPage.left
//        anchors.leftMargin: leftMarginTxt
    }
    MouseArea {
        anchors.fill: parent
        onClicked: rootPage.clicked()
    }
}
