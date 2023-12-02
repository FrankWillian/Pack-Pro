import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0
import "."

Rectangle {
    width: 350
    height: 550
    y: 35
    x: 50
    property string auxVersãoPL: ""
    property string auxVersãoPLCompara: ""
    Component.onCompleted: {

        if(Data.impressoraVisivel){
            controlImpressora.checked = true
        }
        if(Data.valueVersaoPLC<=999){
        auxVersãoPL = Data.valueVersaoPLC[0] + "." + Data.valueVersaoPLC[1] + "." + Data.valueVersaoPLC[2]
        }
        else{
            auxVersãoPL = Data.valueVersaoPLC[0] + Data.valueVersaoPLC[1] + "." + Data.valueVersaoPLC[2] +"." + Data.valueVersaoPLC[3]
        }

    }

    Rectangle{
        y: 5
        width: 350
        height: 122
        border.color: Paleta.colorPatern
        border.width: 4
        radius: 6

        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            color: "black"
            horizontalOffset: 1
            verticalOffset: 1
        }

        ColumnLayout{

            x: 25
            y: 15

            ColumnLayout{
                spacing: 16

                ColumnLayout{
                    spacing: 16

                    RowLayout {

                        Text {
                            id: labelTempAtual
                            width: 100
                            color: Paleta.colorPatern
                            font.family: Data.fontFamily
                            font.pointSize: Data.fontLabelSize
                            font.bold: Font.Thin
                            horizontalAlignment: Text.AlignLeft
                            text: qsTr("Temp Core:")
                            Text {
                                x: 220
                                id: inputTempAtual
                                color: Paleta.fontValue
                                font.family: Data.fontFamily
                                font.pointSize: Data.fontValueSize
                                font.bold: Font.Thin
                                horizontalAlignment: Text.AlignLeft
                                verticalAlignment: Text.AlignHCenter
                                text: Data.valueCoreTemp
                            }
                        }
                    }
                    RowLayout {

                        Text {
                            id: labelVersaoPLC
                            width: 100
                            color: Paleta.colorPatern
                            font.family: Data.fontFamily
                            font.pointSize: Data.fontLabelSize
                            font.bold: Font.Thin
                            horizontalAlignment: Text.AlignLeft
                            text: qsTr("Versão do PLC")
                            Text {
                                x: 220
                                id: inputVersaoPLC
                                color: Paleta.fontValue
                                font.family: Data.fontFamily
                                font.pointSize: Data.fontValueSize
                                font.bold: Font.Thin
                                horizontalAlignment: Text.AlignLeft
                                verticalAlignment: Text.AlignHCenter
                                text: auxVersãoPL//Data.valueVersaoPLC[0] + "." + Data.valueVersaoPLC[1]
                            }
                        }
                    }
                }
            }
        }
    }

    Text {
        x: 05
        y: 305

        id: labelImpressora
        font.pointSize: Data.fontLabelSize
        color: controlImpressora.checked ? "#667ab3" : "black"
        font.family: "Arial"
        text: "Impressora"
        height: 50
    }

    Switch{
        x: 120
        y: 300

        id: controlImpressora
        implicitHeight: 50
        implicitWidth: 72

        onReleased: {
            if(controlImpressora.checked){
                Data.impressoraVisivel = true


            } else{
                Data.impressoraVisivel = false
            }
        }
        indicator: Rectangle{
            implicitWidth: 72
            implicitHeight: 32
            radius: 16
            color: controlImpressora.checked ? "#667ab3" : "#ffffff"
            border.color: controlImpressora.checked ? "#667ab3" : "#cccccc"
            border.width: 2

            Rectangle {
                x: controlImpressora.checked ? parent.width - width : 0
                width: 32
                height: 32
                radius: 16
                color: "white"
                border.color: "#999999"
                border.width: 2
            }
        }
        contentItem: Text {
            text: controlImpressora.text
            font: controlImpressora.font
            color: controlImpressora.down ? "#17a81a" : "#21be2b"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

    }

}
