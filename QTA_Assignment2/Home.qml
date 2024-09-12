import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Item {
    width: parent.width
    height: parent.height
    signal appClicked(int appIndex)
    SwipeView {
        id: view
        anchors.fill: parent
        currentIndex: 1
        Page {
            id: page1
            GridLayout {
                id: grid1
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                columns: 4
                columnSpacing: 15
                rowSpacing: 15
                property variant colorArray: ["#00bde3", "#67c111", "#ea7025", "#7fff00", "#006400", "#00ced1", "#1e90ff", "#191970", "#ff4500"]
                Repeater {
                    model: 18
                    Rectangle {
                        property int colorIndex: Math.floor(Math.random()*9)
                        //Layout.fillWidth: true
                        Layout.preferredWidth: 100
                        Layout.preferredHeight: 100
                        radius: 10
                        border.color: "blue"
                        border.width: 2
                        opacity: 0.8
                        color: grid1.colorArray[colorIndex]
                        Text { anchors.centerIn: parent; text: "App " + (index + 1); color: "white"; font.pixelSize: 15; font.bold: true }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: appClicked(index + 1)
                        }
                    }
                }
            }
        }
        Page {
            id: page2
            GridLayout {
                id: grid2
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                columns: 4
                columnSpacing: 15
                rowSpacing: 15
                property variant colorArray: ["#00bde3", "#67c111", "#ea7025", "#7fff00", "#006400", "#00ced1", "#1e90ff", "#191970", "#ff4500"]
                Repeater {
                    model: 20
                    Rectangle {
                        property int colorIndex: Math.floor(Math.random()*9)
                        //Layout.fillWidth: true
                        Layout.preferredWidth: 100
                        Layout.preferredHeight: 100
                        radius: 10
                        border.color: "blue"
                        border.width: 2
                        opacity: 0.8
                        color: grid2.colorArray[colorIndex]
                        Text { anchors.centerIn: parent; text: "App " + (index + 17); color: "white"; font.pixelSize: 15; font.bold: true }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: appClicked(index + 17)
                        }
                    }
                }
            }
        }
        Page {
            id: page3
            GridLayout {
                id: grid3
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                columns: 4
                columnSpacing: 15
                rowSpacing: 15
                property variant colorArray: ["#00bde3", "#67c111", "#ea7025", "#7fff00", "#006400", "#00ced1", "#1e90ff", "#191970", "#ff4500"]
                Repeater {
                    model: 20
                    Rectangle {
                        property int colorIndex: Math.floor(Math.random()*9)
                        //Layout.fillWidth: true
                        Layout.preferredWidth: 100
                        Layout.preferredHeight: 100
                        radius: 10
                        border.color: "blue"
                        border.width: 2
                        opacity: 0.8
                        color: grid3.colorArray[colorIndex]
                        Text { anchors.centerIn: parent; text: "App " + (index + 37); color: "white"; font.pixelSize: 15; font.bold: true }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: appClicked(index + 37)
                        }
                    }
                }
            }
        }
    }
    PageIndicator {
        id: indicator
        count: view.count
        currentIndex: view.currentIndex
        anchors.bottom: view.bottom
        anchors.horizontalCenter: view.horizontalCenter
        anchors.bottomMargin: 10
    }
}


