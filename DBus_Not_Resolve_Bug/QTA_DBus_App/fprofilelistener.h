#ifndef FPROFILELISTENER_H
#define FPROFILELISTENER_H


#include "ifprofilelistener.h"
#include <QDebug>

class FProfileListener : public QObject, public IFProfileListener {
    Q_OBJECT
public:
    void onActiveUser(int id) override;

signals:
    void activeUserChanged(int id);
};

#endif // FPROFILELISTENER_H
