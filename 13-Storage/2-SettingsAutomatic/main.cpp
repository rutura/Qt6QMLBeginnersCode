#include <QGuiApplication>
#include <QQmlApplicationEngine>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    //App Information
    app.setOrganizationName("LearnQt");
    app.setOrganizationDomain("learnqt.guide");
    app.setApplicationName("SettingsDemo");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/2-SettingsAutomatic/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
