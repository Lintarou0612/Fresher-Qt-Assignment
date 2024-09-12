import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: translator.WINDOW_TITLE_STRING_ID//qsTr("Creation Form")
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: Creation {
            onCreateButtonClicked: {
                stackView.clear()
                stackView.push("Form.qml")
            }
        }
    }

//    Loader {
//        id: creationForm
//        anchors.fill: parent
//        source: "creation.qml"
//    }
//    Connections {
//        target: creationForm.item
//        onCreateButtonClicked: {
//            creationForm.source = "form.qml"
//        }
//    }
//    Connections {
//        target: translator
//        onLanguageChanged: {
//            retranslateUI()
//        }
//    }

//    Component.onCompleted: {
//        translator.setTranslation(selectLang.currentText)
//    }
}
