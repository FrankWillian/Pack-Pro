#ifndef OPUSMODBUS_H
#define OPUSMODBUS_H

#include <QObject>
#include <QModbusDataUnit>
#include <QTimer>

class QModbusClient;
class QModbusReply;

class OpusModBus : public QObject
{
    Q_OBJECT

public:
    explicit OpusModBus(QObject *parent = nullptr);

    void readValue(int addr);
    void readValue(const int numValues, const int addr, const int startAddr);
    void writeValue(int addr, const QVariant value);
    void writeValue(quint16 reg, quint16 value);
    void writeValue(const int addr, const int startAddr, const int numValues, const QVariant value);
    void storeValue(quint16 reg, quint16 value);
    void saveToFile(QString fileName);
    quint16 seekValue(quint16 reg);
    void sendValues(int addr);
    void initModBus();
    bool connectModBus();

    void setIP(const QString ip) { m_ipMB = ip; }
    QString getIP() const { return m_ipMB; }
    void setPort(const QString port) { m_portMB = port; }
    QString getPort() const { return m_portMB; }

    // Variavel estatica para qualquer um sem ter que criar objeto possa obter este valor
    static int serverAddr;
    void setServerAddr(const int sa) { serverAddr = sa; }
    int getServerAddr() const { return serverAddr; }

    //Retorna o status de conexão do Modbus
    bool isConnected();

    //Request Reconnection
    void RequestReconn();

    enum MessagesAddress
    {
        MA_ContaSet = 0,//
        MA_PosSelagem = 2,//
        MA_VelocSelagem = 4,//
        MA_TempoSelagem = 6,//
        MA_AtrasoTracao = 8,//
        MA_AtrasoCorte = 10,//
        MA_TempoCorte = 12,//
        MA_AtrasoInicio = 14,//
        MA_PosicaoFilme = 16,//
        MA_TempoIniciarAr = 18,//
        MA_TempoDesligaAr = 20,//
        MA_VelocFilme = 22,//
        MA_SelagVelocAberto = 24,//
        MA_AccSelag = 26,//
        MA_DecSelag = 28,//
        MA_InicioAbertura = 30,//
        MA_AvcCilindro = 32, //
        MA_DurEsteiraLonga = 34, //

        MA_Alarmes = 44,

        MA_extra = 62,
        MA_ArEmbalagem = 64,
        MA_TpoCortina = 66,
        MA_AlarmeProduto = 68,
        MA_RoloSolto = 70,
        MA_DurEsteiraCurta = 72,//
        MA_TpoAgrupador = 74,//
        MA_QtdAgrupador = 76,//
        MA_QtdEsteira = 78,//
        MA_QtdContador = 80,//
        MA_DesligaEsteira = 82,//
        MA_AtrasoPort = 84,//
        MA_DuracaoPort = 86,//
        MA_AtrasoEsticador = 88,//
        MA_DurEsticador = 90,//
        MA_PartidaEsteiraEnt = 92,//
        MA_ParadaEsteiraEnt = 94,//
        MA_CicloEsteiraEnt = 96,//


        // Somente leitura

        MA_ProdutiMedia = 98,//
        MA_ContaGeral = 100,//
        MA_ContaAtual = 102,
        MA_InfoHrsEnerg = 104,//
        MA_InfoMinEnerg = 106,//
        MA_InfoHorasProd = 108,//
        MA_InfoMinProd = 110,//
        MA_DataDia = 112,//
        MA_DataMes = 114,//
        MA_Hora = 116,//
        MA_Min = 118,//
        MA_VelocMedia = 120,//
        MA_MAX
    };

private:
    typedef struct s_WriteMsgMirror
    {
        quint16 Register;
        quint16 Value;
    }t_WriteMsgMirror;

    QModbusReply *lastRequest;
    QModbusClient *modbusDevice;
    QVector<quint16> m_holdingRegisters;

    QString m_ipMB;
    QString m_portMB;
    qint32 m_readStartAddr;
    qint32 m_readNumValues;
    qint32 m_writeStartAddr;
    qint32 m_writeNumValues;

    QString m_conectMsg;

    QVector<t_WriteMsgMirror> m_WriteMsgMirror;
    QVector<t_WriteMsgMirror> m_ReadMsgMirror;

    QModbusDataUnit readRequest() const;
    QModbusDataUnit writeRequest() const;

    void procData(const QModbusDataUnit *du);

    bool flagReconnec = false;

signals:
    void readyData(QString data);
    void readyMD0(QString data);
    void readyMD1(QString data);
    void readyMD2(QString data);
    void readyMD3(QString data);
    void readyMD4(QString data);
    void readyMD5(QString data);
    void readyMD6(QString data);
    void readyMD7(QString data);
    void readyMD8(QString data);
    void readyMD9(QString data);
    void readyMD10(QString data);
    void readyMD11(QString data);
    void readyMD12(QString data);
    void readyMD13(QString data);
    void readyMD14(QString data);
    void readyMD15(QString data);
    void readyMD16(QString data);
    void readyMD17(QString data);

    void readyMD31(QString data);
    void readyMD32(QString data);
    void readyMD33(QString data);
    void readyMD34(QString data);
    void readyMD35(QString data);
    void readyMD36(QString data);
    void readyMD37(QString data);
    void readyMD38(QString data);
    void readyMD39(QString data);
    void readyMD40(QString data);
    void readyMD41(QString data);
    void readyMD42(QString data);
    void readyMD43(QString data);
    void readyMD44(QString data);
    void readyMD45(QString data);
    void readyMD46(QString data);
    void readyMD47(QString data);
    void readyMD48(QString data);
    void readyMD49(QString data);

    // Somente leitura
    void readyMD50(QString data);
    void readyMD51(QString data);
    void readyMD52(QString data);
    void readyMD53(QString data);
    void readyMD54(QString data);
    void readyMD55(QString data);
    void readyMD56(QString data);
    void readyMD57(QString data);
    void readyMD58(QString data);
    void readyMD59(QString data);
    void readyMD60(QString data);


    void readyAlarm(QString data);
    void readyTemp(QString data);

    void conexao(QString erro);

    void SendDateTime(QString date);

public slots:

private slots:
    void onStateChanged(int state);
    void readReady();



};

#endif // OPUSMODBUS_H
