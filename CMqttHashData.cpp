#include "CMqttHashData.h"
#include <QtDebug>
CMqttHashData::CMqttHashData()
{

}

CMqttHashData::~CMqttHashData()
{

}

double CMqttHashData::readValue(QString key)
{
    return m_hashValues.value(key);
}

void CMqttHashData::insertValue(QString key, double value)
{
    m_hashValues.insert(key, value);
}
