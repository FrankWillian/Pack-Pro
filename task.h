#ifndef TASK_H
#define TASK_H

#include <QObject>
#include <QQmlListProperty>
#include <QThread>
#include <QtConcurrent/QtConcurrentRun>
#include <QTimer>
#include <QDateTime>
#include "opusmodbus.h"


class Task : public QObject
{
    Q_OBJECT
    //Q_DISABLE_COPY(Task)
    Q_PROPERTY(QString state READ state WRITE setState NOTIFY stateChanged)
    Q_PROPERTY(QQmlListProperty<QObject> modelAlarms READ getAlarms NOTIFY alarmChanged)


public:
    explicit Task(QObject *parent = nullptr);
    ~Task();

    void setListInstance(QList<QObject *> *alarmList){ listAlarms = alarmList; }
    QQmlListProperty<QObject> getAlarms();

    QString state() { return m_msgState; }
    void setState(const QString s) { m_msgState = s; emit stateChanged(); }

    Q_INVOKABLE void writeMB(const int startAddr, const QVariant value);
    void readMB(const int addr);
    Q_INVOKABLE void readMB(const int addr, const int startAddr, const int numValues);
    Q_INVOKABLE bool connectMB(const QString ip, const QString port);
    Q_INVOKABLE void startContador(void);
    Q_INVOKABLE void setPorta(void);
    Q_INVOKABLE void resetPorta(void);
    Q_INVOKABLE void writeInt(quint16 value);
    Q_INVOKABLE void enableDevice(const int reg,const int bit,const bool value);
    Q_INVOKABLE void writeParamt(const int numA, quint16 value);
    Q_INVOKABLE void saveParams(void);
    Q_INVOKABLE void restoreParams(void);
    Q_INVOKABLE void updateSoftware(void);
    void sendMB(const int addr);
    void saveTable(const int addr, const quint16 value);
    void sendTable(void);

    QString getLocalDateTime(void);



private:
    QString m_msgState;
    OpusModBus *m_modbus;
    bool writeRun = false;
    bool alarmAtive = false;
    bool auxTelaAlarme = false;


    QList<QObject *> *listAlarms;

    QTimer *m_timer;
    QTimer *m_timerAlarm;
    QTimer *connection_timer;

    QString LocalDateTime;



Q_SIGNALS:
    void alarmChanged();

    void stateChanged();
    void readyData(QString data);
    void readyMD0(QString data); // Conta set
    void readyMD1(QString data); // Posição de selagem
    void readyMD2(QString data); // Velocidade selagem
    void readyMD3(QString data); // Tempo selagem
    void readyMD4(QString data); // Atraso tracao
    void readyMD5(QString data); // Atraso corte
    void readyMD6(QString data); // Tempo corte
    void readyMD7(QString data); // Atraso inicio
    void readyMD8(QString data); // Posição filme
    void readyMD9(QString data); // Tempo iniciar ar
    void readyMD10(QString data); // Tempo desligar ar
    void readyMD11(QString data); // Velocidade filme
    void readyMD12(QString data); // Selagem velocidade abertura
    void readyMD13(QString data); // Acc selagem
    void readyMD14(QString data); // Dec selagem
    void readyMD15(QString data); // Inicio abertura
    void readyMD16(QString data); // Avança cilindro
    void readyMD17(QString data); // Esteira longa

    void readyMD31(QString data); // Extra
    void readyMD32(QString data); // Ar embalagem
    void readyMD33(QString data); // Tempo cortina
    void readyMD34(QString data); // Alarme produto
    void readyMD35(QString data); // Rolo solto
    void readyMD36(QString data); // Esteira curta
    void readyMD37(QString data); // Tmpo agrupador
    void readyMD38(QString data); // Qtd agrupador
    void readyMD39(QString data); // Qtd esteira
    void readyMD40(QString data); // Qtd contador
    void readyMD41(QString data); // Desliga esteira
    void readyMD42(QString data); // Atraso port
    void readyMD43(QString data); // Duracao port
    void readyMD44(QString data); // Atraso Esticador
    void readyMD45(QString data); // Duracao Esticador
    void readyMD46(QString data); // Partida Esteira
    void readyMD47(QString data); // Parada Esteira
    void readyMD48(QString data); // Ciclo Esteira

    // Somente leitura

    void readyMD49(QString data); // Produtividade
    void readyMD50(QString data); // Conta geral
    void readyMD51(QString data); // Conta atual
    void readyMD52(QString data); // Tempo energ horas
    void readyMD53(QString data); // Tempo energ minutos
    void readyMD54(QString data); // Tempo produzindos horas
    void readyMD55(QString data); // Tempo porduzindo minutos
    void readyMD56(QString data); // Data dia
    void readyMD57(QString data); // Data mes
    void readyMD58(QString data); // Data hora
    void readyMD59(QString data); // Data min
    void readyMD60(QString data); // Velocidade Media

    void readyAlarm(QString data);
    void readyTemp(QString data); //Temperatura do Core

    void conexao(QString erro); // Conexão PLC

public slots:

    void procTimeout(void);

    void connTimeout(void);

    void alarmResetView(void);

    void procAlarms(const QString);

    void setLocalDateTime(QString);

};

#endif // TASK_H
