#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtWidgets/qapplication.h>
#include <QSql>

#include "fonction.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    ListVisiteur *model = new ListVisiteur();
    QQmlContext *context = engine.rootContext();
    context->setContextProperty("listVisiteur", model);

    ListSite *model_1 = new ListSite();
    QQmlContext *context1 = engine.rootContext();
    context1->setContextProperty("listSite", model_1);



    ListVisite *model_2 = new ListVisite();
    QQmlContext *context2 = engine.rootContext();
    context2->setContextProperty("listVisite", model_2);

    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("C:/Qt/Data/data.db");
    db.open();

    InfoSite *model_3 = new InfoSite();
    QQmlContext *context3 = engine.rootContext();
    context3->setContextProperty("InfoSite", model_3);

    qmlRegisterType<DatabaseVisiteur>("com.databaseVisiteur", 1, 0, "DataVisiteur");
    qmlRegisterType<DatabaseSite>("com.databaseSite", 1, 0, "DataSite");
    qmlRegisterType<DatabaseVisite>("com.databaseVisite", 1, 0, "DataVisite");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
