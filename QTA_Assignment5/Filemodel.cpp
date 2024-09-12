#include "Filemodel.h"
#include <QDebug>
FileModel::FileModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

void FileModel::addFiles(const QStringList &files)
{
    beginResetModel();
    m_files = files;
    qDebug() << __FUNCTION__ << __LINE__ << m_files;
    endResetModel();
    emit countChanged();
}

void FileModel::clear()
{
    beginResetModel();
    m_files.clear();
    endResetModel();
    emit countChanged();
}

int FileModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_files.count();
}

QVariant FileModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() >= m_files.size())
        return QVariant();

    if (role == FileNameRole)
        return m_files.at(index.row());

    return QVariant();
}

QHash<int, QByteArray> FileModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[FileNameRole] = "fileName";
    return roles;
}

int FileModel::count() const
{
    return m_files.count();
}
