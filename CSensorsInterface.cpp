#include "CSensorsInterface.h"

CSensorsInterface::CSensorsInterface()
{
    //initialisation de la table de valeurs
    m_values = new CMqttHashData();

    //initialisation du client mqtt
    m_mqttClient = new QMqttClient();
    connect(m_mqttClient, &QMqttClient::stateChanged, this, &CSensorsInterface::clientStateChanged);
    m_mqttClient->setHostname("test.mosquitto.org");
    m_mqttClient->setPort(1883);
    m_mqttClient->connectToHost();
}

CSensorsInterface::~CSensorsInterface()
{
    m_mqttClient->disconnectFromHost();
    delete m_mqttClient;
}

void CSensorsInterface::clientStateChanged(QMqttClient::ClientState state)
{
    switch (state) {

    case QMqttClient::Disconnected:
        qDebug() << "Client Disconnected";
        break;
    case QMqttClient::Connecting:
        qDebug() << "Client Connecting";
        break;
    case QMqttClient::Connected:
        qDebug() << "Client Connected";

        //souscription à la maison de Jean
        subscribe("Warp7MQTT/Jean/#");

        //souscription à la maison de Jean
        subscribe("Warp7MQTT/Pierre-Jean/#");
        break;
    }
}

void CSensorsInterface::subscribe(QString topic)
{
    //création d'un topic
    QMqttTopicFilter topicFilter;
    topicFilter.setFilter(topic);

    //souscription au topic
    QMqttSubscription *sub = m_mqttClient->subscribe(topicFilter, 0);

    if (sub)
    {
        //création de la connexion à une fonction pour les mises à jours
        connect(sub, &QMqttSubscription::messageReceived, this, &CSensorsInterface::messageReceived);
    }
    else
        qDebug() << "Impossible de souscrire au Topic "<< topic;
}

void CSensorsInterface::messageReceived(QMqttMessage msg)
{
    (static_cast<CMqttHashData*>(m_values))->insertValue(msg.topic().name(), msg.payload().toDouble());

    Q_EMIT dataChanged();
}
