#include "fprofilelistener.h"

//FProfileListener::FProfileListener()
//{

//}

void FProfileListener::onActiveUser(int id) {
    qDebug() << "Active user changed to ID:" << id;
    emit activeUserChanged(id);
}
