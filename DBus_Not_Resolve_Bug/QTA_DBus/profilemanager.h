#ifndef PROFILEMANAGER_H
#define PROFILEMANAGER_H

#include <QObject>
#include <QDBusConnection>
#include <QSharedMemory>
#include <QQmlApplicationEngine>
#include <QDBusMessage>
#include "profilemanager_adaptor.h"
struct Users {
    int id;
    QString name;
    QString path;
};

class ProfileManager : public QObject
{
    Q_OBJECT
    Q_CLASSINFO("D-Bus Interface", "com.fpt.fresher.ProfileManager")
    //Q_PROPERTY(int activeUserId READ activeUserId NOTIFY userActived)

public:
    explicit ProfileManager(QObject *parent = nullptr);
    int activeUserId() const;
    void setActiveUser(int id);
    void broadcastUserActived();
signals:
    void userActived(int id);
public:
    void writeSharedMemory(const Users& user);
private:
    int m_activeUserId;
    QSharedMemory m_sharedMemory;
    ProfileManagerAdaptor *m_adaptor = nullptr;
    Users user[3] = {
        {0, "Guest", "../QTA_DBus_App/images/guest.png"},
        {1, "Driver 1", "../QTA_DBus_App/images/driver1.png"},
        {2, "Driver 2", "../QTA_DBus_App/images/driver2.png"}
    };
};

#endif // PROFILEMANAGER_H
