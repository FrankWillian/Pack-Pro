import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import "."


Rectangle {
    width: 350
    height: 550
    y: 35
    x: 50

    Rectangle{
        y: 5
        width: 350
        height: 120
        border.color: Paleta.colorPatern
        border.width: 4
        radius: 6

        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            color: "black"
            horizontalOffset: 2
            verticalOffset: 2
        }

        ColumnLayout{

            x: 25
            y: 15

            ColumnLayout{
                spacing: 16


                RowLayout {
                    Text {
                        id: labelTempoEnerg
                        color: "#667ab3"
                        font.family: "Arial"
                        font.pointSize: Data.fontLabelSize
                        text: qsTr("Tempos energizado:")

                        Text {
                            id: vlrTempoEnerg
                            x: 220
                            color: "black"
                            font.family: "Arial"
                            font.pointSize: Data.fontValueSize
                            text: Data.valueInfoHrsEnerg
                        }
                        Text {

                            x: 240
                            color: "black"
                            font.family: "Arial"
                            font.pointSize: Data.fontLabelSize
                            text: " :"
                        }
                        Text {

                            x: 260
                            color: "black"
                            font.family: "Arial"
                            font.pointSize: Data.fontValueSize
                            text: Data.valueInfoMinEnerg
                        }
                    }
                }

                RowLayout {
                    Text {
                        id: labelTempoFunc
                        color: "#667ab3"
                        font.family: "Arial"
                        font.pointSize: Data.fontLabelSize
                        text: qsTr("Tempos funcinando:")

                        Text {
                            id: vlrTempoFunc
                            x: 220
                            color: "black"
                            font.family: "Arial"
                            font.pointSize: Data.fontValueSize
                            text: Data.valueInfoHorasProd
                        }
                        Text {
                            x: 240
                            color: "black"
                            font.family: "Arial"
                            font.pointSize: Data.fontLabelSize
                            text: " :"
                        }
                        Text {
                            x: 260
                            color: "black"
                            font.family: "Arial"
                            font.pointSize: 12
                            text: Data.valueInfoMinProd
                        }
                    }
                }

                RowLayout {
                    Text {
                        id: labelProdutividade
                        color: "#667ab3"
                        font.family: "Arial"
                        font.pointSize: Data.fontLabelSize
                        text: qsTr("Produtividade:")

                        Text {
                            id: vlrProdutividade
                            x: 220
                            color: "black"
                            font.family: "Arial"
                            font.pointSize: Data.fontValueSize
                            text: Data.valueProdutiMedia + qsTr(" %")
                        }
                    }
                }
            }
        }
    }

    Rectangle{
        y: 170
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
                            id: velocCpm
                            color: "#667ab3"
                            font.family: "Arial"
                            font.pointSize: Data.fontLabelSize
                            text: qsTr("Batidas por minuto:")

                            Text {
                                id: vlrVelocCpm
                                x: 220
                                color: "black"
                                font.family: "Arial"
                                font.pointSize: Data.fontValueSize
                                text: Data.valueVelocMedia
                            }
                        }
                    }

                    RowLayout {
                        Text {
                            id: labelConta
                            color: "#667ab3"
                            font.family: "Arial"
                            font.pointSize: Data.fontLabelSize
                            text: qsTr("Conta geral:")

                            Text {
                                id: vlrConta
                                x: 220
                                color: "black"
                                font.family: "Arial"
                                font.pointSize: Data.fontValueSize
                                text: Data.valueContaGeral
                            }
                        }
                    }
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
                }
            }
        }
    }

    Rectangle {
        id: btn_reset
        x: 140
        y: 350
        width: 70
        height: 70
        visible: Data.userLoginAdmin || Data.userLoginSuper ? true : false
        enabled: Data.userLoginAdmin || Data.userLoginSuper ? true : false

        Image {
            id: imgReset
            anchors.fill: parent
            source: "CONTENTS/IMAGES/resetNew.png"
            sourceSize: Qt.size(width, height)
            asynchronous: true
        }

        MouseArea {
            anchors.fill: btn_reset
            hoverEnabled: true

            onPressed: {
                popupSmall.visible = true
                popupSmall.msgPopup = "Deseja realmente zerar os valores?"
            }

        }

    }

    Rectangle {
        id: btn_embarcado
        width: 70
        height: 70
        x: 13
        y: 460
        visible: Data.userLoginAdmin || Data.userLoginSuper ? true : false
        enabled: Data.userLoginAdmin || Data.userLoginSuper ? true : false

        Image {
            id: imgeEmb
            anchors.fill: parent
            source: "CONTENTS/IMAGES/embedded.png"
            sourceSize: Qt.size(width, height)
            width: 70; height: 70
            asynchronous: true

        }

        MouseArea {
            anchors.fill: parent
            onPressed: {
                btn_embarcado.scale = 0.95
                btn_embarcado.color = "transparent"
            }

            onReleased: {
                btn_embarcado.scale = 1.0
                btn_embarcado.color = "transparent"
                loaderMain.width = root.width-(lvMenu.height)
                loaderMain.source = "Embarcado.qml"
                tituloHome.text = qsTr("EMBARCADO")
                tituloHome.x = 120
            }
        }
    }

    PopupSmall {
        id: popupSmall

        width: parent.width
        height: parent.height
        x: - 30
        y: - 19

        visible: false

        z: 90

        onCancelClicked: {
            Task.enableDevice(36,3,true)
            popupSmall.visible = false
        }

        onOkClicked: {
            Task.enableDevice(36,3,false)
            popupSmall.visible = false
            popupTimer.running = true
        }

        Timer{
            id: popupTimer
            interval: 300
            running: false
            repeat: false
            onTriggered: Task.enableDevice(36,3,true)
        }

    }

}


