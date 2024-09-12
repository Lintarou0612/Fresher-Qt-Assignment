#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "fprofile.h"
#include "fprofilelistener.h"
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    FProfileListener listener;
    FProfile::getInstance()->setListener(&listener);
    engine.rootContext()->setContextProperty("profileListener", &listener);
    engine.rootContext()->setContextProperty("fProfile", FProfile::getInstance());

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
