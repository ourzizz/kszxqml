#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml/QtQml>
#include "KaoshengListModel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qDebug() << "main,error - " << 1;
    qmlRegisterType<KaoshengListModel>("an.qt.KSModel", 1, 0, "KaoshengListModel");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
