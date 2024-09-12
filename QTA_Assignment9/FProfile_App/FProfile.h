#ifndef FPROFILE_H
#define FPROFILE_H

#include <QObject>
#include <QDBusConnection>
#include <QDBusMessage>
#include <QDBusInterface>
#include <QDBusPendingReply>
#include <QDebug>
#include "IFProfileListener.h"
#include "FUser.h"

class FProfile : public QObject {
    Q_OBJECT
public:
    static FProfile* getInstance() {
        static FProfile instance;
        return &instance;
    }

    void setListener(IFProfileListener *listener) {
        m_listener = listener;
    }

    Q_INVOKABLE FUser getActiveUser() const {
        return m_activeUser;
    }

    Q_INVOKABLE void setActiveUser(int id) {
        QDBusInterface iface("assignment9.com.vn", "/assignment09/com/vn", "assignment09.com.vn", QDBusConnection::sessionBus());
        QDBusPendingReply<void> reply = iface.call("setActiveUser", id);
        reply.waitForFinished();
        if (reply.isError()) {
            qDebug() << "Error calling setActiveUser:" << reply.error().message();
        }
    }

signals:
    void userActived(int id);

private slots:
    void onUserActived(int id) {
        m_activeUser = FUser(id, "User Name", "User Avatar"); // Hardcoded for example
        if (m_listener) {
            m_listener->onActiveUser(id);
        }
    }

private:
    FProfile(QObject *parent = nullptr) : QObject(parent), m_listener(nullptr) {
        QDBusConnection::sessionBus().connect("assignment9.com.vn", "/assignment09/com/vn", "assignment09.com.vn", "userActived", this, SLOT(onUserActived(int)));
    }

    FProfile(const FProfile&) = delete;
    FProfile& operator=(const FProfile&) = delete;

    IFProfileListener *m_listener;
    FUser m_activeUser;
};

#endif // FPROFILE_H
