import QtQuick 2.6
//import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
//import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
//import QtQuick.FreeVirtualKeyboard 1.0
import QtQml 2.2
import "."



Item {
    id: root
    property int tamRetanDesc: 300
    property int alturaRetangDesc: 32
    property string corBordaRetanDesc: "transparent"
    //property string corBordaRetanDesc:  "#667ab3" // Só para desenvolvimento

    Component.onCompleted: {

        if(Data.esteiraCtr == "ligado"){
            controlEsteira.checked = true
        }
        if(Data.esteiraEntCtr == "ligado"){
            controlEsteiraEnt.checked = true
        }

        //  if(Data.agrupadorCtr == "ligado"){
        //     controlAgrupador.checked = true
        // }
        //if(Data.agrupadorCtrEst == "ligado"){
        //  controlAgrupadorEst.checked = true
        //}
        if(Data.esticadorCtr == "ligado"){
            controlEsticador.checked = true
        }
        if(Data.portCtr == "ligado"){
            controlPortinhola.checked = true
        }
        if(Data.sensorExtCtr == "ligado"){
            controlsensorExt.checked = true
        }
        if(Data.injetorExterno == "ligado"){
            controlInjec.checked = true
        }
        if(Data.extra == "ligado"){
            controlExtra.checked = true
        }
        if(Data.smartCountCtr == "ligado"){
            controlSmartCount.checked = true
        }
        if(Data.pickCountCtr == "ligado"){
            controlPick.checked = true
        }////Tracao/Corte Tempo
        if(Data.tracaoCorteCtr == "ligado"){
            controlTracaoCorte.checked = true
        }
    }

    function sendSignal (register, value)
    {
        Data.envioRun = true
        Task.writeParamt(Number(register),Number(value))
        Data.envioRun = false
    }


    Rectangle {
        id:retanPrincipal
        width: 440
        height: 550
        x:0
        y:15
        border.color:corBordaRetanDesc
        border.width: 2
        color: "#00000000"
        Column{
            y: 0
            x: 0
            spacing: 10
            Row {// esteira entrada
                id:fila_1
                y: 0
                x: 0
                spacing: -2
                Rectangle{
                    x:0
                    y:0
                    id:fila_1_Retangulo_1
                    width: tamRetanDesc
                    height: alturaRetangDesc
                    border.color:corBordaRetanDesc
                    border.width: 2
                    color: "#00000000"
                    Text {
                        x:2
                        // y:4.75
                        text: "Esteira Entrada"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                        anchors.verticalCenter: parent.verticalCenter
                        //anchors.centerIn: parent
                        horizontalAlignment:Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    Switch{
                        y: alturaRetangDesc/2 - 16
                        x: tamRetanDesc - 74
                        id: controlEsteiraEnt
                        implicitHeight: 50
                        implicitWidth: 72
                        onReleased: {
                            if(controlEsteiraEnt.checked){
                                Data.envioRun = true
                                Task.enableDevice(36,6,true)
                                Data.esteiraEntCtr = "ligado"
                                Data.envioRun = false

                            } else{
                                Data.envioRun = true
                                Task.enableDevice(36,6,false)
                                Data.esteiraEntCtr = "apagado"
                                Data.envioRun = false
                            }
                        }
                        indicator: Rectangle{
                            implicitWidth: 72
                            implicitHeight: 32
                            radius: 16
                            color: controlEsteiraEnt.checked ? "#667ab3" : "#ffffff"
                            border.color: controlEsteiraEnt.checked ? "#667ab3" : "#979696"
                            border.width: 2

                            Rectangle {
                                x: controlEsteiraEnt.checked ? parent.width - width : 0
                                width: 32
                                height: 32
                                radius: 16
                                color: "white"
                                border.color: "#999999"
                                border.width: 2
                            }
                        }
                        contentItem: Text {
                            text: controlEsteiraEnt.text
                            font: controlEsteiraEnt.font
                            color: controlEsteiraEnt.down ? "#17a81a" : "#21be2b"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }
            Row {//esteira saida
                id:fila_2
                y: 0
                x: 0
                spacing: 2
                Rectangle{
                    x:0
                    y:0
                    id:fila_2_Retangulo_1
                    width: tamRetanDesc
                    height: alturaRetangDesc
                    border.color:corBordaRetanDesc
                    border.width: 2
                    color: "#00000000"
                    Text {
                        x:2
                        //y:4.75
                        text: "Esteira Saída"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                        anchors.verticalCenter: parent.verticalCenter
                        //anchors.centerIn: parent
                        horizontalAlignment:Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    Switch{
                        id: controlEsteira
                        implicitHeight: 50
                        implicitWidth: 72
                        y: alturaRetangDesc/2 - 16
                        x: tamRetanDesc - 74
                        onReleased: {
                            if(controlEsteira.checked){
                                Data.envioRun = true
                                Task.enableDevice(36,7,true)
                                Data.esteiraCtr = "ligado"
                                Data.envioRun = false
                            } else{
                                Data.envioRun = true
                                Task.enableDevice(36,7,false)
                                Data.esteiraCtr = "apagado"
                                Data.envioRun = false

                            }
                        }
                        indicator: Rectangle{
                            implicitWidth: 70
                            implicitHeight: 32
                            radius: 16
                            color: controlEsteira.checked ? "#667ab3" : "#ffffff"
                            border.color: controlEsteira.checked ? "#667ab3" : "#979696"
                            border.width: 2

                            Rectangle {
                                x: controlEsteira.checked ? parent.width - width : 0
                                width: 32
                                height: 32
                                radius: 16
                                color: "white"
                                border.color: "#999999"
                                border.width: 2
                            }
                        }
                        contentItem: Text {
                            text: controlEsteira.text
                            font: controlEsteira.font
                            //opacity: enabled ? 1.0 : 0.3
                            color: controlEsteira.down ? "#17a81a" : "#21be2b"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
                Rectangle{
                    // y: fila_2.y
                    // x: tamRetanDesc + 2
                    id: rec_est
                    width: 72
                    height: alturaRetangDesc
                    border.width: 2
                    border.color: "transparent"
                    color: "transparent"
                    radius: 4

                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        heightValue: rec_est.height
                        id: input_est
                        texto: Data.valueQtdEsteira
                        registro: 78
                    }
                }
            }
            Row {//Esticador
                id:fila_3
                y: 0
                x: 0
                spacing: -2
                Rectangle{
                    x:0
                    y:0
                    id:fila_3_Retangulo_1
                    width: tamRetanDesc
                    height: alturaRetangDesc
                    border.color:corBordaRetanDesc
                    border.width: 2
                    color: "#00000000"
                    Text {
                        x:2
                        //y:4.75
                        text: "Esticador"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                        anchors.verticalCenter: parent.verticalCenter
                        //anchors.centerIn: parent
                        horizontalAlignment:Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    Switch{
                        id: controlEsticador
                        implicitHeight: 50
                        implicitWidth: 72
                        y: alturaRetangDesc/2 - 16
                        x: tamRetanDesc - 74
                        onReleased: {
                            if(controlEsticador.checked){
                                Data.envioRun = true
                                Task.enableDevice(37,0,true)
                                Data.esticadorCtr = "ligado"
                                Data.envioRun = false

                            } else{
                                Data.envioRun = true
                                Task.enableDevice(37,0,false)
                                Data.esticadorCtr = "apagado"
                                Data.envioRun = false
                            }
                        }
                        indicator: Rectangle{
                            implicitWidth: 70
                            implicitHeight: 32
                            radius: 16
                            color: controlEsticador.checked ? "#667ab3" : "#ffffff"
                            border.color: controlEsticador.checked ? "#667ab3" : "#979696"
                            border.width: 2

                            Rectangle {
                                x: controlEsticador.checked ? parent.width - width : 0
                                width: 32
                                height: 32
                                radius: 16
                                color: "white"
                                border.color: "#999999"
                                border.width: 2
                            }
                        }
                        contentItem: Text {
                            text: controlEsticador.text
                            font: controlEsticador.font
                            //opacity: enabled ? 1.0 : 0.3
                            color: controlEsticador.down ? "#17a81a" : "#21be2b"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }
            Row {//Tracao/Corte Tempo
                //visible: false
                id:fila_4
                y: 0
                x: 0
                spacing: 2
                Rectangle{
                    x:0
                    y:0
                    id:fila_4_Retangulo_1
                    width: tamRetanDesc
                    height: alturaRetangDesc
                    border.color:corBordaRetanDesc
                    border.width: 2
                    color: "#00000000"
                    Text {
                        x:2
                        //y:4.75
                        text: "Tração e corte"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                        anchors.verticalCenter: parent.verticalCenter
                        //anchors.centerIn: parent
                        horizontalAlignment:Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    Switch{
                        y: alturaRetangDesc/2 - 16
                        x: tamRetanDesc - 74
                        id: controlTracaoCorte
                        implicitHeight: 50
                        implicitWidth: 72
                        onReleased: {
                            if(controlTracaoCorte.checked){
                                Data.envioRun = true
                                Task.enableDevice(37,4,false)
                                Data.extra = "apagado"
                                controlExtra.checked = false
                                Task.enableDevice(37,5,true)
                                Data.tracaoCorteCtr = "ligado"
                                Data.envioRun = false

                            } else{
                                Data.envioRun = true
                                Task.enableDevice(37,5,false)
                                Data.tracaoCorteCtr = "apagado"
                                Data.envioRun = false
                            }
                        }
                        indicator: Rectangle{
                            implicitWidth: 70
                            implicitHeight: 32
                            radius: 16
                            color: controlTracaoCorte.checked ? "#667ab3" : "#ffffff"
                            border.color: controlTracaoCorte.checked ? "#667ab3" : "#979696"
                            border.width: 2

                            Rectangle {
                                x: controlTracaoCorte.checked ? parent.width - width : 0
                                width: 32
                                height: 32
                                radius: 16
                                color: "white"
                                border.color: "#999999"
                                border.width: 2
                            }
                        }
                        contentItem: Text {
                            text: controlTracaoCorte.text
                            font: controlTracaoCorte.font
                            //opacity: enabled ? 1.0 : 0.3
                            color: controlTracaoCorte.down ? "#17a81a" : "#21be2b"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
                Rectangle{
                    // y: fila_2.y
                    // x: tamRetanDesc + 2
                    id: rec_tracCort
                    width: 72
                    height: alturaRetangDesc
                    border.width: 2
                    border.color: "transparent"
                    color: "transparent"
                    radius: 4

                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        heightValue: rec_tracCort.height
                        id: input_tracCort
                        texto: Data.valuetracaoCorte
                        registro: 56
                    }
                }
            }
            Row {//Selagem Inferior
                id:fila_5
                y: 0
                x: 0
                spacing: 2
                Rectangle{
                    x:0
                    y:0
                    id:fila_5_Retangulo_1
                    width: tamRetanDesc
                    height: alturaRetangDesc
                    border.color:corBordaRetanDesc
                    border.width: 2
                    color: "#00000000"
                    Text {
                        x:2
                        //y:4.75
                        text: "Selagem Inferior"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                        anchors.verticalCenter: parent.verticalCenter
                        //anchors.centerIn: parent
                        horizontalAlignment:Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    Switch{
                        y: alturaRetangDesc/2 - 16
                        x: tamRetanDesc - 74
                        id: controlExtra
                        implicitHeight: 50
                        implicitWidth: 72
                        onReleased: {
                            if(controlExtra.checked){
                                Data.envioRun = true
                                Task.enableDevice(37,5,false)
                                Data.tracaoCorteCtr = "apagado"
                                controlTracaoCorte.checked = false
                                Task.enableDevice(37,4,true)
                                Data.extra = "ligado"
                                Data.envioRun = false

                            } else{
                                Data.envioRun = true
                                Task.enableDevice(37,4,false)
                                Data.extra = "apagado"
                                Data.envioRun = false
                            }
                        }
                        indicator: Rectangle{
                            implicitWidth: 70
                            implicitHeight: 32
                            radius: 16
                            color: controlExtra.checked ? "#667ab3" : "#ffffff"
                            border.color: controlExtra.checked ? "#667ab3" : "#979696"
                            border.width: 2

                            Rectangle {
                                x: controlExtra.checked ? parent.width - width : 0
                                width: 32
                                height: 32
                                radius: 16
                                color: "white"
                                border.color: "#999999"
                                border.width: 2
                            }
                        }
                        contentItem: Text {
                            text: controlExtra.text
                            font: controlExtra.font
                            //opacity: enabled ? 1.0 : 0.3
                            color: controlExtra.down ? "#17a81a" : "#21be2b"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
                Rectangle{
                    // y: fila_2.y
                    // x: tamRetanDesc + 2
                    id: rec_extra
                    width: 72
                    height: alturaRetangDesc
                    border.width: 2
                    border.color: "transparent"
                    color: "transparent"
                    radius: 4

                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        heightValue: rec_extra.height
                        id: input_extra
                        texto: Data.valueExtra
                        registro: 62
                    }
                }
            }
            Row {//SmartCount
                id:fila_6
                visible: false
                y: 0
                x: 0
                spacing: -2
                Rectangle{
                    x:0
                    y:0
                    id:fila_6_Retangulo_1
                    width: tamRetanDesc
                    height: alturaRetangDesc
                    border.color:corBordaRetanDesc
                    border.width: 2
                    color: "#00000000"
                    Text {
                        x:2
                        //y:4.75
                        text: "SmartCount"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                        anchors.verticalCenter: parent.verticalCenter
                        //anchors.centerIn: parent
                        horizontalAlignment:Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    Switch{
                        y: alturaRetangDesc/2 - 16
                        x: tamRetanDesc - 74
                        id: controlSmartCount
                        implicitHeight: 50
                        implicitWidth: 72
                        onReleased: {
                            if(controlSmartCount.checked){
                                Data.envioRun = true
                                //labelExtra.text = "Tração extra"
                                Task.enableDevice(37,6,true)
                                Data.smartCountCtr = "ligado"
                                Data.envioRun = false

                            } else{
                                Data.envioRun = true
                                //labelExtra.text = "Tração extra"
                                Task.enableDevice(37,6,false)
                                Data.smartCountCtr = "apagado"
                                Data.envioRun = false
                            }
                        }
                        indicator: Rectangle{
                            implicitWidth: 70
                            implicitHeight: 32
                            radius: 16
                            color: controlSmartCount.checked ? "#667ab3" : "#ffffff"
                            border.color: controlSmartCount.checked ? "#667ab3" : "#979696"
                            border.width: 2

                            Rectangle {
                                x: controlSmartCount.checked ? parent.width - width : 0
                                width: 32
                                height: 32
                                radius: 16
                                color: "white"
                                border.color: "#999999"
                                border.width: 2
                            }
                        }
                        contentItem: Text {
                            text: controlSmartCount.text
                            font: controlSmartCount.font
                            //opacity: enabled ? 1.0 : 0.3
                            color: controlSmartCount.down ? "#17a81a" : "#21be2b"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }
            Row {//PickCount
                id:fila_7
                y: 0
                x: 0
                spacing: -2
                Rectangle{
                    x:0
                    y:0
                    id:fila_7_Retangulo_1
                    width: tamRetanDesc
                    height: alturaRetangDesc
                    border.color:corBordaRetanDesc
                    border.width: 2
                    color: "#00000000"
                    Text {
                        x:2
                        //y:4.75
                        text: "PickCount"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                        anchors.verticalCenter: parent.verticalCenter
                        //anchors.centerIn: parent
                        horizontalAlignment:Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    Switch{
                        y: alturaRetangDesc/2 - 16
                        x: tamRetanDesc - 74
                        id: controlPick
                        implicitHeight: 50
                        implicitWidth: 72
                        onReleased: {
                            if(controlPick.checked){
                                Data.envioRun = true
                                Task.enableDevice(37,7,true)
                                Data.pickCountCtr = "ligado"
                                Data.envioRun = false

                            } else{
                                Data.envioRun = true
                                Task.enableDevice(37,7,false)
                                Data.pickCountCtr = "apagado"
                                Data.envioRun = false
                            }
                        }
                        indicator: Rectangle{
                            implicitWidth: 70
                            implicitHeight: 32
                            radius: 16
                            color: controlPick.checked ? "#667ab3" : "#ffffff"
                            border.color: controlPick.checked ? "#667ab3" : "#979696"
                            border.width: 2

                            Rectangle {
                                x: controlPick.checked ? parent.width - width : 0
                                width: 32
                                height: 32
                                radius: 16
                                color: "white"
                                border.color: "#999999"
                                border.width: 2
                            }
                        }
                        contentItem: Text {
                            text: controlPick.text
                            font: controlPick.font
                            //opacity: enabled ? 1.0 : 0.3
                            color: controlPick.down ? "#17a81a" : "#21be2b"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }
            Row {//Comporta Maq
                id:fila_8
                y: 0
                x: 0
                spacing: -2
                Rectangle{
                    x:0
                    y:0
                    id:fila_8_Retangulo_1
                    width: tamRetanDesc
                    height: alturaRetangDesc
                    border.color:corBordaRetanDesc
                    border.width: 2
                    color: "#00000000"
                    Text {
                        x:2
                        //y:4.75
                        text: "Comporta Maq."
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                        anchors.verticalCenter: parent.verticalCenter
                        //anchors.centerIn: parent
                        horizontalAlignment:Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    Switch{
                        y: alturaRetangDesc/2 - 16
                        x: tamRetanDesc - 74
                        id: controlPortinhola
                        implicitHeight: 50
                        implicitWidth: 72
                        onReleased: {
                            if(controlPortinhola.checked){
                                Data.envioRun = true
                                //labelExtra.text = "Tração extra"
                                Task.enableDevice(36,4,true)
                                Data.portCtr = "ligado"
                                Data.envioRun = false

                            } else{
                                Data.envioRun = true
                                //labelExtra.text = "Tração extra"
                                Task.enableDevice(36,4,false)
                                Data.portCtr = "apagado"
                                Data.envioRun = false
                            }
                        }
                        indicator: Rectangle{
                            implicitWidth: 70
                            implicitHeight: 32
                            radius: 16
                            color: controlPortinhola.checked ? "#667ab3" : "#ffffff"
                            border.color: controlPortinhola.checked ? "#667ab3" : "#979696"
                            border.width: 2

                            Rectangle {
                                x: controlPortinhola.checked ? parent.width - width : 0
                                width: 32
                                height: 32
                                radius: 16
                                color: "white"
                                border.color: "#999999"
                                border.width: 2
                            }
                        }
                        contentItem: Text {
                            text: controlPortinhola.text
                            font: controlPortinhola.font
                            //opacity: enabled ? 1.0 : 0.3
                            color: controlPortinhola.down ? "#17a81a" : "#21be2b"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }
            Row {//Injetor Externo
                id:fila_9
                y: 0
                x: 0
                spacing: 2
                Rectangle{
                    x:0
                    y:0
                    id:fila_9_Retangulo_1
                    width: tamRetanDesc
                    height: alturaRetangDesc
                    border.color:corBordaRetanDesc
                    border.width: 2
                    color: "#00000000"
                    Text {
                        x:2
                        //y:4.75
                        text: "Injetor Externo"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                        anchors.verticalCenter: parent.verticalCenter
                        //anchors.centerIn: parent
                        horizontalAlignment:Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    Switch{
                        y: alturaRetangDesc/2 - 16
                        x: tamRetanDesc - 74
                        id: controlInjec
                        implicitHeight: 50
                        implicitWidth: 72
                        onReleased: {
                            if(controlInjec.checked){
                                Data.envioRun = true
                                Task.enableDevice(37,3,true)
                                Data.injetorExterno = "ligado"
                                Data.envioRun = false

                            } else{
                                Data.envioRun = true
                                Task.enableDevice(37,3,false)
                                Data.injetorExterno = "apagado"
                                Data.envioRun = false
                            }
                        }
                        indicator: Rectangle{
                            implicitWidth: 70
                            implicitHeight: 32
                            radius: 16
                            color: controlInjec.checked ? "#667ab3" : "#ffffff"
                            border.color: controlInjec.checked ? "#667ab3" : "#979696"
                            border.width: 2

                            Rectangle {
                                x: controlInjec.checked ? parent.width - width : 0
                                width: 32
                                height: 32
                                radius: 16
                                color: "white"
                                border.color: "#999999"
                                border.width: 2
                            }
                        }
                        contentItem: Text {
                            text: controlInjec.text
                            font: controlInjec.font
                            //opacity: enabled ? 1.0 : 0.3
                            color: controlInjec.down ? "#17a81a" : "#21be2b"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
                Rectangle{
                    // y: fila_2.y
                    // x: tamRetanDesc + 2
                    id: rec_injetor
                    width: 72
                    height: alturaRetangDesc
                    border.width: 2
                    border.color: "transparent"
                    color: "transparent"
                    radius: 4

                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        heightValue: rec_est.height
                        id: input_injetor
                        texto: Data.valueTpoAtrasoInjetor
                        registro: 60
                    }
                }
            }
            Row {//Sensor Externo
                id:fila_10
                y: 0
                x: 0
                spacing: -2
                Rectangle{
                    x:0
                    y:0
                    id:fila_10_Retangulo_1
                    width: tamRetanDesc
                    height: alturaRetangDesc
                    border.color:corBordaRetanDesc
                    border.width: 2
                    color: "#00000000"
                    Text {
                        x:2
                        //y:4.75
                        text: "Sensor Externo"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                        anchors.verticalCenter: parent.verticalCenter
                        //anchors.centerIn: parent
                        horizontalAlignment:Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    Switch{
                        y: alturaRetangDesc/2 - 16
                        x: tamRetanDesc - 74
                        id: controlsensorExt
                        implicitHeight: 50
                        implicitWidth: 72
                        onReleased: {
                            if(controlsensorExt.checked){
                                Data.envioRun = true
                                Task.enableDevice(37,2,true)
                                Data.sensorExtCtr = "ligado"
                                Data.envioRun = false

                            } else{
                                Data.envioRun = true
                                Task.enableDevice(37,2,false)
                                Data.sensorExtCtr = "apagado"
                                Data.envioRun = false
                            }
                        }
                        indicator: Rectangle{
                            implicitWidth: 70
                            implicitHeight: 32
                            radius: 16
                            color: controlsensorExt.checked ? "#667ab3" : "#ffffff"
                            border.color: controlsensorExt.checked ? "#667ab3" : "#979696"
                            border.width: 2

                            Rectangle {
                                x: controlsensorExt.checked ? parent.width - width : 0
                                width: 32
                                height: 32
                                radius: 16
                                color: "white"
                                border.color: "#999999"
                                border.width: 2
                            }
                        }
                        contentItem: Text {
                            text: controlsensorExt.text
                            font: controlsensorExt.font
                            //opacity: enabled ? 1.0 : 0.3
                            color: controlsensorExt.down ? "#17a81a" : "#21be2b"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }
            Row {//Contador
                id:fila_11
                y: 0
                x: 0
                spacing: 2
                Rectangle{
                    x:0
                    y:0

                    id:fila_11_Retangulo_1
                    width: tamRetanDesc
                    height: alturaRetangDesc
                    border.color:corBordaRetanDesc
                    border.width: 2
                    color: "#00000000"


                    Text {
                        x:2
                        //y:4.75
                        text: "Qtd Contador"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                        anchors.verticalCenter: parent.verticalCenter
                        //anchors.centerIn: parent
                        horizontalAlignment:Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }


                }
                Rectangle{
                    //x: tamRetanDesc + 2
                    id: insert17
                    width: 72
                    height: alturaRetangDesc
                    border.width: 2
                    border.color: "transparent"
                    color: "transparent"
                    radius: 4
                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        heightValue: rec_agr.height
                        id: inputINTValue17
                        texto: Data.valueQtdContador
                        registro: 80
                    }
                }
            }
            Row {//Agrupador
                id:fila_12
                y: 0
                x: 0
                spacing: 2
                Rectangle{
                    x:0
                    y:0
                    id:fila_12_Retangulo_1
                    width: tamRetanDesc
                    height: alturaRetangDesc
                    border.color:corBordaRetanDesc
                    border.width: 2
                    color: "#00000000"
                    Text {
                        x:2
                        //y:4.75
                        text: "Qtd Agrupador"
                        font.family: "Arial"
                        color: "black"
                        font.pointSize: Data.fontLabelSize
                        anchors.margins: 2
                        anchors.verticalCenter: parent.verticalCenter
                        //anchors.centerIn: parent
                        horizontalAlignment:Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    /*Switch{
                        y: alturaRetangDesc/2 - 16
                        x: tamRetanDesc - 74
                        id: controlAgrupador
                        implicitHeight: 50
                        implicitWidth: 72
                        onReleased: {
                            if(controlAgrupador.checked){
                                Data.envioRun = true
                                Task.enableDevice(37,0,true)//verificar um bool ==============================================
                                Data.agrupadorCtr = "ligado"
                                Data.envioRun = false

                            } else{
                                Data.envioRun = true
                                Task.enableDevice(37,0,false)//verificar um bool ==============================================
                                Data.agrupadorCtr = "apagado"
                                Data.envioRun = false
                            }
                        }
                        indicator: Rectangle{
                            implicitWidth: 70
                            implicitHeight: 32
                            radius: 16
                            color: controlAgrupador.checked ? "#667ab3" : "#ffffff"
                            border.color: controlAgrupador.checked ? "#667ab3" : "#cccccc"
                            border.width: 2

                            Rectangle {
                                x: controlAgrupador.checked ? parent.width - width : 0
                                width: 32
                                height: 32
                                radius: 16
                                color: "white"
                                border.color: "#999999"
                                border.width: 2
                            }
                        }
                        contentItem: Text {
                            text: controlAgrupador.text
                            font: controlAgrupador.font
                            //opacity: enabled ? 1.0 : 0.3
                            color: controlAgrupador.down ? "#17a81a" : "#21be2b"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }*/
                }
                Rectangle{
                    //x: tamRetanDesc + 2
                    id: rec_agr
                    width: 72
                    height: alturaRetangDesc
                    border.width: 2
                    border.color: "transparent"
                    color: "transparent"
                    radius: 4

                    TextBoxOpus
                    {
                        minValue: 0
                        maxValue: 9999
                        heightValue: rec_agr.height
                        id: input_agr
                        texto: Data.valueQtdAgrupador
                        registro: 76
                    }
                }
            }
        }
    }
}



//============================================  antigo  =====================================================

/*Text {
            id: labelEsteiraEnt
            font.pointSize: Data.fontLabelSize
            color: controlEsteiraEnt.checked ? "#667ab3" : "black"
            font.family: "Arial"
            text: "Esteira entrada"
            height: 50
        }

        Text {

            id: labelEsteira
            font.pointSize: Data.fontLabelSize
            color: controlEsteira.checked ? "#667ab3" : "black"
            font.family: "Arial"
            text: "Esteira saída"
            height: 50
        }

        Text {
            id: labelEsticador
            font.pointSize: Data.fontLabelSize
            color: controlEsticador.checked ? "#667ab3" : "black"
            font.family: "Arial"
            text: "Esticador"
            height: 50
        }

        Text {
            text: "Qtd Contador"
            font.family: "Arial"
            color: "black"
            font.pointSize: Data.fontLabelSize
            height: 50
        }

        Text {
            text: "Qtd Agrupador"
            font.family: "Arial"
            color: "black"
            font.pointSize: Data.fontLabelSize
            height: 50
        }

        Text {
            id: labelPortinhola
            font.pointSize: Data.fontLabelSize
            color: controlPortinhola.checked ? "#667ab3" : "black"
            font.family: "Arial"
            text: "Comporta "
            height: 50
        }

        Text {
            id: labelExt
            font.pointSize: Data.fontLabelSize
            color: controlExt.checked ? "#667ab3" : "black"
            font.family: "Arial"
            text: "Sensor Externo"
            height: 50
        }

        Text {
            id: labelBomb
            font.pointSize: Data.fontLabelSize
            color: controlExt.checked ? "#667ab3" : "black"
            font.family: "Arial"
            text: "Bomba de água"
            height: 50
        }

        Text {
            id: labelExtra
            font.pointSize: Data.fontLabelSize
            color: controlExt.checked ? "#667ab3" : "black"
            font.family: "Arial"
            text: "Tração extra"
            height: 50
        }*/


// }

/*Esteira entrada
    Switch{
        y: 52
        x: 219
        id: controlEsteiraEnt
        implicitHeight: 50
        implicitWidth: 72

        onReleased: {
            if(controlEsteiraEnt.checked){
                Data.envioRun = true
                Task.enableDevice(36,6,true)
                Data.esteiraEntCtr = "ligado"
                Data.envioRun = false

            } else{
                Data.envioRun = true
                Task.enableDevice(36,6,false)
                Data.esteiraEntCtr = "apagado"
                Data.envioRun = false
            }
        }
        indicator: Rectangle{
            implicitWidth: 72
            implicitHeight: 32
            radius: 16
            color: controlEsteiraEnt.checked ? "#667ab3" : "#ffffff"
            border.color: controlEsteiraEnt.checked ? "#667ab3" : "#cccccc"
            border.width: 2

            Rectangle {
                x: controlEsteiraEnt.checked ? parent.width - width : 0
                width: 32
                height: 32
                radius: 16
                color: "white"
                border.color: "#999999"
                border.width: 2
            }
        }
        contentItem: Text {
            text: controlEsteiraEnt.text
            font: controlEsteiraEnt.font
            color: controlEsteiraEnt.down ? "#17a81a" : "#21be2b"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

    }
}
*/
/* //Esteira saida
      Switch{
        y: 110
        x: 219
        id: controlEsteira
        implicitHeight: 50
        implicitWidth: 72
        onReleased: {
            if(controlEsteira.checked){
                Data.envioRun = true
                Task.enableDevice(36,7,true)
                Data.esteiraCtr = "ligado"
                Data.envioRun = false
            } else{
                Data.envioRun = true
                Task.enableDevice(36,7,false)
                Data.esteiraCtr = "apagado"
                Data.envioRun = false

            }
        }
        indicator: Rectangle{
            implicitWidth: 70
            implicitHeight: 32
            radius: 16
            color: controlEsteira.checked ? "#667ab3" : "#ffffff"
            border.color: controlEsteira.checked ? "#667ab3" : "#cccccc"
            border.width: 2

            Rectangle {
                x: controlEsteira.checked ? parent.width - width : 0
                width: 32
                height: 32
                radius: 16
                color: "white"
                border.color: "#999999"
                border.width: 2
            }
        }
        contentItem: Text {
            text: controlEsteira.text
            font: controlEsteira.font
            //opacity: enabled ? 1.0 : 0.3
            color: controlEsteira.down ? "#17a81a" : "#21be2b"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }


    Rectangle{
        y: 110
        x: 325
        id: rec_est
        width: 72
        height: 32
        border.width: 2
        border.color: "#999999"
        color: "transparent"
        radius: 4

        TextBoxOpus
        {
            minValue: 0
            maxValue: 9999
            id: input_est
            texto: Data.valueQtdEsteira
            registro: 78
        }
    }
*/
/*  //Esticador
    Switch{
        y: 168
        x: 219
        id: controlEsticador
        implicitHeight: 50
        implicitWidth: 200
        onReleased: {
            if(controlEsticador.checked){
                Data.envioRun = true
                labelEsticador.text = "Esticador"
                Task.enableDevice(37,0,true)
                Data.esticadorCtr = "ligado"
                Data.envioRun = false

            } else{
                Data.envioRun = true
                labelEsticador.text = "Esticador"
                Task.enableDevice(37,0,false)
                Data.esticadorCtr = "apagado"
                Data.envioRun = false
            }
        }
        indicator: Rectangle{
            implicitWidth: 70
            implicitHeight: 32
            radius: 16
            color: controlEsticador.checked ? "#667ab3" : "#ffffff"
            border.color: controlEsticador.checked ? "#667ab3" : "#cccccc"
            border.width: 2

            Rectangle {
                x: controlEsticador.checked ? parent.width - width : 0
                width: 32
                height: 32
                radius: 16
                color: "white"
                border.color: "#999999"
                border.width: 2
            }
        }
        contentItem: Text {
            text: controlEsticador.text
            font: controlEsticador.font
            //opacity: enabled ? 1.0 : 0.3
            color: controlEsticador.down ? "#17a81a" : "#21be2b"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
*/
/*//Qtd contador
    Rectangle{
        y: 226
        x: 219
        id: insert17
        width: 72
        height: 32
        border.width: 2
        border.color: "#999999"
        color: "transparent"
        radius: 4

        TextBoxOpus
        {
            minValue: 0
            maxValue: 9999
            id: inputINTValue17
            texto: Data.valueQtdContador
            registro: 80
        }
    }
*/

/* Agrupador
    Rectangle{
        y: 286
        x: 219
        id: rec_agr
        width: 72
        height: 32
        border.width: 2
        border.color: "#999999"
        color: "transparent"
        radius: 4

        TextBoxOpus
        {
            minValue: 0
            maxValue: 9999
            id: input_agr
            texto: Data.valueQtdAgrupador
            registro: 76
        }
    }*/
/*//Portinhola
    Switch{
        y: 342
        x: 219
        id: controlPortinhola
        implicitHeight: 50
        implicitWidth: 200
        onReleased: {
            if(controlPortinhola.checked){
                Data.envioRun = true
                labelPortinhola.text = "Comporta"
                Task.enableDevice(36,4,true)
                Data.portCtr = "ligado"
                Data.envioRun = false

            } else{
                Data.envioRun = true
                labelPortinhola.text = "Comporta"
                Task.enableDevice(36,4,false)
                Data.portCtr = "apagado"
                Data.envioRun = false
            }
        }
        indicator: Rectangle{
            implicitWidth: 70
            implicitHeight: 32
            radius: 16
            color: controlPortinhola.checked ? "#667ab3" : "#ffffff"
            border.color: controlPortinhola.checked ? "#667ab3" : "#cccccc"
            border.width: 2

            Rectangle {
                x: controlPortinhola.checked ? parent.width - width : 0
                width: 32
                height: 32
                radius: 16
                color: "white"
                border.color: "#999999"
                border.width: 2
            }
        }
        contentItem: Text {
            text: controlPortinhola.text
            font: controlPortinhola.font
            //opacity: enabled ? 1.0 : 0.3
            color: controlPortinhola.down ? "#17a81a" : "#21be2b"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }*/
/*//sensor externo
    Switch{
        y: 402
        x: 219
        id: controlExt
        implicitHeight: 50
        implicitWidth: 200
        onReleased: {
            if(controlExt.checked){
                Data.envioRun = true
                labelExt.text = "Sensor Externo"
                Task.enableDevice(37,2,true)
                Data.extCtr = "ligado"
                Data.envioRun = false

            } else{
                Data.envioRun = true
                labelExt.text = "Sensor Externo"
                Task.enableDevice(37,2,false)
                Data.extCtr = "apagado"
                Data.envioRun = false
            }
        }
        indicator: Rectangle{
            implicitWidth: 70
            implicitHeight: 32
            radius: 16
            color: controlExt.checked ? "#667ab3" : "#ffffff"
            border.color: controlExt.checked ? "#667ab3" : "#cccccc"
            border.width: 2

            Rectangle {
                x: controlExt.checked ? parent.width - width : 0
                width: 32
                height: 32
                radius: 16
                color: "white"
                border.color: "#999999"
                border.width: 2
            }
        }
        contentItem: Text {
            text: controlExt.text
            font: controlExt.font
            //opacity: enabled ? 1.0 : 0.3
            color: controlExt.down ? "#17a81a" : "#21be2b"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }*/
/*//bomba
    Switch{
        y: 476
        x: 219
        id: controlBomb
        implicitHeight: 50
        implicitWidth: 200
        onReleased: {
            if(controlBomb.checked){
                Data.envioRun = true
                labelBomb.text = "Bomba de água"
                Task.enableDevice(37,3,true)
                Data.bomba = "ligado"
                Data.envioRun = false

            } else{
                Data.envioRun = true
                labelBomb.text = "Bomba de água"
                Task.enableDevice(37,3,false)
                Data.bomba = "apagado"
                Data.envioRun = false
            }
        }
        indicator: Rectangle{
            implicitWidth: 70
            implicitHeight: 32
            radius: 16
            color: controlBomb.checked ? "#667ab3" : "#ffffff"
            border.color: controlBomb.checked ? "#667ab3" : "#cccccc"
            border.width: 2

            Rectangle {
                x: controlBomb.checked ? parent.width - width : 0
                width: 32
                height: 32
                radius: 16
                color: "white"
                border.color: "#999999"
                border.width: 2
            }
        }
        contentItem: Text {
            text: controlBomb.text
            font: controlBomb.font
            //opacity: enabled ? 1.0 : 0.3
            color: controlBomb.down ? "#17a81a" : "#21be2b"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }*/
/*tracao extra
    Switch{
        y: 540
        x: 219
        id: controlExtra
        implicitHeight: 50
        implicitWidth: 200
        onReleased: {
            if(controlExtra.checked){
                Data.envioRun = true
                labelExtra.text = "Tração extra"
                Task.enableDevice(37,4,true)
                Data.extra = "ligado"
                Data.envioRun = false

            } else{
                Data.envioRun = true
                labelExtra.text = "Tração extra"
                Task.enableDevice(37,4,false)
                Data.extra = "apagado"
                Data.envioRun = false
            }
        }
        indicator: Rectangle{
            implicitWidth: 70
            implicitHeight: 32
            radius: 16
            color: controlExtra.checked ? "#667ab3" : "#ffffff"
            border.color: controlExtra.checked ? "#667ab3" : "#cccccc"
            border.width: 2

            Rectangle {
                x: controlExtra.checked ? parent.width - width : 0
                width: 32
                height: 32
                radius: 16
                color: "white"
                border.color: "#999999"
                border.width: 2
            }
        }
        contentItem: Text {
            text: controlExtra.text
            font: controlExtra.font
            //opacity: enabled ? 1.0 : 0.3
            color: controlExtra.down ? "#17a81a" : "#21be2b"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }



}*/


