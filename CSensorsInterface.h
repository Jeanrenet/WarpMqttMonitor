#ifndef CSENSORSINTERFACE_H
#define CSENSORSINTERFACE_H

#include <QObject>
#include <QtMqtt/QtMqtt>
#include "CMqttHashData.h"

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
