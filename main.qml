import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Moniteur")

    //permet de "swiper" entre les menus
    SwipeView {
        id: view
        anchors.fill: parent
        currentIndex: 0 //index par défaut
        TemperaturesChart {
        }
        AccelerometersChart {
        }
        Accelerometer3D {
        }
    }
    //indicateur permettant d'identifier l'index en cours
    PageIndicator {
        id: indicator

        count: view.count
        currentIndex: view.currentIndex

        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
