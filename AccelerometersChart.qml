import QtQuick 2.0
import QtCharts 2.0


ChartView {
    id: chart
    title: "Les accéléromètres !"
    anchors.fill: parent
    antialiasing: true

    property int timeStamp : 0

    Connections {
        target: Data
        onDataChanged : {
            lineSeriesXJean.append(Data.values.readValue("Warp7MQTT/Jean/accelerometer/X"), timeStamp)
            lineSeriesPierreXJean.append(Data.values.readValue("Warp7MQTT/Jean/accelerometer/X"), timeStamp)
            if (timeStamp === 60)
            {
                lineSeriesXJean.remove(0)
                lineSeriesPierreXJean.remove(0)
            }
            else
            {
                timeStamp ++;
            }
        }
    }

    ChartView {
        anchors.fill: parent
        antialiasing: true
        LineSeries {
            id: lineSeriesXJean
            name: "Jean"
            axisY: dataAxisY
            axisX: dataAxisX
        }
        LineSeries {
            id: lineSeriesPierreXJean
            name: "Pierre-Jean"
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
            titleText: "Temps en secondes"
            min: 0
            max: 60
            tickCount: 5
        }
    }
}
