#ifndef FPROFILE_H
#define FPROFILE_H


#include "fuser.h"
#include "ifprofilelistener.h"
#include <QObject>
#include <QDBusConnection>
#include <QDBusMessage>
#include <QDBusInterface>

class FProfile : public QObject {
    Q_OBJECT

public:
    FProfile();
    static FProfile *getInstance();

    void setListener(IFProfileListener *listener);

    FUser getActiveUser() const;

    void setActiveUser(int id);

signals:
    void userActived(int id);

public slots:
    void onUserActivated(int id);

private:
    static FProfile *m_instance;
    FUser m_activeUser;
    IFProfileListener *m_listener = nullptr;
};

#endif // FPROFILE_H
