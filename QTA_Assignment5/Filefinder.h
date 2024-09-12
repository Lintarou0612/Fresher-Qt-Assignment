#ifndef FILEFINDER_H
#define FILEFINDER_H

#include <QObject>
#include "Filemodel.h"

class FileFinder : public QObject
{
    Q_OBJECT
    Q_PROPERTY(FileModel* audioModel READ audioModel CONSTANT)
    Q_PROPERTY(FileModel* videoModel READ videoModel CONSTANT)
public:
    explicit FileFinder(QObject *parent = nullptr);

    FileModel* audioModel() const;
    FileModel* videoModel() const;

public slots:
    void findFiles(const QString &directory);
    void openDirDialog();
signals:
    void directoryStatusChanged();
private:
    FileModel *m_audioModel;
    FileModel *m_videoModel;
};

#endif // FILEFINDER_H
