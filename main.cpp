#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml/QtQml>
#include <QApplication>
#include "KaoshengListModel.h"
#include "printer.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    qmlRegisterType<KaoshengListModel>("an.qt.KSModel", 1, 0, "KaoshengListModel");
    qmlRegisterType<Printer>("an.qt.Printer", 1, 0, "Printer");
//    qmlRegisterType<KaoshengListModel>("an.qt.Printer", 1, 0, "Printer");
//    qmlRegisterType<KaoshengListModel>("an.qt.SqlTool", 1, 0, "SqlTool");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));
    return app.exec();
}
