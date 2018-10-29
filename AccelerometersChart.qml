import QtQuick 2.0
import QtCharts 2.0


ChartView {
    id: chart
    title: "Les accéléromètres !"
    antialiasing: true

    property int timeStamp : 0
    property int maxValues : 10

    Connections {
        target: Data
        onDataChanged : {
            //z
            Data.updateHistoric(lineSeriesZJean, maxValues, Data.values.readValue("Warp7MQTT/Jean/accelerometer/Z"))
            Data.updateHistoric(lineSeriesPierreZJean, maxValues, Data.values.readValue("Warp7MQTT/Pierre-Jean/accelerometer/Z"))
            //y
            Data.updateHistoric(lineSeriesYJean, maxValues, Data.values.readValue("Warp7MQTT/Jean/accelerometer/Y"))
            Data.updateHistoric(lineSeriesPierreYJean, maxValues, Data.values.readValue("Warp7MQTT/Pierre-Jean/accelerometer/Y"))
            //x
            Data.updateHistoric(lineSeriesXJean, maxValues, Data.values.readValue("Warp7MQTT/Jean/accelerometer/X"))
            Data.updateHistoric(lineSeriesPierreXJean, maxValues, Data.values.readValue("Warp7MQTT/Pierre-Jean/accelerometer/X"))
        }
    }

    ChartView {
        anchors.fill: parent
        antialiasing: true
        SplineSeries {
            id: lineSeriesXJean
            name: "Jean X"
            axisY: dataAxisY
            axisX: dataAxisX
        }
        SplineSeries {
            id: lineSeriesPierreXJean
            name: "Pierre-Jean X"
            axisY: dataAxisY
            axisX: dataAxisX
        }
        SplineSeries {
            id: lineSeriesYJean
            name: "Jean Y"
            axisY: dataAxisY
            axisX: dataAxisX
        }
        SplineSeries {
            id: lineSeriesPierreYJean
            name: "Pierre-Jean Y"
            axisY: dataAxisY
            axisX: dataAxisX
        }
        SplineSeries {
            id: lineSeriesZJean
            name: "Jean Z"
            axisY: dataAxisY
            axisX: dataAxisX
        }
        SplineSeries {
            id: lineSeriesPierreZJean
            name: "Pierre-Jean Z"
            axisY: dataAxisY
            axisX: dataAxisX
        }
        ValueAxis {
            id: dataAxisY
            min: -30
            max: 30
            tickCount: 15
        }
        ValueAxis {
            id: dataAxisX
            titleText: "Toutes les 100 ms"
            min: 0
            max: maxValues
            tickCount: 5
        }
    }
}
