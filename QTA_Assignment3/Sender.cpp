#include "Sender.h"

Sender::Sender(QObject *parent) : QObject(parent)
{

}

void Sender::emitMessage(const QString &msg)
{
    emit sendMessage(msg);
}
