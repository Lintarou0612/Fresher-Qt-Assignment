#ifndef PROFILEMANAGER_H
#define PROFILEMANAGER_H

#include <QObject>
#include <QDBusConnection>
#include <QDebug>
#include <QMap>
#include <QSharedMemory>

struct Users {
    int m_id;
    QString m_name;
    QString m_avatar;
    QString m_path;
};

class profilemanager : public QObject
{
    Q_OBJECT
    Q_CLASSINFO("D-Bus Interface", "assignment09.com.vn")
    Q_PROPERTY(int id READ id WRITE setActiveUser NOTIFY userActived)
public:
    profilemanager(QObject *parent = nullptr);
    ~profilemanager();
    Q_INVOKABLE QString getname(int id);
    Q_INVOKABLE QString getPath(int id);
public slots:
    void setActiveUser(int id);
    int id() const;
signals:
    void userActived();
private:
    QMap<int, Users> m_users;
    int m_id;
    QSharedMemory m_sharedMemory;
};
#endif // PROFILEMANAGER_H
