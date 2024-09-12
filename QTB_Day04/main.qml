import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: window
    visible: true
    width: 720
    height: 1000
    color: "#DDDDDD"
    title: qsTr("Cards Menu")
    property string rootText: ""
    //Text {
//        Text {
//            id: contactText
//            x: 18 + 60 + 30
//            y: 18 + 60 + 18
//            z: 5
//            text: "CONTACT"
//            color: "#A7425C"
//            font.family: "Calibri"
//            font.pointSize: 18
//            font.bold: true
//        }
//    //}
//        Text {
//            id: phoneText
//            x: contactText.x + 30
//            y: contactText.x + 18
//            z: 5
//            text: "PHONE"
//            color: "#A7425C"
//            font.family: "Calibri"
//            font.pointSize: 18
//            font.bold: true
//        }
    Page {
        id: rootPage
        anchors.top: rootButton.bottom
        anchors.left: rootButton.right
        Page {
            id: contact
            //z: 1
            color: "#563761"
            anchors.top: rootPage.top
            anchors.left: rootPage.left
            colorText: "#A7425C"
            txt: "CONTACT"
            onClicked: {
                console.log("contact clicked") 
                rootPage.state = "allPageExtend"
                contact.visible = true
                phone.visible = false
                music.visible = false
                message.visible = false
                rootButton.isCloseButton = false
                // change button color
                rect1.color = "#A7425C"
                rect2.color = "#A7425C"
                rect3.color = "#A7425C"
                //visibleText = false
            }
        }
        Page {
            id: phone
            color: "#A7425C"
            anchors.top: contact.top
            anchors.topMargin: contact.txtHeight + 18
            anchors.left: contact.left
            anchors.leftMargin: 30
            colorText: "#FFE26F"
            txt: "PHONE"
            onClicked: {
                console.log("phone clicked")
                rootPage.state = "allPageExtend"
                message.visible = false
                music.visible = false
                contact.visible = false
                phone.visible = true
                rootButton.isCloseButton = false
                // change button color
                rect1.color = "#FFE26F"
                rect2.color = "#FFE26F"
                rect3.color = "#FFE26F"
                //visibleText = false
            }
        }
        Page {
            id: music
            color: "#F3825F"
            anchors.top: phone.top
            anchors.topMargin: phone.txtHeight + 18
            anchors.left: phone.left
            anchors.leftMargin: 30
            colorText: "#563761"
            txt: "MUSIC"
            onClicked: {
                console.log("music clicked")
                rootPage.state = "allPageExtend"
                phone.visible = false
                message.visible = false
                contact.visible = false
                music.visible = true
                rootButton.isCloseButton = false
                // change button color
                rect1.color = "#563761"
                rect2.color = "#563761"
                rect3.color = "#563761"
            }
        }
        Page {
            id: message
            color: "#FFE26F"
            anchors.top: music.top
            anchors.topMargin: music.txtHeight + 18
            anchors.left: music.left
            anchors.leftMargin: 30
            colorText: "#A7425C"
            txt: "MESSAGE"

            onClicked: {
                console.log("message clicked")
                rootPage.state = "allPageExtend"
                phone.visible = false
                music.visible = false
                contact.visible = false
                message.visible = true
                rootButton.isCloseButton = false
                // change button color
                rect1.color = "#A7425C"
                rect2.color = "#A7425C"
                rect3.color = "#A7425C"
            }
        }
        states: [
            State {
                name: "allPageExtend"
                AnchorChanges { target: rootPage; anchors.top: parent.top; anchors.left: parent.left }
                AnchorChanges { target: contact; anchors.top: parent.top; anchors.left: parent.left }
                PropertyChanges {
                    target: contact; radius: 0; anchors.topMargin: 0; anchors.leftMargin: 0
                    xText: 18 + 75; yText: 30
                }
//                PropertyChanges {
//                    target: contactText
//                    x: 18 + 75; y: 30
//                }
                AnchorChanges { target: phone; anchors.top: parent.top; anchors.left: parent.left }
                PropertyChanges {
                    target: phone; radius: 0; anchors.topMargin: 0; anchors.leftMargin: 0
                    xText: 18 + 75; yText: 30
                }
//                PropertyChanges {
//                    target: phoneText
//                    x: 18 + 75; y: 30
//                }
                AnchorChanges { target: music; anchors.top: parent.top; anchors.left: parent.left }
                PropertyChanges {
                    target: music; radius: 0; anchors.topMargin: 0; anchors.leftMargin: 0
                    xText: 18 + 75; yText: 30
                }
                AnchorChanges { target: message; anchors.top: parent.top; anchors.left: parent.left }
                PropertyChanges {
                    target: message; radius: 0; anchors.topMargin: 0; anchors.leftMargin: 0
                    xText: 18 + 75; yText: 30
                }
            },
            State {
                name: "allPageShrink"
                AnchorChanges { target: rootPage; anchors.top: rootButton.bottom; anchors.left: rootButton.right }
                PropertyChanges {
                    target: contact; radius: 10; anchors.topMargin: 0; anchors.leftMargin: 0
                    visible: true
                }
//                PropertyChanges {target: contactText; visible: false}
//                PropertyChanges {
//                    target: contactText
//                    x: 18 + 60 + 30; y: 18 + 60 + 18
//                }
                PropertyChanges {
                    target: phone; radius: 10; anchors.topMargin: 18 + txtHeight; anchors.leftMargin: 30
                    visible: true
                    //xText: 30; yText: 18
                }
//                PropertyChanges {target: phoneText; visible: false}
                PropertyChanges {
                    target: music; radius: 10; anchors.topMargin: 18 + txtHeight; anchors.leftMargin: 30
                    visible: true
                    xText: 30; yText: 18
                }
                PropertyChanges {
                    target: message; radius: 10; anchors.topMargin: 18 + txtHeight; anchors.leftMargin: 30
                    visible: true
                    xText: 30; yText: 18
                }
                PropertyChanges{
                    target: rect1
                    color: "#516C8D"
                }
                PropertyChanges{
                    target: rect2
                    color: "#516C8D"
                }
            }
        ]

        transitions: [
            Transition {
                ParallelAnimation {
                    PropertyAction {target: contact; property: "xText"; value: 18 + 75}
                    PropertyAction {target: contact; property: "yText"; value: 30}
                    PropertyAnimation {properties: "x,y"; duration: 300}
                    PropertyAction {target: contact; property: "xText"; value: 30}
                    PropertyAction {target: contact; property: "yText"; value: 18}
                    AnchorAnimation { duration: 300 } }
            }

        ]
    }
    Button {
        id: rootButton
        //color: "red"
        z: 5
        property bool isCloseButton: true
        //z: window.z
        Rectangle {
            id:rect1
            x: 9
            z: 0
            width: 74
            height: (parent.height /3)*0.7
            radius: 20
            color: "#516C8D"
            transformOrigin: Rectangle.TopLeft
            rotation: 0
        }
        Rectangle {
            id: rect2
            width: 74
            height: (parent.height /3)*0.7
            radius: 20
            x: 9
            y: 60 - rect2.height + 1
            color: "#516C8D"
            transformOrigin: Rectangle.BottomLeft
            rotation: 0
        }
        Rectangle {
            id: rect3
            width: 60
            height: (parent.height /3)*0.7
            radius: 20
            visible: false
            anchors.centerIn: parent
            color: "#516C8D"
        }
        states: [
            State {
                name: "CloseButton"
                when: rootButton.isCloseButton
                PropertyChanges {
                    target: rect1
                    x: 9
                    width: 74
                    rotation: 45
                }
                PropertyChanges {
                    target: rect2
                    x: 9
                    y: 60 - rect2.height + 1
                    width: 74
                    rotation: 315
                }
                PropertyChanges {
                    target: rect3
                    visible: false
                }
            },
            State {
                name: "MenuButton"
                when: !rootButton.isCloseButton
                PropertyChanges {
                    target: rect1
                    rotation: 0
                    x: 0; y: 0
                    width: 60
                }
                PropertyChanges {
                    target: rect2
                    x: 0; y: 60 - rect2.height
                    rotation: 0
                    width: 60
                }
                PropertyChanges {
                    target: rect3
                    visible: true
                }
            }
        ]
        transitions: [
            Transition {
                id: trans1
                from: "CloseButton"; to: "MenuButton"
                NumberAnimation {properties: "x,y"}
                RotationAnimation {target: rect1; direction: RotationAnimation.Counterclockwise/*; duration: 500*/ }
                RotationAnimation {target: rect2; direction: RotationAnimation.Clockwise/*; duration: 500 */}
            },
            Transition {
                id: trans2
                //from: "MenuButton"; to: "CloseButton"
                //SequentialAnimation {

                ColorAnimation {target: rect1; from: "#516C8D"; to: "red"}
                RotationAnimation {target: rect2; direction: RotationAnimation.Counterclockwise }
                RotationAnimation {target: rect1; direction: RotationAnimation.Clockwise }
                NumberAnimation {properties: "x,y,width"}
                //}
            }
        ]
        state: "CloseButton"
        onClicked: {
            console.log("clicked")
            //rootPage.state = ""
            if(!rootButton.isCloseButton) {
                rootPage.state = "allPageShrink"
            }
            rootButton.isCloseButton = !rootButton.isCloseButton
        }
    }
}
