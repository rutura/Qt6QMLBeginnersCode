// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>


int main(int argc, char *argv[])
{

    QGuiApplication app(argc, argv);

    QQuickStyle::setStyle("Basic");

    //App Information
    app.setOrganizationName("LearnQt");
    app.setOrganizationDomain("learnqt.guide");
    app.setApplicationName("SettingsDemo");

    QQmlApplicationEngine engine;
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("2-SettingsAutomatic", "Main");

    return app.exec();
}
