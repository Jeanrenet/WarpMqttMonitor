#ifndef CSENSORSINTERFACE_H
#define CSENSORSINTERFACE_H

#include <QObject>
#include <QtMqtt/QtMqtt>
#include <QtCharts/QLineSeries>

#include "CMqttHashData.h"

using namespace QtCharts;

class CSensorsInterface : public QObject
{
    Q_OBJECT
public:
    CSensorsInterface();
    ~CSensorsInterface();

    //exposition au QML de la classe m_values
    Q_PROPERTY(QObject* values MEMBER m_values NOTIFY dataChanged())

public:    
    Q_SIGNAL void dataChanged();

    /**
     * @brief updateHistoric
     * @param series
     * @param maxLength
     * @param value
     */
    Q_INVOKABLE void updateHistoric(QLineSeries *series, qint32 maxLength, double value);

protected:
    /**
     * @brief clientStateChanged
     * @param state
     */
    Q_SLOT void clientStateChanged(QMqttClient::ClientState state);
    /**
     * @brief subscribe
     * @param topic
     */
    void subscribe(QString topic);
    /**
     * @brief messageReceived
     * @param msg
     */
    Q_SLOT void messageReceived(QMqttMessage msg);

private:
    QMqttClient             *m_mqttClient;
    QMqttSubscription       *m_sub;
    QObject                 *m_values;
};

#endif // CSENSORSINTERFACE_H
