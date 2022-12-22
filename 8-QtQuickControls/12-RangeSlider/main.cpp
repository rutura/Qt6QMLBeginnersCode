/*
 *          . Exploring RangeSlider
 *          . Use the docs
 *          . Bring QuickControls2 into CMake to play with different styles
 *              right from the start.
 *          . Improvise.
 *
 * */
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QQuickStyle::setStyle("Default");
    const QUrl url(u"qrc:/12-RangeSlider/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
