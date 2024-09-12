#include "profilemanager.h"
#include <QDBusConnection>
#include <QDataStream>

profilemanager::profilemanager(QObject *parent) : QObject(parent),  m_id(-1), m_sharedMemory("ProfileManagerSharedMemory")
{
    m_users.insert(0, {0, "Guest", "guest.png", "qrc:/images/avatar-thinking-1-svgrepo-com.png"});
    m_users.insert(1, {1, "Driver 1", "driver1.png", "qrc:/images/avatar-thinking-6-svgrepo-com.png"});
    m_users.insert(2, {2, "Driver 2", "driver2.png", "qrc:/images/avatar-thinking-8-svgrepo-com.png"});
    m_id = 0;
    QDBusConnection::sessionBus().registerObject("/assignment09/com/vn", this, QDBusConnection::ExportAllSlots);
    QDBusConnection::sessionBus().registerService("assignment9.com.vn");
    setActiveUser(0);
}

profilemanager::~profilemanager()
{
}

QString profilemanager::getname(int id)
{
    Users my_user = m_users.value(id);
    QString name = my_user.m_name;
    return name;
}

QString profilemanager::getPath(int id)
{
    Users my_user = m_users.value(id);
    QString path = my_user.m_path;
    qDebug() << path;
    return path;
}

void profilemanager::setActiveUser(int id)
{
    if (m_id != id)
    {
        m_id = id;
        if(m_sharedMemory.isAttached() || m_sharedMemory.attach())
        {
            m_sharedMemory.detach();
        }
        if(m_sharedMemory.create(sizeof(Users)))
        {
            Users activeUser = m_users.value(id);
            m_sharedMemory.lock();
            char *to = (char*)m_sharedMemory.data();
            const char *from = reinterpret_cast<const char*>(&activeUser);
            memcpy(to, from, sizeof(Users));
            m_sharedMemory.unlock();
        }
        qDebug() << "User changed";
        emit userActived();
    }
}

int profilemanager::id() const
{
    return m_id;
}


