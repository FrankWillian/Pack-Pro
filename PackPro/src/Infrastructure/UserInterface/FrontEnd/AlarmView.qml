import QtQuick 2.4
import QtQuick.Controls 2.0
import "."

Item {
    id: root

    property int sizeFontLabel: 12
    property int sizeFontInput: 12

    Rectangle {

        id: areaAlarme
        color: "transparent"
        border.color: lv.count === 0 ? "#667ab3" : "transparent";
        border.width: 2

        width: parent.width
        height: 560
        y: 40
        x: 10

        ListView {
            x: 3
            y: 10
            id: lv
            width: 400
            height: 540
            spacing: 8
            highlightMoveVelocity : 1.0

            move: Transition {
                NumberAnimation { properties: "x,y"; duration: 1000 }
            }

            model: Task.modelAlarms

            delegate:  Row {
                y: 3
                spacing: 4

                /*
                Rectangle {
                    border.width: 2; border.color: "#667ab3"; width: 50; height: 35;
                    radius: 8; color: index % 2 ? "#F0F8FF" : "#E0FFFF";

                    Text {
                        anchors.centerIn: parent
                        text: id
                        color: "black"
                        font.family: Data.fontFamily
                    }
                }
                */

                Rectangle {
                    border.width: 2; width: 150; height: 35
                    color: index % 2 ? "white" : "#667ab3"; radius: 8
                    border.color: "#667ab3"
                    Text {
                        anchors.centerIn: parent
                        text: datetime
                        horizontalAlignment: Text.AlignJustify
                        font.family: Data.fontFamily
                        font.pixelSize: 18
                        color: index % 2 ? "#667ab3" : "white";
                    }
                }
                Rectangle {
                    border.width: 2; width: 272; height: 35
                    color: index % 2 ? "white" : "#667ab3"; radius: 8
                    border.color: "#667ab3"

                    Text {
                        width: parent.width - 10
                        anchors.centerIn: parent
                        text: info
                        horizontalAlignment: Text.AlignJustify
                        font.family: "Arial"
                        font.pixelSize: 18
                        color: index % 2 ? "#667ab3" : "white";
                        wrapMode: Text.Wrap
                    }
                }

            }

        }

    }

}
