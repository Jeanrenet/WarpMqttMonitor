import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtDataVisualization 1.1

Item {
    id: dataView

    Connections {
        target: Data
        onDataChanged : {
            dataModel.set(0,
                          {
                              "xPos":Data.values.readValue("Warp7MQTT/Jean/accelerometer/X"),
                              "yPos":Data.values.readValue("Warp7MQTT/Jean/accelerometer/Y"),
                              "zPos":Data.values.readValue("Warp7MQTT/Jean/accelerometer/Z")
                          })

        }
    }
    ListModel {
        id: dataModel
        ListElement{
            xPos: 0;
            yPos: 0;
            zPos: 0;
        }
        ListElement{
            xPos: 0;
            yPos: 0;
            zPos: 0;
        }
    }
    Theme3D {
        id: themeIsabelle
        type: Theme3D.ThemePrimaryColors
        font.family: "Lucida Handwriting"
        font.pointSize: 40
    }
    ValueAxis3D {
        id: valueAxisX
        min: -20
        max: 20
    }
    ValueAxis3D {
        id: valueAxisY
        min: -20
        max: 20
    }
    ValueAxis3D {
        id: valueAxisZ
        min: -20
        max: 20
    }

    MouseArea {
                id: inputArea
                anchors.fill: parent
                hoverEnabled: true
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                property int mouseX: -1
                property int mouseY: -1

                onPositionChanged: {
                    mouseX = mouse.x;
                    mouseY = mouse.y;
                }
    }

    Scatter3D {
        id: scatterGraph
        width: dataView.width
        height: dataView.height
        theme: themeIsabelle
        shadowQuality: AbstractGraph3D.ShadowQualitySoftLow
        scene.activeCamera.cameraPreset: Camera3D.CameraPresetIsometricRight
        axisZ: valueAxisZ
        axisY: valueAxisY
        axisX: valueAxisX

        Scatter3DSeries {
            id: scatterSeries
            itemLabelFormat: "(@xLabel, @yLabel, @zLabel)"
            meshSmooth: true
            ItemModelScatterDataProxy {
                itemModel: dataModel
                xPosRole: "xPos"
                yPosRole: "yPos"
                zPosRole: "zPos"
            }
        }
    }
}
