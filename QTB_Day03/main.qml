import QtQuick 2.12
import QtQuick.Window 2.12
import "createComponent.js" as LoadScript
import "timerHelper.js" as FormatTime
import "dateTimeHelper.js" as GetDateTime
Window {
    visible: true
    width: 640
    height: 480
    color: "gray"
    title: qsTr("Clock")
    property int elapsedSeconds: 0
    property bool isRunning: false
    property bool isDigitalClicked: false
    property bool isTimerClicked: false
    property bool isTimerStarted: false
    Timer {
        id: timer
        interval: 1000 // 1 second
        repeat: true
        running: false
        onTriggered: {
            if(isTimerClicked) {
                elapsedSeconds += 1;
                displayInfo.text = FormatTime.formatTime(elapsedSeconds);
            }
            else if(isDigitalClicked) {
                displayInfo.text = GetDateTime.getCurrentDateTime();
            }
        }
    }
    Text {
        id: displayInfo
        text: qsTr("Please Choose Clock Type")
        color: "white"
        font.bold: true
        font.pixelSize: 20
        anchors.top: parent.top
        anchors.topMargin: 150
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Button {
        id: digitalClock
        name: "Digital Clock"
        Component.onCompleted: LoadScript.createSpriteObject()
        onClicked: {
            console.log("Digital clicked")

            // if clicking into digitalClock, it will display the time of clock
            isDigitalClicked = true
            isTimerClicked = false

            // set timer running
            timer.running = true;

            // hide button of timer clock
            startButton.visible = false
            pauseResumeButton.visible = false
        }
    }
    Button {
        id: timerClock
        name: "Timer Clock"
        anchors.left: digitalClock.right
        Component.onCompleted: LoadScript.createSpriteObject()

        onClicked: {
            console.log("Timer clicked")

            // khong hien thong tin cua digital clock
            isDigitalClicked = false

            // hien thi nut bam va gia tri thoi gian ban dau cua timer clock
            startButton.visible = true
            pauseResumeButton.visible = true
            displayInfo.text = "00:00:00"
            pauseResumeButton.name = "Pause";
        }
    }
    Button {
        id: startButton
        name: "Start"
        width: 100
        height: 40
        visible: false
        anchors.top: displayInfo.bottom
        anchors.topMargin: 100
        anchors.horizontalCenter: displayInfo.horizontalCenter
        anchors.horizontalCenterOffset: -150
        onClicked: {
            console.log("Timer starts")

            // cai dat bo dem gio khi an start
            isTimerClicked = true
            isTimerStarted = true
            //if(!isRunning) {
                elapsedSeconds = 0;
                displayInfo.text = FormatTime.formatTime(elapsedSeconds);
                // bat dau dem gio
                timer.running = true;
                isRunning = true;
                pauseResumeButton.name = "Pause";
//            } else {
//                timer.running = false;
//                elapsedSeconds = 0;
//                displayInfo.text = "00:00:00";
//                //pauseResumeButton.name = "Pause";
//                isRunning = false;
//            }
        }
    }
    Button {
        id: pauseResumeButton
        name: "Pause"
        width: 100
        height: 40
        visible: false
        anchors.top: displayInfo.bottom
        anchors.topMargin: 100
        anchors.horizontalCenter: displayInfo.horizontalCenter
        anchors.horizontalCenterOffset: 150
        onClicked: {
            console.log("Timer pause/resume")
            if (isRunning) {
                timer.running = false;
                isRunning = false;
                name = "Resume";
            } else {
                timer.running = true;
                isRunning = true;
                name = "Pause";
            }
        }
    }
}
