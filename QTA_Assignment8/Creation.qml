import QtQuick 2.12
import QtQuick.Controls 2.12
import "retranslateUI.js" as Trans
Item {
    id: creationScreen
    signal createButtonClicked()
    property string  getCurrentText: selectLang.currentText
    property string  getLanguages: ""
    Rectangle {
        id: header
        width: parent.width
        height: parent.height * 0.15
        anchors.left: parent.left
        anchors.top: parent.top
        Text {
            id: headerName
            anchors {
                left: parent.left
                leftMargin: 15
                verticalCenter: parent.verticalCenter
            }
            color: "white"
            font {
                bold: true
                pixelSize: 20
            }

            text: translator.CREATION_TITLE_STRING_ID//qsTr("Create Translation")
        }
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop {position: 0.0; color: "#1fa5bb"}
            GradientStop {position: 0.45; color: "#1daeb2"}
            GradientStop {position: 1.0; color: "#1abca6"}
        }
    }
    Text {
        id: quest
        text: translator.QUEST_STRING_ID//qsTr("What language would you like to set?")
        anchors {
            left: parent.left
            leftMargin: 15
            top: header.bottom
            topMargin: 50
        }
        font.pixelSize: 14
    }
    ComboBox {
        id: selectLang
        width: parent.width - 50
        height: 40
        anchors {
            left: parent.left
            leftMargin: 15
            top: quest.bottom
            topMargin: 10
        }
        model: ["English", "Korea", "Vietnam"]

        //customizing combobox
//        delegate: ItemDelegate {
//            width: selectLang.width
//            contentItem: Text {
//                text: modelData
//                //font: selectLang.font
//                elide: Text.ElideRight
//                verticalAlignment: Text.AlignVCenter
//            }
//            highlighted: selectLang.highlightedIndex === index
//        }

        indicator: Canvas {
            id: canvas
            x: selectLang.width - width - selectLang.rightPadding
            y: selectLang.topPadding + (selectLang.availableHeight - height) / 2
            width: 12
            height: 8
            contextType: "2d"

            Connections {
                target: selectLang
                function onPressedChanged() { canvas.requestPaint(); }
            }

            onPaint: {
                context.reset();
                context.moveTo(0, 0);
                context.lineTo(width, 0);
                context.lineTo(width / 2, height);
                context.closePath();
                context.fillStyle = selectLang.pressed ? "#17a81a" : "#1eacb6";
                context.fill();
            }
        }

        contentItem: Text {
            leftPadding: 15
            rightPadding: selectLang.indicator.width + selectLang.spacing

            text: selectLang.displayText
            font: selectLang.font
            color: "black"
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle {
            implicitWidth: 120
            implicitHeight: 40
            border.color: "black"
            border.width: selectLang.visualFocus ? 2 : 1
            radius: 2
        }

//        popup: Popup {
//            y: selectLang.height - 1
//            width: selectLang.width
//            implicitHeight: contentItem.implicitHeight
//            padding: 1

//            contentItem: ListView {
//                clip: true
//                implicitHeight: contentHeight
//                model: selectLang.popup.visible ? selectLang.delegateModel : null
//                currentIndex: selectLang.highlightedIndex
//                boundsBehavior: Flickable.StopAtBounds
//                ScrollIndicator.vertical: ScrollIndicator { }
//            }

//            background: Rectangle {
//                border.color: "#dae2eb"
//                radius: 3
//            }
//        }
        onCurrentTextChanged: {
            if(selectLang.currentText === "English")
                translator.setTranslation("en")
            if(selectLang.currentText === "Korea")
                translator.setTranslation("kor")
            if(selectLang.currentText === "Vietnam")
                translator.setTranslation("vi")
//            Trans.retranslateUi(selectLang.currentText)
        }
    }
//    function setTrans(getCurrentText) {
//        if(selectLang.currentText === "English"){
//            getLanguages = "en"
//        }
//        if(selectLang.currentText === "Korea")
//            getLanguages = "kor"
//        if(selectLang.currentText === "Vietnam")
//            getLanguages = "vi"

//    }

    Text {
        id: nameForm
        text: translator.NAMEFORM_STRING_ID//qsTr("Name of form")
        anchors {
            left: parent.left
            leftMargin: 15
            top: selectLang.bottom
            topMargin: 30
        }
        font.pixelSize: 14
    }
    TextField {
        id: textNameForm
        width: parent.width - 50
        height: 40
        anchors {
            left: parent.left
            leftMargin: 15
            top: nameForm.bottom
            topMargin: 10
        }
        placeholderText: translator.NAMEFORM_PLACEHOLD_STRING_ID//qsTr("Enter Name of form")

        background: Rectangle {
            implicitWidth: parent.width
            implicitHeight: parent.height
            radius: 3
            color: textNameForm.enabled ? "transparent" : "#353637"
            border.color: "black"//textNameForm.enabled ? "#21be2b" : "transparent"
        }
    }
    Rectangle {
        id: createButton
        anchors {
            left: parent.left
            leftMargin: 15
            top: textNameForm.bottom
            topMargin: 20
        }
        width: 120
        height: 50
        color: "#fc7a5a"
        radius: 10
        Text {
            anchors.centerIn: parent
            color: "white"
            font {
                bold: true
                pixelSize: 20
            }

            text: translator.CREATE_BUTTON_STRING_ID//qsTr("Create")
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("create button")
                createButtonClicked()
            }
        }
    }
}
