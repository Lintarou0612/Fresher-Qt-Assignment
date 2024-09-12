#ifndef SENDER_H
#define SENDER_H

#include <QObject>

class Sender : public QObject
{
    Q_OBJECT
public:
    explicit Sender(QObject *parent = nullptr);

signals:
    void sendMessage(const QString &msg);
public slots:
    void emitMessage(const QString &msg);
};

#endif // SENDER_H
