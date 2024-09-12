#include "profilemanager.h"
#include <QBuffer>
#include <QDataStream>
#include <loghelper.h>
ProfileManager::ProfileManager(QObject *parent)
    : QObject(parent), m_activeUserId(0), m_sharedMemory("ProfileManagerSharedMemory")
{
    if (!m_sharedMemory.create(sizeof(Users))) {
        m_sharedMemory.attach();
    }
//    setActiveUser(0); // Set default active user and broadcast signal on start
//    QDBusConnection::sessionBus().registerObject("/com/fpt/fresher/ProfileManager", this);
//    QDBusConnection::sessionBus().registerService("com.fpt.fresher.ProfileManager");
//    m_adaptor = new ProfileManagerAdaptor(this);
//    LOG_INFO;

    // connect with test signal from other process
    QDBusConnection::sessionBus().connect("",                           // service name, could be empty
                                          "/com/fpt/fresher/ProfileManager", // object path, could be empty
                                          "com.fpt.fresher.ProfileManager",  // service interface
                                          "userActived",           // method name
                                          this, SLOT(setActiveUser(int)));

    setActiveUser(0);
    m_adaptor = new ProfileManagerAdaptor(this);
    QDBusConnection bus = QDBusConnection::sessionBus();
    if(!bus.isConnected())
    {
        LOG_INFO << "Can not connect to dbus";
    }
    if(!bus.registerService("vn.com.fsoft"))
    {
        LOG_INFO << "Can not register service";
    }
    if(!bus.registerObject("/vn/com/fsoft/appInterface", this))
    {
        LOG_INFO << "Can not register object path";
    }
}

int ProfileManager::activeUserId() const
{
    return m_activeUserId;
}

void ProfileManager::setActiveUser(int id)
{
    if(id < 0 || id > 2) {
        LOG_INFO << "User ID" << id << "not found.";
        return;
    }
    m_activeUserId = id;
    LOG_INFO << "Active user set to ID:" << id;
    writeSharedMemory(user[id]);
    broadcastUserActived();
}

void ProfileManager::broadcastUserActived()
{
    QDBusMessage signal = QDBusMessage::createSignal("/com/fpt/fresher/ProfileManager", // object path, could be empty
                                                     "com.fpt.fresher.ProfileManager",  // service interface
                                                     "UserActivated");
    signal << m_activeUserId;
    QDBusConnection::sessionBus().send(signal);
    emit userActived(m_activeUserId);
}

void ProfileManager::writeSharedMemory(const Users &user)
{
    if(!m_sharedMemory.isAttached())
    {
        LOG_INFO << "Attached FAILURE";
        return;
    }
    if(!m_sharedMemory.lock())
    {
        LOG_INFO << "Lock FAILURE";
        return;
    }

    /*char* buffer = (char*)m_sharedMemory.data();
    if(buffer == nullptr) {
        m_sharedMemory.unlock();
        LOG_INFO << "Data FAILURE";
        return;
    }*/
    QByteArray data;
    QBuffer buffer(&data);
    buffer.open(QIODevice::WriteOnly);
    QDataStream out(&buffer);
    out << user.id << user.name << user.path;
    buffer.close();

    m_sharedMemory.lock();
    char *to = (char *)m_sharedMemory.data();
    const char *from = data.data();
    memcpy(to, from, qMin(m_sharedMemory.size(), data.size()));
    m_sharedMemory.unlock();
}
