#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QSettings>
#include <QDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // Set application identifiers for Settings
    app.setOrganizationName("TodoApp");
    app.setOrganizationDomain("todoapp.local");
    app.setApplicationName("TodoList");

    // Set Qt Quick Controls style to Basic to enable customization
    QQuickStyle::setStyle("Basic");

    // Print the settings location
    QSettings settings;
    qDebug() << "Settings location:" << settings.fileName();

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("TodoList", "MainView");

    return app.exec();
}
