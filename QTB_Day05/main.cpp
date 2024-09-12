#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <qstringlist.h>
#include <qqmlcontext.h>
#include "datamembers.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QList<QObject*> dataList;
    dataList.append(new DataMembers("ManhNT56565656565656565650", 23, "Nguyen Tien Manh", "Kim Bai, Thanh Oai, Ha Noi"));
    dataList.append(new DataMembers("DungLV13", 22, "Le Viet Dung", "Hai Ba Trung, Ha Noi"));
    dataList.append(new DataMembers("KienNT01", 20, "Nguyen Trung Kien", "Kim Bai, Thanh Oai, Ha Noi"));
    dataList.append(new DataMembers("LinhNK12", 23, "Nguyen Khanh Linh", "Quang ngai, quang tri, thua thien hue"));
    dataList.append(new DataMembers("HieuTQ", 22, "Tran Quoc Hieu", "Nghe An, Ha Tinh, Ho Chi Minh"));
    dataList.append(new DataMembers("KhanhTH", 29, "Hoang Thanh Khanh", "Cao Bang, Lang Son, Dong Thap, Bac Ninh, ninh thuan, hoa binh, hai duong, thanh tri, thanh oai"));

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    QQmlContext *ctx = engine.rootContext();
    ctx->setContextProperty("userData", QVariant::fromValue(dataList));
    engine.load(url);

    return app.exec();
}
