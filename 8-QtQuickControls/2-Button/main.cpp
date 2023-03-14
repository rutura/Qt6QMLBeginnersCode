#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    //Load our style
    QQuickStyle::setStyle("Material");
    //QQuickStyle::setStyle("Universal");
    //QQuickStyle::setStyle("Fusion");
    //QQuickStyle::setStyle("Imagine");
    //QQuickStyle::setStyle("Default");

    const QUrl url(u"qrc:/2-Button/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
