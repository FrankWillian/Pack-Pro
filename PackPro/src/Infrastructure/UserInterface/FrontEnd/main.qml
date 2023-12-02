import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Window 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
//import com.opuspac.ihm 1.0
import QtQuick.FreeVirtualKeyboard 1.0  // QtFreeVirtualKeyboard

import "."

//ApplicationWindow {
Window {
    id: root

    visible: true
    //width: Screen.desktopAvailableWidthfgsg

    //height: Screen.desktopAvailableHeight
    width: 480
    height: 800

    property var statusMsg
    property string msgComp

    // Propriedades locais ou globais
    property date dateTime: new Date()


    Component.onCompleted: {
        loaderMain.sourceComponent = compNull

        loaderMain.sourceComponent = compLogo

        loaderMain.width = root.width


        /* Forço o VirtualKeyboard abrir como numerico */

        //inputPanel.pimpl.symbolModifier = true;
        //inputPanel.pimpl.shiftModifier = false;
    }

    function sendSignal (register, value)
    {
        Data.envioRun = true
        Task.writeParamt(Number(register),Number(value))
        Data.envioRun = false
    }

    function defaulLoader()
    {
        loaderMain.sourceComponent = compNull
        loaderMain.sourceComponent = compLogo
    }

    Connections {
        target: Task

        onReadyData:    Data.dataModBus = data
        onReadyMD0:     Data.valueContaSet = data
        onReadyMD1:     Data.valuePosSelag = data
        onReadyMD2:     Data.valueVelocSelag = data
        onReadyMD3:     Data.valueTempoSelag = data
        onReadyMD4:     Data.valueAtrasoTracao = data
        onReadyMD5:     Data.valueAtrasoCorte = data
        onReadyMD6:     Data.valueTempoCorte = data
        onReadyMD7:     Data.valueAtrasoInicio = data
        onReadyMD8:     Data.valuePosicaoFilme = data
        onReadyMD9:     Data.valueTempoIniciarAr = data
        onReadyMD10:    Data.valueTempoDesligaAr = data
        onReadyMD11:    Data.valueVelocFilme = data
        onReadyMD12:    Data.valueSelagVelocAbert = data
        onReadyMD13:    Data.valueAccSelag = data
        onReadyMD14:    Data.valueDecSelag = data
        onReadyMD15:    Data.valueInicioAbertura = data
        onReadyMD16:    Data.valueAvnCilindro = data
        onReadyMD17:    Data.valueDurEsteiraLonga = data

        onReadyMD28:    Data.valuetracaoCorte = data
        onReadyMD29:    Data.valueVersaoPLC = data



        onReadyMD30:    Data.valueTpoAtrasoInjetor = data

        onReadyMD31:    Data.valueExtra = data



        onReadyMD32:    Data.valueArEmbalagem = data
        onReadyMD33:    Data.valueTpoCortina = data
        onReadyMD34:    Data.valueAlarmeProd = data
        onReadyMD35:    Data.valueRoloSolto = data
        onReadyMD36:    Data.valueDurEsteiraCurta = data
        onReadyMD37:    Data.valueTpoAgrupador = data
        onReadyMD38:    Data.valueQtdAgrupador = data
        onReadyMD39:    Data.valueQtdEsteira = data
        onReadyMD40:    Data.valueQtdContador = data
        onReadyMD41:    Data.valueDesligaEsteira = data
        onReadyMD42:    Data.valueAtrasoPort = data
        onReadyMD43:    Data.valueDuracaoPort = data
        onReadyMD44:    Data.valueAtrasoEsticador = data
        onReadyMD45:    Data.valueDurEsticador = data
        onReadyMD46:    Data.valuePartidaEsteiraEnt = data
        onReadyMD47:    Data.valueParadaEsteira = data
        onReadyMD48:    Data.valueTopAtrasoExtrator = data

        // Somente leitura
        onReadyMD49:    Data.valueProdutiMedia = data
        onReadyMD50:    Data.valueContaGeral = data
        onReadyMD51:    Data.valueContaAtual = data
        onReadyMD52:    Data.valueInfoHrsEnerg = data
        onReadyMD53:    Data.valueInfoMinEnerg = data
        onReadyMD54:    Data.valueInfoHorasProd = data
        onReadyMD55:    Data.valueInfoMinProd = data
        onReadyMD56:    Data.valueDataDia = data
        onReadyMD57:    Data.valueDataMes = data
        onReadyMD58:    Data.valueHora = data
        onReadyMD59:    Data.valueMin = data
        onReadyMD60:    Data.valueVelocMedia = data
        onReadyTemp:    Data.valueCoreTemp = data
        onConexao:      Data.conexao = erro

        onReadyAlarm:
        {
            //print("Alarme gerado : "+data)
            if (data === "00") {
                Data.alarmActive = false
                popupAlarm.visible = false
            }
            else if(data === "07")
            {
                if(!Data.alarmActive){
                    Data.alarmActive = true
                    popupAlarm.msgTitulo = "Alarme 07 - Sistema de segurança ativado"
                    popupAlarm.msgPopup =   "1) Avalie se todas as portas de segurança estão fechadas .\n\n
2) Verifique se não houve uma obstrução na cortina de segurança.\n\n
3) Pressione o botão de RESET."
                    popupAlarm.visible = true
                }
            }
            else {
                Data.alarmActive = true
                switch(data) {
                case "01":
                    popupAlarm.msgTitulo = "Alarme 01 - Falha na leitura da fotocélula"
                    popupAlarm.msgPopup =   "1) Verifique se a embalagem possui seta/tarja e está alinhada ao centro da máquina.\n\n
2) O led OUT do sensor pisca quando a seta/tarja passa pela fibra óptica.\n\n
3) Faça a calibração do sensor de fotocélula."
                    break;
                case "02":
                    popupAlarm.msgTitulo = "Alarme 02 - Alarme de contagem"
                    popupAlarm.msgPopup = "1) Dois produtos inseridos na embalagem.\n"
                    break;
                case "03":
                    popupAlarm.msgTitulo = "Alarme 03 - Final da quantidade setada"
                    popupAlarm.msgPopup = "1) Resetar a contagem atual e reiniciar o ciclo.\n"
                    break;
                case "04":
                    popupAlarm.msgTitulo = "Alarme 04 - Presença de produto na selagem esquerdo"
                    popupAlarm.msgPopup =   "1) Verifique se há produto entre os mordentes.\n\n
2) Verifique se o produto é compatível com a embalagem.\n\n
3) Faça a calibração do sensor esquerdo."
                    break;
                case "05":
                    popupAlarm.msgTitulo =  "Alarme 05 - Falha no movimento de home"
                    popupAlarm.msgPopup =   "1) Verifique o funcionamento do motor de selagem e sensor de home.\n\n
2) Verifique se há travamento mecânico no conjunto de selagem.\n"
                    break;
                case "06":
                    popupAlarm.msgTitulo = "Alarme 06 - Presença de produto na selagem direito"
                    popupAlarm.msgPopup =   "1) Verifique se há produto entre os mordentes.\n\n
2) Verifique se o produto é compatível com a embalagem.\n\n
3) Faça a calibração do sensor direito."
                    break;
                case "08":
                    popupAlarm.msgTitulo = "Alarme 08 - Botão de emergência acionado"
                    popupAlarm.msgPopup =   "1) Gire o botão de emergência no sentido horário e solte-o.\n
2) Acione o botão RESET para limpar a falha.\n"
                    break;
                case "09":
                    popupAlarm.msgTitulo = "Alarme 09 - Falha no sensor de fim de selagem"
                    popupAlarm.msgPopup =   "1) Verifique se o mordente móvel está avançando até encostar no mordente quente, caso não esteja ajuste o parâmetro Posição de selagem.\n
2) Verifique o sensor de fim de selagem.\n"
                    break;
                case "10":
                    popupAlarm.msgTitulo = "Alarme 10 - Sensor esquerdo de segurança produto desativado"
                    popupAlarm.msgPopup =  "1) Verifique o funcionamento do sensor esquerdo de segurança do produto e faça a calibração do mesmo.\n"
                    break;
                case "11":
                    popupAlarm.msgTitulo = "Alarme 11 - Falha na impressora"
                    popupAlarm.msgPopup =  "1) Verifique o status do impresssor e faça as correções necessárias.\n"
                    break;
                case "12":
                    popupAlarm.msgTitulo = "Alarme 12 - Falha de temperatura"
                    popupAlarm.msgPopup =   "1) Aguarde que a temperatura no controlador se equalize.\n
2) Caso persista a falha, verifique o funcionamento do controlador de temperatura, relé de estado sólido, resistências e termopar.\n"
                    break;
                case "13":
                    popupAlarm.msgTitulo = "Alarme 13 - Objeto na Cortina"
                    popupAlarm.msgPopup = "1) Verifique a cortina de luz.\n"
                    break;
                case "14":
                    popupAlarm.msgTitulo = "Alarme 14 - Sensor direito de segurança produto desativado"
                    popupAlarm.msgPopup = "1) Verifique o funcionamento do sensor direito de segurança do produto e faça a calibração do mesmo.\n"
                    break;
                case "15":
                    popupAlarm.msgTitulo = "Alarme 15 - Reserva"
                    popupAlarm.msgPopup = "1) Reserva teste\n"
                    break;
                }
                popupAlarm.visible = true
            }
        }
    }

    // Titulo da Tela
    Rectangle{
        id: titulo
        x: 12
        y: 12
        color: "#667ab3"
        width: 455
        implicitHeight: 50
        opacity: 1
        border.color: "#667ab3"
        border.width: 2
        radius: 3

        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            color: "black"
            horizontalOffset: 4
            verticalOffset: 4
        }

        Text {
            id: tituloHome
            text: qsTr("HOME")
            color: "white"
            font.family: "Arial"
            font.pixelSize: 24
            opacity:  1
            anchors.centerIn: titulo
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
    }

    // Component para aparecer o Logo
    Component {
        id: compLogo

        Rectangle {
            anchors.centerIn: loaderMain
            width: root.width*0.8; height: root.height*0.8
            color: "transparent"

            Image {
                id: imgLogoInobag
                x: 117
                y: 90
                source: "qrc:/CONTENTS/IMAGES/logoInobag.png"
                fillMode: Image.PreserveAspectFit
                width: parent.width*0.4; height: parent.height*0.4
                sourceSize: Qt.size(width,height)
                asynchronous: true
            }

            Rectangle {
                id: btn_impressora
                width: 70
                height: 70
                x: btn_rolo.x
                y: btn_tracao.y + 100
                visible: Data.impressoraVisivel

                Image {
                    id: imgImpressora
                    anchors.fill: parent
                    source: "CONTENTS/IMAGES/printer.png"
                    sourceSize: Qt.size(width, height)
                    asynchronous: true
                }

                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        btn_impressora.scale = 0.95
                        btn_impressora.color = "transparent"
                    }

                    onReleased: {
                        btn_impressora.scale = 1.0
                        btn_impressora.color = "transparent"

                        loaderMain.width = root.width-(lvMenu.height)
                        loaderMain.source = "Impressora.qml"
                        tituloHome.text = qsTr("IMPRESSORA")
                        tituloHome.x = 120
                    }
                }
            }

            Rectangle {
                id: btn_rolo
                width: 70
                height: 70
                x: 370
                y: 30

                Image {
                    id: imgRolo
                    anchors.fill: parent
                    source: Data.valueRoloSolto === "20" ? "CONTENTS/IMAGES/lockNew.png" : "CONTENTS/IMAGES/unlock.png"
                    sourceSize: Qt.size(width, height)
                    asynchronous: true

                    Connections{
                        target: Task

                        onReadyMD35:
                        {
                            Data.valueRoloSolto = data
                            if(Data.valueRoloSolto === "10")
                            {
                                imgRolo.source = "CONTENTS/IMAGES/lockNew.png"

                            }
                            else
                            {
                                imgRolo.source = "CONTENTS/IMAGES/unlock.png"

                            }
                        }
                    }

                }
                MouseArea {
                    anchors.fill: btn_rolo
                    hoverEnabled: true

                    onPressed: {
                        if(Data.roloSolto == false)
                        {
                            Data.roloSolto = true
                            imgRolo.source = "CONTENTS/IMAGES/unlock.png"
                            Task.enableDevice(36,2,true)

                        }
                        else
                        {
                            Data.roloSolto = false
                            imgRolo.source = "CONTENTS/IMAGES/lockNew.png"
                            Task.enableDevice(36,2,false)

                        }
                    }
                }
            }
            Rectangle {
                x:btn_rolo.x
                y:btn_rolo.y + 100
                id: btn_tracao
                width: 70
                height: 70
                visible: Data.alarmActive ? false : true

                Image {
                    id: imgTracao
                    anchors.fill: parent
                    source: "CONTENTS/IMAGES/traction.png"
                    sourceSize: Qt.size(width, height)
                    asynchronous: true

                    Text {
                        id: textEscrito
                        font.pointSize: 10
                        font.family: "Arial"
                        font.bold: Font.Thin
                        color: "white"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignHCenter
                        anchors.centerIn: parent
                    }
                }

                MouseArea {
                    anchors.fill: btn_tracao
                    hoverEnabled: true

                    onPressed: {
                        imgTracao.source = "CONTENTS/IMAGES/tractionGreen.png"
                        Task.enableDevice(36,1,true)
                        timerTraction.start()
                    }

                    onReleased:{
                        imgTracao.source = "CONTENTS/IMAGES/traction.png"
                        Task.enableDevice(36,1,false)
                    }

                    onExited: {
                        imgTracao.source = "CONTENTS/IMAGES/traction.png"
                        Task.enableDevice(36,1,false)
                    }
                }
            }
            Timer {
               id: timerTraction
               interval: 5000
               onTriggered: {
                         imgTracao.source = "CONTENTS/IMAGES/traction.png"
                         Task.enableDevice(36,1,false)
                         }
               }

            Row {
                x: 0
                //y: 480
                y: inputPosFilme.activeFocus && inputPanel.y < 600 ? inputPanel.y - 150 : 480
                spacing: 150

                Row{
                    spacing: 5

                    Text {
                        opacity:  1
                        y: 28
                        color: rec_SetConta.y > 500 ? Paleta.fontLabel : "transparent"
                        font.family: Data.fontFamily
                        font.pointSize: Data.fontLabelSize
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                        text: qsTr("Posição Filme:")
                    }
                    Rectangle{
                        id: posFilme
                        y: 25
                        width: 80
                        height: 30
                        border.width: 2
                        border.color: rec_SetConta.y > 500 ? "#667ab3" : "transparent"
                        color: "transparent"
                        radius: 4
                        TextInput {
                            id: inputPosFilme
                            anchors.fill: posFilme
                            font.family: Data.fontFamily
                            font.pointSize: Data.fontLabelSize
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            echoMode: TextInput.Normal
                            color: rec_SetConta.y > 500 ? "black" : "transparent"
                            /* Configura para abrir o teclado virtual na opção numerico */
                            inputMethodHints: Qt.ImhPreferNumbers | Qt.ImhDigitsOnly | Qt.ImhFormattedNumbersOnly;
                            text: Data.valuePosicaoFilme
                            validator: RegExpValidator { regExp: /(\d{1,4})(\n)/}

                            onEditingFinished:  {
                                sendSignal(16, Number(inputPosFilme.text))
                            }
                            onTextChanged: {
                                var n = text.search("\n")
                                if(n >= 0)
                                {
                                    text = text.substring(0,text.length - 1)
                                    sendSignal(16, Number(inputPosFilme.text))
                                }
                            }
                            onFocusChanged: {
                                if(focus === false)
                                {
                                    if(text == "") { text = Data.valuePosicaoFilme }
                                    sendSignal(16, Number(inputPosFilme.text))
                                }
                                else
                                {
                                    text = ""
                                }
                            }
                        }
                    }
                }

               /* Rectangle {
                    id: btn_tracao
                    width: 70
                    height: 70
                    visible: Data.alarmActive ? false : true

                    Image {
                        id: imgTracao
                        anchors.fill: parent
                        source: "CONTENTS/IMAGES/traction.png"
                        sourceSize: Qt.size(width, height)
                        asynchronous: true

                        Text {
                            id: textEscrito
                            font.pointSize: 10
                            font.family: "Arial"
                            font.bold: Font.Thin
                            color: "white"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignHCenter
                            anchors.centerIn: parent
                        }
                    }

                    MouseArea {
                        anchors.fill: btn_tracao
                        hoverEnabled: true

                        onPressed: {
                            imgTracao.source = "CONTENTS/IMAGES/tractionGreen.png"
                            Task.enableDevice(36,1,true)
                            timerTraction.start()
                        }

                        onReleased:{
                            imgTracao.source = "CONTENTS/IMAGES/traction.png"
                            Task.enableDevice(36,1,false)
                        }

                        onExited: {
                            imgTracao.source = "CONTENTS/IMAGES/traction.png"
                            Task.enableDevice(36,1,false)
                        }
                    }
                }*/

               /*Timer {
                    id: timerTraction
                    interval: 5000
                    onTriggered: {
                        imgTracao.source = "CONTENTS/IMAGES/traction.png"
                        Task.enableDevice(36,1,false)
                    }
                }*/
            }

            /*Rectangle {
                visible: false
                x: 90
                y: 505

                implicitWidth: 180
                implicitHeight: 36
                color: "#667ab3"
                radius: 2

                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    color: "black"
                    horizontalOffset: 1
                    verticalOffset: 1
                }

                Text {
                    font.family: "Arial"
                    opacity:  1
                    color:  "white"
                    anchors.centerIn: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                    text: qsTr("Conta")
                }
            }*/

            Text {
                id:textoSet
                x:90
                opacity:  1
                y: txtInt_conta.activeFocus && inputPanel.y < 600 ? inputPanel.y - 150 : 569
                color: Paleta.fontLabel
                font.family: Data.fontFamily
                font.pointSize: Data.fontLabelSize
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                text: qsTr("Set:")

                Behavior on y {
                    NumberAnimation { easing.type: Easing.InBack; easing.amplitude: 5.0; easing.period: 19.0; duration: 510 }
                }
            }
            Rectangle{
                id: rec_SetConta
                //y: 565
                y: txtInt_conta.activeFocus && inputPanel.y < 600 ? inputPanel.y - 150 : 565
                //y:textoSet + 100
                x: textoSet.x + 40
                width: 80
                height: 30
                border.width: 2
                border.color: "#667ab3"
                color: "transparent"
                radius: 4

                TextInput {
                    id: txtInt_conta
                    anchors.fill: rec_SetConta
                    font.pointSize: Data.fontLabelSize
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    echoMode: TextInput.Normal
                    color: "black"
                    /* Configura para abrir o teclado virtual na opção numerico*/
                    inputMethodHints: Qt.ImhPreferNumbers | Qt.ImhDigitsOnly | Qt.ImhFormattedNumbersOnly;
                    text: Data.valueContaSet
                    validator: IntValidator {bottom: 0; top: 9999}

                    onEditingFinished:  {
                        if(Number(text) < 0) { text = "0" }
                        if(Number(text) > 9999) { text = "9999" }
                        sendSignal(0, Number(text))
                    }

                    onFocusChanged: {
                        if(focus === false)
                        {
                            if(text == "") { text = Data.valueContaSet}
                            if(Number(text) < 0) { text = "0" }
                            if(Number(text) > 9999) { text = "9999" }
                            sendSignal(0, Number(text))
                        }
                        else
                        {
                            text = ""
                        }
                    }

                    onDisplayTextChanged:
                    {
                        var n = text.search("\n")
                        if(n >= 0)
                        {
                            text = text.substring(0,text.length - 1)
                            if(text == "") { text = Data.valueContaSet}
                            if(Number(text) < 0) { text = "0" }
                            if(Number(text) > 9999) { text = "9999" }
                            sendSignal(0, Number(text))
                        }
                    }
                }
            }

            Text {
                id: labelContaAtual
                width: 37
                y: btn_zeraConta.y + 30
                x: 225
                color: Paleta.fontLabel
                font.family: Data.fontFamily
                font.pointSize: Data.fontLabelSize
                font.bold: Font.Thin
                horizontalAlignment: Text.AlignLeft
                text: qsTr("Atual:")
            }
            Text {
                id: inputContaAtual
                y: btn_zeraConta.y + 30
                x: labelContaAtual.x + 65
                color: Paleta.fontValue
                font.family: Data.fontFamily
                font.pointSize: Data.fontLabelSize
                font.bold: Font.Thin
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignHCenter
                text: Data.valueContaAtual
            }

            Rectangle {
                id: btn_zeraConta
                width: 70
                height: 70
                y: 540
                x: btn_tracao.x
                visible: Data.alarmActive ? false : true

                Image {
                    id: imgZera
                    anchors.fill: parent
                    source: "CONTENTS/IMAGES/resetNew.png"
                    sourceSize: Qt.size(width, height)
                    asynchronous: true

                }
                MouseArea {
                    anchors.fill: btn_zeraConta
                    hoverEnabled: true

                    onPressed: {
                        popupSmall1.visible = true
                        popupSmall1.msgPopup = "Deseja realmente zerar os valores?"
                    }
                }
            }
        }
    }

    PopupSmall {
        id: popupSmall1

        width: parent.width*2.8
        height: parent.height*1.2

        y:  parent.height*0.12
        x:  parent.height*0.05

        visible: false

        z: 90

        onCancelClicked: {
            Task.enableDevice(36,0,true)
            popupSmall1.visible = false
        }

        onOkClicked: {
            Task.enableDevice(36,0,false)
            popupSmall1.visible = false
            popupTimer.running = true
        }

        Timer{
            id: popupTimer
            interval: 300
            running: false
            repeat: false
            onTriggered: Task.enableDevice(36,0,true)
        }

    }

    // Component para limpar Loader
    Component { id: compNull; Item {} }

    // Tela com cor random de fundo apenas para testes de carregando dinamico com Loader
    Component {
        id: compBlank

        Rectangle {
            anchors.centerIn: loaderMain
            width: root.width*0.8; height: root.height*0.8
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)

            Text {
                anchors.centerIn: parent
                font.pointSize: 40
                color: "white"
                text: msgComp
            }
        }
    }

    // Componente de cada menu
    Component {
        id: itemsMenu
        Row{

            Rectangle {
                id: rectItem
                width: 70
                height: 70
                radius: 4
                color: "transparent"

                Image {
                    id: icon
                    anchors.fill: rectItem
                    source: iconPath
                    width: 70; height: 70

                    sourceSize: Qt.size(width, height)
                    asynchronous: true
                }

                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        rectItem.scale = 0.95
                        rectItem.color = "transparent"
                    }

                    onReleased: {
                        rectItem.scale = 1.0
                        rectItem.color = "transparent"

                        if(!Data.alarmActive){

                            if (name == "Home")
                            {
                                loaderMain.sourceComponent = compNull
                                loaderMain.sourceComponent = compLogo
                                loaderMain.width = root.width
                                tituloHome.text = qsTr("HOME")
                                tituloHome.x = 200
                                if(Data.userLoginSuper === true){
                                    Data.userLoginSuper = false
                                    Data.nameLoginCarregado = ""
                                }
                            }

                            else if (name == "")
                            {

                                var compPopup = Qt.createComponent("Popup.qml");
                                loaderMain.width = root.width-(lvMenu.width+lvMenu.spacing*2)
                                loaderMain.sourceComponent = compPopup
                                loaderMain.item.msgTitulo = "Titulo"
                                loaderMain.item.msgPopup = "Lorem Ipsum sobreviveu não só a cinco \
                             séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado."
                                loaderMain.item.onCancelClicked.connect( defaulLoader )
                                loaderMain.item.onOkClicked.connect( defaulLoader )


                                /*
                            for (var i=0; i<5; i++) {
                                var object = component.createObject(container);
                                object.x = (object.width + 10) * i;
                            }
                            */

                            }
                            else if (name == "Arquivos")
                            {
                                loaderMain.width = root.width-(lvMenu.height)
                                loaderMain.source = "Arquivos.qml"
                                tituloHome.text = qsTr("FORMATOS")
                                tituloHome.x = 150
                            }
                            else if (name == "AlarmView")
                            {
                                loaderMain.width = root.width-(lvMenu.height)
                                loaderMain.source = "AlarmView.qml"
                                tituloHome.text = qsTr("ALARMES")
                                tituloHome.x = 150
                            }
                            else if (name == "Engenharia")
                            {
                                loaderMain.width = root.width-(lvMenu.height)
                                loaderMain.source = "EngFabrica01.qml"
                                tituloHome.text = qsTr("ENGENHARIA")
                                tituloHome.x = 120

                            }

                            else if (name == "Info")
                            {
                                loaderMain.width = root.width-(lvMenu.height)
                                loaderMain.source = "Informacao.qml"
                                tituloHome.text = qsTr("INFORMAÇÃO")
                                tituloHome.x = 120

                            }

                            /*
                        else if (name == "Engenharia")
                        {
                            loaderMain.width = root.width-(lvMenu.width+lvMenu.spacing*2)
                            loaderMain.source = "ModbusIO.qml"
                        }
                        */
                            else {
                                msgComp = index
                                loaderMain.width = root.width-(lvMenu.width+lvMenu.spacing*2)
                                loaderMain.sourceComponent = compNull
                                loaderMain.sourceComponent = compBlank
                            }
                        }
                    }
                }
            }
        }
    }

    // ListView do Menu lateral esquerdo
    ListView {
        id: lvMenu
        anchors.bottom: footer.top
        x: 15
        anchors.margins: 5
        z: 90
        width: 450
        height: 70
        cacheBuffer: 5
        clip: true
        spacing: 25
        orientation: ListView.Horizontal

        //model: 10

        model: MenuModel {}
        delegate: itemsMenu
    }

    // Loader: Responsavel por carregar qualquer conteudo (Componente, .QML) no centro da aplicação
    Loader {
        id: loaderMain

        anchors.top: root.top
        anchors.left: root.left

        height: root.height-(footer.height+footer.height)
        width: root.width
        x: 20
        y: 80

    }

    // Popup dos Alarmes
    PopupAlarm {
        id: popupAlarm

        width: parent.width
        height: parent.height

        visible: false

        z: 90

        onCancelClicked: {
            // Só deixo fechar se não ocorrer mais alarme
            if (!Data.alarmActive) {
                popupAlarm.visible = false
            }
        }

        onOkClicked: {
            // Só deixo fechar se não ocorrer mais alarme
            if (!Data.alarmActive) {
                popupAlarm.visible = false
            }
        }
    }

    PopupSmall {
        id: popupSmall

        width: parent.width*2.8
        height: parent.height*1.2

        y:  parent.height*0.12
        x:  parent.height*0.05

        visible: false

        z: 81

        onCancelClicked: {
            Data.nameLoginDigitado = ""
            Data.passwordDigitado = ""
            Data.nameLoginCarregado = ""
            Data.userLoginAdmin = false
            Data.userLoginSuper = false
            popupSmall.visible = false
        }

        onOkClicked: {
            Data.nameLoginDigitado = ""
            Data.passwordDigitado = ""
            Data.nameLoginCarregado = ""
            Data.userLoginAdmin = false
            Data.userLoginSuper = false
            popupSmall.visible = false
        }
    }

    // Popup dos Alarmes
    LoginUser {
        id: popupLogin

        width: parent.width*2.1
        height: parent.height*1
        y:  parent.height*0.12
        x:  parent.height*0.05

        visible: false

        z: 80

        onCancelClicked: {
            popupLogin.visible = false
            inputPanel.state = ""
        }

        onLogin: {

            if(Data.nameLoginDigitado == Data.nameLoginAdmin && Data.passwordDigitado == Data.passwordAdmin){
                popupLogin.visible = false
                Data.nameLoginDigitado = ""
                Data.passwordDigitado = ""
                Data.nameLoginCarregado = Data.nameLoginAdmin
                Data.userLoginAdmin = true
                Data.userLoginSuper = false
                //Recarrega a página para não ficar com o column desalinhado
                loaderMain.sourceComponent = compNull
                loaderMain.source = "EngFabrica01.qml"
                inputPanel.state = ""
            }
            else if(Data.nameLoginDigitado == Data.nameLoginSuper && Data.passwordDigitado == Data.passwordSuper){
                popupLogin.visible = false
                Data.nameLoginDigitado = ""
                Data.passwordDigitado = ""
                Data.nameLoginCarregado = Data.nameLoginSuper
                Data.userLoginSuper = true
                Data.userLoginAdmin = false
                //Recarrega a página para não ficar com o column desalinhado
                loaderMain.sourceComponent = compNull
                loaderMain.source = "EngFabrica01.qml"
                inputPanel.state = ""
            }
            else
            {
                popupSmall.visible = true
                popupSmall.msgPopup = "Usuário ou senha incorreto, tente novamente"
                Data.passwordDigitado = ""
                Data.nameLoginDigitado = ""
                inputPanel.state = ""
                popupLogin.visible = false

            }
        }

        onLogOut: {
            Data.nameLoginCarregado = ""
            Data.userLoginAdmin = false
            Data.userLoginSuper = false
            Data.nameLoginDigitado = ""
            Data.passwordDigitado = ""
            popupLogin.visible = false
            loaderMain.sourceComponent = compNull
            loaderMain.source = "EngFabrica01.qml"
            inputPanel.state = ""
        }
    }

    // Rodape
    Rectangle {
        id: footer
        width: root.width
        height: 20
        anchors.bottom: parent.bottom
        color: Paleta.bgFooter
        x: 10

        property int rodapeFontLabelSize: 12
        property int rodapeFontValueSize: 10


        Row{
            spacing: 40
            Row {
                spacing: 5
                // Data e hora
                Text {
                    color: Paleta.fontLabelFooter
                    font.pointSize: footer.rodapeFontLabelSize
                    font.bold: Font.Thin
                    font.family: "Arial"
                    text: "Data:"
                }

                Text {
                    id: labelDateTime
                    color: Paleta.fontValueFooter
                    font.pointSize: footer.rodapeFontValueSize
                    font.bold: Font.Thin
                    font.family: "Arial"
                    text: Data.valueDataDia+ " / " + Data.valueDataMes
                }

                Text {
                    color: Paleta.fontLabelFooter
                    font.pointSize: footer.rodapeFontLabelSize
                    font.bold: Font.Thin
                    font.family: "Arial"
                    text: " Hora:"
                }

                Text {
                    color: Paleta.fontValueFooter
                    font.pointSize: footer.rodapeFontValueSize
                    font.bold: Font.Thin
                    font.family: "Arial"
                    text:  Number(Data.valueMin) < 10 ? Data.valueHora + " : 0"+ Data.valueMin : Data.valueHora + " : "+ Data.valueMin
                }
            }

            Row{
                Text {
                    id: labelConexao
                    color: Paleta.fontLabelFooter
                    font.pointSize: footer.rodapeFontLabelSize
                    font.bold: Font.Thin
                    font.family: "Arial"
                    text: Data.conexao
                }
            }

            // Versao
            Row {
                spacing: 10

                Text {
                    id: labelVersion
                    color: Paleta.fontLabelFooter
                    font.pointSize: footer.rodapeFontLabelSize
                    font.bold: Font.Thin
                    font.family: "Arial"
                    text: qsTr("Versão:")
                }
                Text {
                    id: valueVersion
                    anchors.bottom: parent.bottom
                    color: Paleta.fontValueFooter
                    font.pointSize: footer.rodapeFontValueSize
                    font.bold: Font.Thin
                    font.family: "Arial"
                    text: Data.version
                }
            }

        }

    }

    Timer {
        id: timer
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            root.dateTime = new Date()
        }
    }

    InputPanel {
        id: inputPanel
        z: 99
        y: root.height
        height: 250
        smooth: false
        anchors.left: parent.left
        anchors.right: parent.right

        states: State {
            name: "visible"
            when: Qt.inputMethod.visible
            PropertyChanges {
                target: inputPanel
                y: root.height - inputPanel.height

            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 400
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }

    Timer{

        id: timerTextInput
        interval: 20000
        running: inputPanel.state == "visible"
        repeat: false
        onTriggered: {
            inputPanel.state = ""
        }
    }
}
