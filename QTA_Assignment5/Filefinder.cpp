#include "Filefinder.h"
#include <QDir>
#include <QFileDialog>
#include <QDebug>

FileFinder::FileFinder(QObject *parent)
    : QObject(parent),
    m_audioModel(new FileModel(this)),
    m_videoModel(new FileModel(this))
{

}

FileModel *FileFinder::audioModel() const
{
    return m_audioModel;
}

FileModel *FileFinder::videoModel() const
{
    return m_videoModel;
}

void FileFinder::findFiles(const QString &directory)
{
    QDir dir(directory);
    qDebug() << dir;
    if(!dir.exists()) {
        qDebug() << "Directory does not exist!";
        m_audioModel->clear();
        m_videoModel->clear();
        emit directoryStatusChanged();
        return;
    }

    QStringList audioFilter;
    audioFilter << "*.mp3" << "*.MP3" << "*.flac" << "*.FLAC";
    QStringList videoFilter;
    videoFilter << "*.mp4" << "*.MP4" << "*.mkv" << "*.MKV" << "*.avi" << "*.AVI";

    QStringList audioFiles = dir.entryList(audioFilter, QDir::Files);
    QStringList videoFiles = dir.entryList(videoFilter, QDir::Files);

    if(audioFiles.isEmpty() && videoFiles.isEmpty()) {
        qDebug() << "Directory is empty or contains no matching files";
        m_audioModel->clear();
        m_videoModel->clear();
        return;
    }

    m_audioModel->clear(); // clear list cu de them list moi
    m_audioModel->addFiles(audioFiles);
    m_videoModel->clear();
    m_videoModel->addFiles(videoFiles);
    emit directoryStatusChanged();
}

void FileFinder::openDirDialog()
{
    QString dir = QFileDialog::getExistingDirectory(nullptr, "Select Directory", "/home", QFileDialog::ShowDirsOnly | QFileDialog::DontResolveSymlinks);
    if (!dir.isEmpty()) {
        findFiles(dir);
    }
}
