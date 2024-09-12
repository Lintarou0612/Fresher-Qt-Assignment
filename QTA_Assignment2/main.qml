import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 480
    height: 720
    title: qsTr("IPHONE")
    Loader {
        id: appLoader
        anchors.fill: parent
        source: "Home.qml"
        Connections {
            target: appLoader.item
            onAppClicked: {
                //appLoader.source = "App" + appIndex + ".qml"
                appLoader.source = "App.qml"
            }
        }
    }
}
