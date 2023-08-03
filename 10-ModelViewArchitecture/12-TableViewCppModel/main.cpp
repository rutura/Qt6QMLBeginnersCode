// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include "tablemodel.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<TableModel>("TableModel", 0, 1, "TableModel");

    QQmlApplicationEngine engine;
    QQuickStyle::setStyle("Material");
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("12-TableViewCppModel", "Main");

    return app.exec();
}
