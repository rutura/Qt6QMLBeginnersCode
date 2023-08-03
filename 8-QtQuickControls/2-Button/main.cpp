// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

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


    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("2-Button", "Main");

    return app.exec();
}
