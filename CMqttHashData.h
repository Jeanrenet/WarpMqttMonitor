#ifndef CMQTTHASHDATA_H
#define CMQTTHASHDATA_H

#include <QObject>
#include <QHash>

class CMqttHashData : public QObject
{
    Q_OBJECT
public:
    CMqttHashData();
    ~CMqttHashData();

public:
    /**
    * @brief readValue
    * @param key
    * @return
    */
    Q_INVOKABLE double readValue(QString key);
    /**
     * @brief insertValue
     * @param key
     * @param value
     */
    void insertValue(QString key, double value);

private:
    QHash<QString, double> m_hashValues;
};

#endif // CMQTTHASHDATA_H
