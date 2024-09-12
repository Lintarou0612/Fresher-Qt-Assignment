import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 380
    height: 600
    title: qsTr("Calculator")
    color: "#F3F3F3"
    property bool isDigitClicked: false
    Text {
        id: display
        font.pixelSize: 45
        text: isDigitClicked ? calculator.display : "0"
        anchors.bottom: gridView.top
        anchors.bottomMargin: 25
        anchors.right: parent.right
        anchors.rightMargin: 5
        states: State {
            name: "fontSizeChanged"
            when: (calculator.display == "Can not divide by Zero")
            PropertyChanges {
                target: display
                font.pixelSize: 30
            }
        }
    }
    Text {
        id: displayExpression
        font.pixelSize: 20
        text: calculator.displayTemp
        anchors.bottom: display.top
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 5
    }
    GridView {
        id: gridView
        anchors {
            left: parent.left
            leftMargin: 5
            bottom: parent.bottom
            bottomMargin: 5
        }
        width: parent.width - 5
        height: parent.height * 0.7
        cellWidth: gridView.width / 4
        cellHeight: gridView.height / 6
        interactive: false
        model: [ "%", "CE", "C", "<X>",
                 "1/x", "x^2", "sqrt(x)", "/",
                 "7", "8", "9", "*",
                 "4", "5", "6", "-",
                 "1", "2", "3", "+",
                 "+/-", "0", ".", "=" ]
        delegate: listDelegate
    }
    Component {
        id: listDelegate
        Button {
            text: modelData
            color: index == 23 ? "#3D989F" : "#FFFFFF"
            widthB: gridView.width / 4 - 5
            heightB: gridView.height / 6 - 5

            onClicked:
            {
                console.log("clicked button", modelData)
                if(modelData == "C" || modelData == "CE" || modelData == "<X>")
                    calculator.clear();
                else if (["/", "*", "-", "+"].indexOf(modelData) !== -1) {
                    calculator.addOperator(modelData)
                } else if (modelData == ".") {
                    calculator.addDecimal()
                } else if(modelData == "=") {
                    calculator.calculate()
                } else if(["1/x", "x^2", "sqrt(x)"].indexOf(modelData) !== -1) {
                    calculator.addSpecialOperator(modelData)
                    calculator.calculate()
                } else {
                    isDigitClicked = true
                    calculator.addDigit(modelData)
                }
                colorClickChanged.start()
            }
        }
    }
    ColorAnimation { id: colorClickChanged; target: listDelegate; to: "#F3F3F3"}
}
