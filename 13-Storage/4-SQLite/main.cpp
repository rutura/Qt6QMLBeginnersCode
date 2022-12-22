#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qDebug() << " Offline storage path : " << engine.offlineStoragePath() ;
    const QUrl url(u"qrc:/4-SQLite/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
