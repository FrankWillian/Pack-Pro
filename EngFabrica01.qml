import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
//import QtGraphicalEffects 1.0
import QtQuick.FreeVirtualKeyboard 1.0
import QtQml 2.2
import "."

Item {
    id: root

    Component.onCompleted: {

        if(Data.setUpCtr == "ligado"){
            controlSetUp.checked = true
        }
    }

    function sendSignal (register, value)
    {
        Data.envioRun = true
        Task.writeParamt(Number(register),Number(value))

        Data.envioRun = false

    }

    Rectangle {

        id: arquivo
        color: "transparent"
        width: parent.width
        height: 550
        y: 25
        x: 00

        SwipeView{
            id: swipe
            anchors.fill: parent
            currentIndex: tabBarEng.currentIndex

            function addPage(page) {
                addItem(page)
                page.visible = true
            }

            function removePage(page) {
                for (var n = 0; n < count; n++) { if (page === itemAt(n)) { removeItem(n) } }
                page.visible = false
            }

            Timer {
                id: timerCal
                interval: 300
                running: true
                repeat: false
                onTriggered: {
                    Task.enableDevice(37,1,false)
                    timerCal.running = false
                }
            }

            Component.onCompleted:
            {
                if(Data.nameLoginCarregado === Data.nameLoginAdmin)
                {
                    swipe.addPage(pageEngOperador)
                    swipe.addPage(pageEngTecnico1)
                    swipe.addPage(pageEngTecnico2)
                    swipe.addPage(pageDateTime)
                }
                else if(Data.nameLoginCarregado === Data.nameLoginSuper)
                {
                    swipe.addPage(pageEngOperador)
                    swipe.addPage(pageEngTecnico1)
                    swipe.removePage(pageEngTecnico2)
                    swipe.removePage(pageDateTime)
                }
                else
                {
                    swipe.addPage(pageEngOperador)
                    swipe.removePage(pageEngTecnico1)
                    swipe.removePage(pageEngTecnico2)
                    swipe.removePage(pageDateTime)
                }
            }
        }

        PageIndicator{
            id: indicator
            count: swipe.count
            currentIndex: swipe.currentIndex

            //anchors.bottom: swipe.bottom
            //anchors.horizontalCenter: swipe.horizontalCenter
            x: 200
            y: 510

            delegate: Rectangle {
                implicitWidth: 14
                implicitHeight: 14

                radius: width / 2
                color: "#667ab3"
                border.color: "#ffffff"
                border.width: 1

                opacity: index === indicator.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

                Behavior on opacity {
                    OpacityAnimator {
                        duration: 400
                    }
                }
            }
        }

        Page{
            id: pageEngOperador
            visible: false
            Column{
                x: 50
                spacing: 25
                Row{
                    spacing: 30
                    Text {
                        id: tpo_parEstEnt
                        text: "Partida esteira entrada (ms)"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }
                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: rec_parEstEnt
                        texto: Data.valuePartidaEsteiraEnt
                        registro: 92
                        x_txt: 270
                    }
                }
                Row{
                    spacing: 30
                    Text {
                        id: tpo_paradaEstEnt
                        text: "Parada esteira entrada (ms)"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }
                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: rec_paradaEstEnt
                        texto: Data.valueParadaEsteira
                        registro: 94
                        x_txt: rec_parEstEnt.x_txt
                    }
                }
                Row{
                    spacing: 30
                    Text {
                        id: tpo_atrasoExtrator
                        text: "Tpo atraso extrator (ms)"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }
                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: rec_cicloEstEnt
                        texto: Data.valueTopAtrasoExtrator
                        registro: 96
                        x_txt: rec_parEstEnt.x_txt
                    }
                }
                Row{
                    spacing: 30
                    Text {
                        text: "Esteira saída curta (ms)"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }
                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: rec_durEstSaidaCurta
                        texto: Data.valueDurEsteiraCurta
                        registro: 72
                        x_txt: rec_parEstEnt.x_txt
                    }
                }
                Row{
                    spacing: 30
                    Text {
                        id: test16
                        text:  "Esteira Saída Longa (ms)"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }
                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: insert16
                        texto: Data.valueDurEsteiraLonga
                        registro: 34
                        x_txt: rec_parEstEnt.x_txt
                    }
                }

                Row{
                    spacing: 30
                    Text {
                        id: tpo_labelCorteAgru
                        text: "Tempo de corte Agru (ms)"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }

                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: rec_corteAgru
                        texto: Data.valueTpoAgrupador
                        registro: 74
                        x_txt: rec_parEstEnt.x_txt
                    }
                }
                /*Row{
                    spacing: 30
                    Text {
                        id: tpo_ArEmbalagem
                        text: "Parada tração extra (mm)"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }

                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: rec_arEmbalagem
                        texto: Data.valueExtra
                        registro: 62
                        x_txt: rec_parEstEnt.x_txt
                    }
                }*/
                Row{
                    spacing: 30
                    visible: false
                    Text {
                        id: tpo_TpoCortina
                        text: "Tempo cortina (ms)"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }

                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: rec_tpoCortina
                        texto: Data.valueTpoCortina
                        registro: 66
                        x_txt: rec_parEstEnt.x_txt
                    }
                }
                Row{
                    spacing: 30
                    visible: false
                    Text {
                        id: tpo_AlarmeProd
                        text: "Tempo alarme Prod. (ms)"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }

                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: rec_AlarmeProd
                        texto: Data.valueAlarmeProd
                        registro: 68
                        x_txt: rec_parEstEnt.x_txt
                    }
                }
            }

            // Botão superior esquerdo para exibir e ocultar opções
            Rectangle {
                x: 45
                y: 420
                z: 90
                id: btnLogin
                width: 70
                height: 70

                Image {
                    anchors.fill: btnLogin
                    id: img
                    source: "CONTENTS/IMAGES/user2.png"
                    asynchronous: true
                    sourceSize: Qt.size(width, height)

                    MouseArea {
                        anchors.fill: img
                        onClicked: {
                            popupLogin.visible = true
                        }
                    }
                }
            }

            Rectangle {
                x: 190
                y: 450
                z: 90
                id: btnSalvar
                width: 70
                height: 70
                visible: false
                Image {
                    anchors.fill: parent
                    id: imgSalvar
                    source: "CONTENTS/IMAGES/Salvar.png"
                    asynchronous: true
                    sourceSize: Qt.size(width,height)

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            Task.saveParams()
                            popupSmall.msgPopup = "Parâmetros salvos!"
                            popupSmall.visible = true
                        }
                    }
                }
            }

            Rectangle {
                x: 335
                y: 450
                z: 90
                id: btnCarregar
                width: 70
                height: 70
                visible: false

                Image {
                    anchors.fill: parent
                    id: imgCarregar
                    source: "CONTENTS/IMAGES/loadRecipe.png"
                    asynchronous: true
                    sourceSize: Qt.size(width,height)

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            popupSmallLoad.msgPopup = "Deseja restaurar os parâmetros salvos?"
                            popupSmallLoad.visible = true
                        }
                    }
                }
            }

            Text{
                id: user
                text: Data.nameLoginCarregado
                anchors.top: btnLogin.bottom
                anchors.left: btnLogin.left
                color: Paleta.colorPatern
                font.pointSize: 10
                font.bold: Font.Thin
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                font.capitalization: Font.Thin
                font.weight: Font.Thin
                width: btnLogin.width
            }
        }
        Page{
            id: pageEngTecnico1
            visible: false
            Column{
                x: 50
                spacing: 25
                Row{
                    spacing: 60
                    Text {
                        id: test10
                        text: "Tempo desliga ar (ms)"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }
                    TextBoxOpus
                    {
                        minValue: 50
                        maxValue: 9999
                        id: insert10
                        texto: Data.valueTempoDesligaAr
                        registro: 20
                        x_txt: 270
                    }
                }

                Row{
                    spacing: 30
                    Text {
                        id: test20
                        text: "Atraso comporta (ms)"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }
                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: insert20
                        texto: Data.valueAtrasoPort
                        registro: 84
                        x_txt: insert10.x_txt
                    }
                }
                Row{
                    spacing: 30
                    Text {
                        id: test21
                        text: "Duração comporta (ms)"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }
                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: insert21
                        texto: Data.valueDuracaoPort
                        registro: 86
                        x_txt: insert10.x_txt
                    }
                }
                Row{
                    spacing: 30
                    Text {
                        id: txt_atrasoEst
                        text: "Atraso esticador (ms)"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }

                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: rec_atrasoEst
                        texto: Data.valueAtrasoEsticador
                        registro: 88
                        x_txt: insert10.x_txt
                    }
                }
                Row{
                    spacing: 30
                    Text {
                        id: test17
                        text: "Duração esticador (ms)"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }
                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: insert17
                        texto: Data.valueDurEsticador
                        registro: 90
                        x_txt: insert10.x_txt
                    }
                }

                Row{
                    spacing: 30
                    Text {
                        id: test06
                        text: "Tempo de corte (ms)"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }

                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: insert06
                        texto: Data.valueTempoCorte
                        registro: 12
                        x_txt: insert10.x_txt
                    }
                }
                Row{
                    spacing: 30
                    Text {
                        id: test07
                        text: "Atraso inicío (ms)"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }

                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: insert07
                        texto: Data.valueAtrasoInicio
                        registro: 14
                        x_txt: insert10.x_txt
                    }
                }

                Row{
                    spacing: 30
                    Text {
                        id: test09
                        text: "Tempo iniciar ar (ms)"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }

                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: insert09
                        texto: Data.valueTempoIniciarAr
                        registro: 18
                        x_txt: insert10.x_txt
                    }
                }

             /*   Row{
                    spacing: 30
                    visible: false
                    Text {
                        id: test22
                        text: "Parada tração extra (mm)"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }

                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: insert22
                        texto: Data.valueTempoIniciarAr
                        registro: 62
                        x_txt: insert10.x_txt
                    }
                }*/
            }
        }
        Page{
            id: pageEngTecnico2
            visible: false
            Column{
                x: 50
                spacing: 20
                Row{
                    spacing: 60
                    Text {
                        id: test01
                        text: "Posição selagem (mm)"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }

                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: insert01
                        texto: Data.valuePosSelag
                        registro: 2
                        x_txt: 270
                    }
                }
                Row{
                    spacing: 30
                    Text {
                        id: test02
                        text: "Veloc selagem fechar"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }
                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: insert02
                        texto: Data.valueVelocSelag
                        registro: 4
                        x_txt: insert01.x_txt
                    }
                }

                Row{
                    spacing: 30
                    Text {
                        id: test03
                        text: "Veloc selagem abrir"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }

                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: insert03
                        texto: Data.valueSelagVelocAbert
                        registro: 24
                        x_txt: insert01.x_txt
                    }
                }

                Row{
                    spacing: 30
                    Text {
                        id: test04
                        text: "Atraso tração (ms)"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }

                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: insert04
                        texto: Data.valueAtrasoTracao
                        registro: 8
                        x_txt: insert01.x_txt
                    }
                }

                Row{
                    spacing: 30
                    Text {
                        id: test05
                        text: "Atraso corte (ms)"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }

                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: insert05
                        texto: Data.valueAtrasoCorte
                        registro: 10
                        x_txt: insert01.x_txt
                    }
                }
                Row{
                    spacing: 30
                    Text {
                        id: test15
                        text:  "Início abertura (ms)"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }

                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: insert15
                        texto: Data.valueInicioAbertura
                        registro: 30
                        x_txt: insert01.x_txt
                    }
                }
                Row{
                    spacing: 30
                    Text {
                        id: test11
                        text: "Velocidade filme"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }
                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: insert11
                        texto: Data.valueVelocFilme
                        registro: 22
                        x_txt: insert01.x_txt
                    }
                }
                Row{
                    spacing: 30
                    Text {
                        id: test12
                        text:  "Tempo selagem (ms)"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }
                    TextBoxOpus {
                        minValue: 0
                        maxValue: 9999
                        id: insert12
                        texto: Data.valueTempoSelag
                        registro: 6
                        x_txt: insert01.x_txt
                    }
                }

                Row{
                    spacing: 30
                    Text {
                        id: test13
                        text: "Acc Selagem"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }

                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: insert13
                        texto: Data.valueAccSelag
                        registro: 26
                        x_txt: insert01.x_txt
                    }
                }

                Row{
                    spacing: 30
                    Text {
                        id: test14
                        text: "Dec selagem"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }

                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: insert14
                        texto: Data.valueDecSelag
                        registro: 28
                        x_txt: insert01.x_txt
                    }
                }

                Row{
                    spacing: 30
                    Text {

                        text: "Cilindro selagem"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                    }
                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        id: insert30
                        texto: Data.valueAvnCilindro
                        registro: 32
                        x_txt: insert01.x_txt
                    }
                }
                Row{

                    x: 0
                    y: 202
                    spacing: 210

                    Text {
                        id: labelSetUp
                        font.pointSize: Data.fontLabelSize
                        color: controlSetUp.checked ? "#667ab3" : "black"
                        font.family: "Arial"

                        Component.onCompleted: labelSetUp.text = "Set Up"
                    }

                    Switch{
                        id: controlSetUp
                        implicitHeight: 50
                        implicitWidth: 72

                        onReleased: {
                            if(controlSetUp.checked){
                                Data.envioRun = true
                                labelSetUp.text = "Set Up"
                                Task.enableDevice(36,5,true)
                                Data.setUpCtr = "ligado"
                                Data.envioRun = false

                            } else{
                                Data.envioRun = true
                                labelSetUp.text = "Set Up"
                                Task.enableDevice(36,5,false)
                                Data.setUpCtr = "apagado"
                                Data.envioRun = false
                            }
                        }
                        indicator: Rectangle{
                            implicitWidth: 72
                            implicitHeight: 30
                            radius: 15
                            color: controlSetUp.checked ? "#667ab3" : "#ffffff"
                            border.color: controlSetUp.checked ? "#cccccc" : "#667ab3"
                            border.width: 2

                            Rectangle {
                                x: controlSetUp.checked ? parent.width - width : 0
                                width: 30
                                height: 30
                                radius: 15
                                color: "#ffffff"
                                border.color: controlSetUp.checked ? "#cccccc" : "#667ab3"
                                border.width: 2
                            }
                        }
                        contentItem: Text {
                            text: controlSetUp.text
                            font: controlSetUp.font
                            //opacity: enabled ? 1.0 : 0.3
                            color: controlSetUp.down ? "#17a81a" : "#21be2b"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }
        }
        Page{
            id: pageDateTime
            visible: false
            Rectangle {
                width: 350
                height: 550
                y: 35
                x: 50
                Calendar {
                    id: calendario
                    width: (parent.width > parent.height ? parent.width * 0.6 - parent.spacing : parent.width)
                    height: (parent.height > parent.width ? parent.height * 0.6 - parent.spacing : parent.height)
                    frameVisible: true
                    weekNumbersVisible: true
                    selectedDate: new Date(2020, Data.valueDataMes - 1, Data.valueDataDia)
                    focus: true


                    onClicked:
                    {
                        sendSignal(112,selectedDate.getDate())
                        sendSignal(114,selectedDate.getMonth() + 1)
                        Task.enableDevice(37,1,true)
                        timerCal.running = true
                    }
                }
            }

            Label
            {
                id: labelHour
                text: Data.valueHora < 10 ? "0" + String(Data.valueHora) + " :" : String(Data.valueHora) + " :"
                font.pixelSize: 64
                font.family: "digital-7"
                x: 60
                y: 400
            }
            Label
            {
                id: labelMin
                text: Data.valueMin < 10 ? " 0" + String(Data.valueMin) : " " + String(Data.valueMin)
                font.pixelSize: 64
                font.family: "digital-7"
                anchors.left: labelHour.right
                anchors.top: labelHour.top
            }
            Rectangle {
                id: btn_upHour
                width: 60
                height: 25
                anchors.bottom: labelHour.top
                anchors.left: labelHour.left
                anchors.bottomMargin: 10

                Image {
                    id: imgUpHour
                    anchors.fill: parent
                    source: "CONTENTS/IMAGES/returnTwo.png"
                    asynchronous: true
                    sourceSize: Qt.size(width,height)

                }
                MouseArea {
                    anchors.fill: btn_upHour
                    hoverEnabled: true

                    onPressed: {
                        if(Number(labelHour.text.substring(0,2)) < 23)
                        {
                            if(Number(labelHour.text.substring(0,2)) < 9)
                            {
                                labelHour.text = "0" + String(Number(labelHour.text.substring(0,2)) + 1) + " :"
                            }
                            else
                            {
                                labelHour.text = String(Number(labelHour.text.substring(0,2)) + 1) + " :"
                            }
                        }
                        else
                        {
                            labelHour.text = "00 :"
                        }
                        sendSignal(116,labelHour.text.substring(0,2))
                        Task.enableDevice(37,1,true)
                        timerCal.running = true
                    }
                }
            }
            Rectangle {
                id: btn_downHour
                width: 60
                height: 25
                anchors.top: labelHour.bottom
                anchors.left: labelHour.left
                anchors.topMargin: 10

                Image {
                    id: imgDownHour
                    anchors.fill: parent
                    source: "CONTENTS/IMAGES/returnMenuOne.png"
                    asynchronous: true
                    sourceSize: Qt.size(width,height)
                }
                MouseArea {
                    anchors.fill: btn_downHour
                    hoverEnabled: true

                    onPressed: {
                        if(Number(labelHour.text.substring(0,2)) > 1)
                        {
                            if(Number(labelHour.text.substring(0,2)) <= 10)
                            {
                                labelHour.text = "0" + String(Number(labelHour.text.substring(0,2)) - 1) + " :"
                            }
                            else
                            {
                                labelHour.text = String(Number(labelHour.text.substring(0,2)) - 1) + " :"
                            }
                        }
                        else
                        {
                            labelHour.text = "23 :"
                        }
                        sendSignal(116,labelHour.text.substring(0,2))
                        Task.enableDevice(37,1,true)
                        timerCal.running = true
                    }
                }
            }
            Rectangle {
                id: btn_upMin
                width: 60
                height: 25
                anchors.bottom: labelMin.top
                anchors.left: labelMin.left
                anchors.bottomMargin: 10
                anchors.leftMargin: 20

                Image {
                    id: imgUpMin
                    anchors.fill: parent
                    source: "CONTENTS/IMAGES/returnTwo.png"
                    asynchronous: true
                    sourceSize: Qt.size(width,height)

                }
                MouseArea {
                    anchors.fill: imgUpMin
                    hoverEnabled: true

                    onPressed: {
                        if(Number(labelMin.text.substring(1,3)) < 59)
                        {
                            if(Number(labelMin.text.substring(1,3)) < 9)
                            {
                                labelMin.text = " 0" + String(Number(labelMin.text.substring(1,3)) + 1) + " "
                            }
                            else
                            {
                                labelMin.text = " " + String(Number(labelMin.text.substring(1,3)) + 1) + " "
                            }
                        }
                        else
                        {
                            labelMin.text = " 00"
                        }
                        sendSignal(118,labelMin.text.substring(1,3))
                        Task.enableDevice(37,1,true)
                        timerCal.running = true
                    }
                }
            }
            Rectangle {
                id: btn_downMin
                width: 60
                height: 25
                anchors.top: labelMin.bottom
                anchors.left: labelMin.left
                anchors.topMargin: 10
                anchors.leftMargin: 20

                Image {
                    id: imgDownMin
                    anchors.fill: parent
                    source: "CONTENTS/IMAGES/returnMenuOne.png"
                    asynchronous: true
                    sourceSize: Qt.size(width,height)
                }

                MouseArea {
                    anchors.fill: btn_downMin
                    hoverEnabled: true

                    onPressed: {
                        if(Number(labelMin.text.substring(1,3)) > 1)
                        {
                            if(Number(labelMin.text.substring(1,3)) <= 10)
                            {
                                labelMin.text = " 0" + String(Number(labelMin.text.substring(1,3)) - 1)
                            }
                            else
                            {
                                labelMin.text = " " + String(Number(labelMin.text.substring(1,3)) - 1)
                            }
                        }
                        else
                        {
                            labelMin.text = " 59"
                        }

                        sendSignal(118,labelMin.text.substring(1,3))
                        Task.enableDevice(37,1,true)
                        timerCal.running = true
                    }
                }
            }

            Rectangle {
                id: btn_update
                width: 70
                height: 70
                x: 300
                y: 400

                Image {
                    id: imgUpdate
                    anchors.fill: parent
                    source: "CONTENTS/IMAGES/usbDownload.png"
                    asynchronous: true
                    sourceSize: Qt.size(width,height)
                }
                MouseArea {
                    anchors.fill: imgUpdate
                    hoverEnabled: true
                    onPressed: {
                        popupUpdate.msgPopup = "Deseja realizar a atualização de software?"
                        popupUpdate.visible = true
                    }
                }
            }
        }

    }

    TabBar{
        y: 575
        x: -10
        id: tabBarEng
        currentIndex: swipe.currentIndex
        visible: Data.alarmActive ? false : true
        width: parent.width

        Flickable
        {
            flickDeceleration: 0.2
        }

        TabButton{
            id: tabDevices
            text: qsTr("Eng: 01")
            visible: true

            contentItem: Text {
                text: qsTr("Operador")
                font.family: "Arial"
                opacity: enabled ? 1.0 : 0.3
                color: tabDevices.checked ? "#667ab3" : "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 80
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: tabDevices.checked ? "white" : "#667ab3"
                border.color: tabDevices.checked ? "#667ab3": "white"
                border.width: 1
                radius: 2
            }
            width: 160
        }

        TabButton{
            id: tabControl
            text: qsTr("Supervisor")
            visible: Data.userLoginAdmin || Data.userLoginSuper ? true : false

            contentItem: Text {
                text: tabControl.text
                font.family: "Arial"
                opacity: enabled ? 1.0 : 0.3
                color: tabControl.checked ? "#667ab3" : "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 80
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: tabControl.checked ? "white" : "#667ab3"
                border.color: tabControl.checked ? "#667ab3": "white"
                border.width: 1
                radius: 2
            }
            width: 160
        }

        TabButton{
            id: tabOthers
            text: qsTr("Inobag")
            visible: Data.userLoginAdmin ? true : false

            contentItem: Text {
                text: tabOthers.text
                font.family: "Arial"
                opacity: enabled ? 1.0 : 0.3
                color: tabOthers.checked ? "#667ab3" : "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 80
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: tabOthers.checked ? "white" : "#667ab3"
                border.color: tabOthers.checked ? "#667ab3": "white"
                border.width: 1
                radius: 2
            }
            width: 160
        }
        TabButton{
            id: tabDateTime
            text: qsTr("Data/Hora")
            visible: Data.userLoginAdmin ? true : false

            contentItem: Text {
                text: tabDateTime.text
                font.family: "Arial"
                opacity: enabled ? 1.0 : 0.3
                color: tabDateTime.checked ? "#667ab3" : "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 80
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: tabDateTime.checked ? "white" : "#667ab3"
                border.color: tabDateTime.checked ? "#667ab3": "white"
                border.width: 1
                radius: 2
            }
            width: 160
        }
    }

    PopupSmall {
        id: popupSmallLoad

        width: parent.width
        height: parent.height

        visible: false

        z: 90

        onCancelClicked: {
            visible = false
        }

        onOkClicked: {
            visible = false
            Task.restoreParams()
            loaderEng.sourceComponent = compNull
            loaderEng.source = "EngFabrica01.qml"
        }
    }

    PopupSmall {
        id: popupUpdate

        width: parent.width
        height: parent.height

        visible: false

        z: 90

        onCancelClicked: {
            visible = false
        }

        onOkClicked: {
            visible = false
            Task.updateSoftware()
        }
    }

    PopupSmall {
        id: popupSmall

        width: parent.width
        height: parent.height

        visible: false

        z: 90

        onCancelClicked: {
            visible = false
        }

        onOkClicked: {
            visible = false
        }
    }

    Loader {
        id: loaderEng

        anchors.top: root.top
        anchors.left: root.left

        height: root.height-(footer.height+footer.height)
        width: root.width
        x: 20
        y: 80

    }

    Component { id: compNull; Item {} }
}





