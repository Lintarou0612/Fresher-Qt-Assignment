#ifndef FILEMODEL_H
#define FILEMODEL_H

#include <QAbstractListModel>
#include <QStringList>

class FileModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(int count READ count NOTIFY countChanged)
public:
    enum FileRoles {
        FileNameRole = Qt::UserRole + 1
    };
    explicit FileModel(QObject *parent = nullptr);
    void addFiles(const QStringList &files);
    void clear();
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;
    int count() const;
signals:
    void countChanged();
private:
    QStringList m_files;
};

#endif // FILEMODEL_H
