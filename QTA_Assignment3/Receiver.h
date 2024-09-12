#ifndef RECEIVER_H
#define RECEIVER_H

#include <QObject>

class Receiver : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList messages READ messages NOTIFY messagesChanged)
public:
    explicit Receiver(QObject *parent = nullptr);
    QStringList messages() const;

signals:
    void messagesChanged();
public slots:
    void receiveMessage(const QString &msg);
private:
    QStringList m_messages;
};

#endif // RECEIVER_H
