#include "Receiver.h"

Receiver::Receiver(QObject *parent) : QObject(parent)
{

}

QStringList Receiver::messages() const
{
    return m_messages;
}

void Receiver::receiveMessage(const QString &msg)
{
    m_messages.append(msg);
    emit messagesChanged();
}
