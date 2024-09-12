import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import com.custom.filefinder 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Media File List")

    FileFinder { id: fileFinder }
//    property bool isImportedFolder: false
//    property int destinationText: 0
//    property int durationText: 0
    property bool isListViewAudio: false
    property bool isListViewVideo: false
    property string initialDirectory: "/home/manh/Code/qtQuick/QTA_Day04/Music-Video"
    Component.onCompleted: {
        fileFinder.findFiles(initialDirectory)
    }
    FontLoader {
        id: customFont
        source: "fonts/NotoSans-Regular.ttf"
    }
    Row {
        spacing: 0
        anchors {
            top: parent.top
            topMargin: 5
            //horizontalCenter: parent.horizontalCenter
        }
        anchors.fill: parent
        height: parent.height - buttonDir.height
        visible: !(fileFinder.audioModel.count === 0 && fileFinder.videoModel.count === 0)

        ListView {
            id: audioListView
            width: parent.width / 2
            height: parent.height - buttonDir.height
            model: fileFinder.audioModel
//            property string nameFiles: ""
//            property int indexTemp: 0
            //clip: true
            delegate: Rectangle {
                width: audioListView.width
                height: 30

                color: "transparent"
                border.color: "black"
                ScrollText {
                    id: txt1
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: parent.left
                        leftMargin: 5
                    }
                    text.font.family: customFont.name
                    width: parent.width - 5
                    text.text: fileName
                    text.color: (index === audioListView.currentIndex && isListViewVideo == false) ? "red" : "black"
                    isAllowScroll: index === audioListView.currentIndex && isListViewVideo == false
                    //isMERegion: true
                }
                MouseArea {
                    id: ma1
                    anchors.fill: parent
                    onClicked: {
                        console.log(audioListView.currentIndex)
                        audioListView.currentIndex = index
                        isListViewAudio = true
                        isListViewVideo = false
                    }
                }
//                RunningText {
//                    id: rTxt1
//                    text: fileName
//                    MouseArea {
//                        id: ma
//                        anchors.fill: parent
//                        onClicked: {
//                            console.log("Clicked")

//                            audioListView.currentItem.color = "black"
//                            animation.stop()
//                            audioListView.currentItem.x = 0

//                            audioListView.currentIndex = index

//                            audioListView.nameFiles= ""
//                            audioListView.nameFiles += fileName
//                            audioListView.indexTemp = index
//                            destinationText = audioListView.currentItem.des
//                            durationText = audioListView.currentItem.dur
//                        }
//                    }
//                }
//                Text {
//                    id: txt1
//                    text: fileName
//                }
            }
            //=====================================================================//
//            onNameFilesChanged:{
//               // if(isImportedFolder) {
//                    audioListView.currentItem.color = "red"
//                    animation.start()
//               // }
//            }

//            PropertyAnimation{id: animation; target:audioListView.currentItem
//                property: "x"; from: 0; to: destinationText
//                duration: durationText; loops: Animation.Infinite;}

//            Component.onCompleted: {
//                //if(isImportedFolder)
//                console.log(audioListView.currentItem)
//                    audioListView.currentItem.color = "red"
//            }
            //=====================================================================//
        }

        ListView {
            id: videoListView
            width: parent.width / 2
            height: parent.height - buttonDir.height
            model: fileFinder.videoModel

            delegate: Rectangle {
                width: videoListView.width
                height: 30

                color: "transparent"
                border.color: "black"
                ScrollText {
                    id: txt2
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: parent.left
                        leftMargin: 5
                    }
                    width: parent.width - 5
                    text.font.family: customFont.name
                    text.text: fileName
                    text.color: (index === videoListView.currentIndex && isListViewAudio == false) ? "red" : "black"
                    isAllowScroll: index === videoListView.currentIndex && isListViewVideo == false
                    isMERegion: true
                }
                MouseArea {
                    id: ma2
                    anchors.fill: parent
                    onClicked: {
                        console.log(videoListView.currentIndex)
                        videoListView.currentIndex = index
                        isListViewVideo = true
                        isListViewAudio = false
                    }
                }
            }
        }
    }

    Rectangle {
        id: buttonDir
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
        }
        width: 100; height: 40
        color: "lightgrey"
        Text { anchors.centerIn: parent; text: "Select Directory" }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                fileFinder.openDirDialog();
//                isImportedFolder = true;
//                console.log(isImportedFolder)
            }
        }
    }

    // Display message if directory is empty or doesn't exist
    Text {
        id: messageText
        color: "red"
        anchors.centerIn: parent
        visible: fileFinder.audioModel.count === 0 && fileFinder.videoModel.count === 0
        //console.log(ileFinder.audioModel.count, fileFinder.videoModel.count)
        font {
            pixelSize: 30
            bold: true
        }
        text: "Directory does not exist or is empty"
    }
}
