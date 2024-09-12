#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "Sender.h"
#include "Receiver.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Sender sender;
    Receiver receiver;

    QObject::connect(&sender, &Sender::sendMessage, &receiver, &Receiver::receiveMessage);

    engine.rootContext()->setContextProperty("sender", &sender);
    engine.rootContext()->setContextProperty("receiver", &receiver);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
