#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQmlContext>      //rootContext()->SetContextProperty()
#include <QQmlEngine>       //qmlRegisterType
#include "task.h"


int main(int argc, char *argv[])
{

    /* Baseado na arquitetura ARM, x86 ou x86_64 configura a Interface de Rede a ser Monitorada */
#if defined(__arm__) || defined(__TARGET_ARCH_ARM) || defined(_M_ARM) || defined(__aarch64__)
    // Load virtualkeyboard input context plugin
    //qputenv("QT_IM_MODULE", QByteArray("freevirtualkeyboard"));
    //qputenv("QT_QPA_PLATFORM", QByteArray("eglfs"));
    //qputenv("QT_QPA_PLATFORM_PLUGIN_PATH", QByteArray("/usr/lib/qt5/plugins/platforms"));
    //qputenv("QT_QPA_EGLFS_WIDTH", QByteArray("1024"));
    //qputenv("QT_QPA_EGLFS_HEIGHT", QByteArray("768"));
    //qputenv("FB_MULTI_BUFFER", QByteArray("1"));
    //qputenv("QT_QPA_EGLFS_FORCEVSYNC", QByteArray("1"));
    //qputenv("QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS", QByteArray("/dev/input/event0"));
    //qputenv("QT_QUICK_CONTROLS_STYLE", QByteArray("Flat"));
    //qputenv("QT_QPA_GENERIC_PLUGINS", QByteArray("tslib"));
    //qputenv("QT_QPA_FB_DISABLE_INPUT", QByteArray("1"));
    //qputenv("TSLIB_CALIBFILE", QByteArray("/etc/pointercal"));
    //qputenv("TSLIB_CONFFILE", QByteArray("/etc/ts.conf"));
    //qputenv("TSLIB_TSEVENTTYPE", QByteArray("INPUT"));
    //qputenv("TSLIB_TSDEVICE", QByteArray("/dev/input/event0"));
    //qputenv("QT_QPA_EGLFS_DISABLE_INPUT", QByteArray("1"));
    //qputenv("QT_QPA_EGLFS_HIDECURSOR", QByteArray("1"));

    qputenv("QT_IM_MODULE", QByteArray("freevirtualkeyboard"));
    qputenv("QT_QPA_GENERIC_PLUGINS", QByteArray("tslib"));
    qputenv("TSLIB_CALIBFILE", QByteArray("/etc/pointercal"));
    qputenv("TSLIB_CONFFILE", QByteArray("/etc/ts.conf"));
    qputenv("TSL"
            "IB_TSEVENTTYPE", QByteArray("INPUT"));
    qputenv("TSLIB_TSDEVICE", QByteArray("/dev/input/event0"));
    qputenv("QT_QPA_EGLFS_DISABLE_INPUT", QByteArray("1"));
    qputenv("QT_QPA_EGLFS_HIDECURSOR", QByteArray("1"));

#elif defined(__i386) || defined(__i386__) || defined(_M_IX86)
    qputenv("QT_IM_MODULE", QByteArray("freevirtualkeyboard"));
#elif defined(__x86_64) || defined(__x86_64__) || defined(__amd64) || defined(_M_X64)
    qputenv("QT_IM_MODULE", QByteArray("freevirtualkeyboard"));
#endif


    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    // Tem que criar um QList<QObject> antes de criar a classe Task
    QList<QObject*> alarmList;

    // Criando objeto da classe Task, uma unica instancia!
    Task taskObj;
    // Passo o endereço do QList<QObject> criado neste momento
    // dentro da classe é só trabalhar com listAlarms->append()
    taskObj.setListInstance(&alarmList);
    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("Task", &taskObj);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
