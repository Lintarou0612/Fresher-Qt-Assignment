#include "fprofile.h"
FProfile *FProfile::m_instance = nullptr;
FProfile *FProfile::getInstance() {
    if(m_instance == nullptr)
        m_instance = new FProfile();
    return m_instance;
}

void FProfile::setListener(IFProfileListener *listener) {
    m_listener = listener;
}

FUser FProfile::getActiveUser() const {
    return m_activeUser;
}

void FProfile::setActiveUser(int id) {
    QDBusInterface iface("com.fpt.fresher.ProfileManager",
                         "/com/fpt/fresher/ProfileManager",
                         "com.fpt.fresher.ProfileManager",
                         QDBusConnection::sessionBus());
    if (iface.isValid()) {
        iface.call("setActiveUser", id);
    }
}

void FProfile::onUserActivated(int id) {
    QDBusInterface iface("com.fpt.fresher.ProfileManager",
                         "/com/fpt/fresher/ProfileManager",
                         "com.fpt.fresher.ProfileManager",
                         QDBusConnection::sessionBus());
    QDBusMessage reply = iface.call("GetUserInfo", id);
    QList<QVariant> args = reply.arguments();
    if (args.size() == 3) {
        m_activeUser = FUser(args[0].toInt(), args[1].toString(), args[2].toString());
        if (m_listener) {
            m_listener->onActiveUser(m_activeUser.getId());
        }
    }
}

FProfile::FProfile() {
    QDBusConnection::sessionBus().connect("com.fpt.fresher.ProfileManager",
                                          "/com/fpt/fresher/ProfileManager",
                                          "com.fpt.fresher.ProfileManager",
                                          "userActived",
                                          this,
                                          SLOT(onUserActivated(int)));
}
