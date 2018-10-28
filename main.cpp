#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <CSensorsInterface.h>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    //QApplication nécessaire pour l'utilisation des QtCharts
    QApplication app(argc, argv);

    CSensorsInterface *sensorsData = new CSensorsInterface();

    QQmlApplicationEngine engine;

    //export des classes vers QML
    engine.rootContext()->setContextProperty("Data", sensorsData);

    //load main.qml
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
