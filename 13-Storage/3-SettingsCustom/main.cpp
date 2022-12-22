#include <QGuiApplication>
#include <QQmlApplicationEngine>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    //App Information
    app.setOrganizationName("LearnQt1");
    app.setOrganizationDomain("learnqt1.guide");
    app.setApplicationName("SettingsDemo1");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/3-SettingsCustom/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
