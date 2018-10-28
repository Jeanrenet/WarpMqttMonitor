import QtQuick 2.0
import QtCharts 2.0

ChartView {
    id: chart
    title: "Les températures !"
    anchors.fill: parent
    antialiasing: true

    BarSeries {
           id: mySeries
            axisY : ValueAxis {
                min: 0
                max: 55
                tickCount: 10

            }
           axisX: BarCategoryAxis {
               categories: ["Température"]
           }
           BarSet {
               label: "Jean";
               values: [Data.values.readValue("Warp7MQTT/Jean/temperature")]
           }
           BarSet {
               label: "Pierre-Jean";
               values: [Data.values.readValue("Warp7MQTT/Pierre-Jean/temperature")]
           }
       }
}
