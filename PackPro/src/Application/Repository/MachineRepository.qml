pragma Singleton
import QtQuick 2.4

QtObject {



    readonly property string version: " 3.0.1"
    //readonly property string version: "9.9.9"
    property string formato: "60x60"

    property int fontLabelSize: 14
    property int fontValueSize: 12
    property string fontFamily: "Arial"

    property string esteiraCtr: "apagado"
    property string esteiraEntCtr: "apagado"
    property string setUpCtr: "apagado"
    property string agrupadorCtr: "apagado"
    property string agrupadorCtrEst: "apagado"
    property string esticadorCtr: "apagado"
    property string portCtr: "apagado"
    property string sensorExtCtr: "apagado"
    property string injetorExterno: "apagado"
    property string extra: "apagado"
    property string smartCountCtr: "apagado"
    property string pickCountCtr: "apagado"
   //property string extratorCtr: "apagado"
    property string tracaoCorteCtr: "apagado"

    property string dataModBus: "LOG:"

    property string nameLoginAdmin: "inobag"
    //property string nameLoginAdmin: ""
    property string nameLoginSuper: "superino"
    property string nameLoginDigitado: ""

    property string nameLoginCarregado: ""
    property bool   userLoginAdmin: false
    //property string nameLoginCarregado: "inobag"
    //property bool   userLoginAdmin: true

    property bool   userLoginSuper: false

    property string passwordAdmin: "192837"
    property string passwordSuper: "172839"
    property string passwordDigitado: ""

   // property string valueSetConta: "0"
    property string valuePosSelag: "0"
    property string valueVelocSelag: "0"
    property string valueTempoSelag: "0"
    property string valueAtrasoTracao: "0"
    property string valueAtrasoCorte: "0"
    property string valueTempoCorte: "0"
    property string valueAtrasoInicio: "0"
    property string valuePosicaoFilme: "0"
    property string valueTempoIniciarAr: "0"
    property string valueTempoDesligaAr: "0"
    property string valueVelocFilme: "0"
    property string valueSelagVelocAbert: "0"
    property string valueAccSelag: "0"
    property string valueDecSelag: "0"
    property string valueInicioAbertura: "0"
    property string valueQtdContador: "0"
    property string valueQtdEsteira: "0"
    property string valuetracaoCorte: "0"
    property string valueTpoAgrupador: "0"
    property string valueQtdAgrupador: "0"
    property string valueDesligaEsteira: "0"
    property string valueAtrasoPort: "0"
    property string valueDuracaoPort: "0"
    property string valueVelocMedia: "0"
    property string valueProdutiMedia: "0"
    property string valueContaGeral: "0"
    property string valueInfoHrsEnerg: "0"
    property string valueInfoMinEnerg: "0"
    property string valueInfoHorasProd: "0"
    property string valueInfoMinProd: "0"
    property string valueArEmbalagem: "0"
    property string valueExtra: "0"
    property string valueTpoCortina: "0"
    property string valueAlarmeProd: "0"
    property string valueTpoAtrasoInjetor: "0"

    //Data & Hora
    property string valueDataDia: "0"
    property string valueDataMes: "0"
    property string valueHora: "0"
    property string valueMin: "0"

    // Novas Variaveis
    property string valueAtrasoEsticador: "0"
    property string valueDurEsticador: "0"
    property string valuePartidaEsteiraEnt: "0"
    property string valueParadaEsteira: "0"
    property string valueTopAtrasoExtrator: "0"
    property string valueDurEsteiraCurta: "0"
    property string valueDurEsteiraLonga: "0"
    property string valueAvnCilindro: "0"
    property string valueContaSet: "0"
    property string valueRoloSolto: "0"


    property string valueContaAtual: "0"

    property string valueCoreTemp: "0"

    property string conexao: "Conectado"

    // Flag que sinaliza que algum alarme esta ativo
    property bool alarmActive: false
    property bool alarmeVis: true

    property bool envioRun: false

    //Flag que sinaliza se o botão de rolo esta solto ou preso
    property bool roloSolto: false


    //Habilite essa flag para visualizar o botão de Impressão no menu principal
    property bool impressoraVisivel: false
    property string impressoraStatus: "Impressora On"
    property string valueVersaoPLC: "9999"


}
