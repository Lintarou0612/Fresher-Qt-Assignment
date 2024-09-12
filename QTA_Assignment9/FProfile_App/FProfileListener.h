#ifndef FPROFILELISTENER_H
#define FPROFILELISTENER_H

#include <QDebug>
#include "IFProfileListener.h"

class FProfileListener : public IFProfileListener {
public:
    void onActiveUser(int id) override {
        qDebug() << "Active user changed to ID:" << id;
    }
};

#endif // FPROFILELISTENER_H
