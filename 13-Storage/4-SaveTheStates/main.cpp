// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

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
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("4-SaveTheStates", "Main");

    return app.exec();
}
