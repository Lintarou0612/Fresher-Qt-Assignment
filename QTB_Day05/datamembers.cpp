#include "datamembers.h"

DataMembers::DataMembers(QObject *parent) : QObject(parent)
{
    
}

DataMembers::DataMembers(const QString &accountName, const int &yearOld, const QString &fullName, const QString &address, QObject *parent)
    : QObject(parent), m_accountName(accountName), m_yearOld(yearOld), m_fullName(fullName), m_address(address)
{
    
}

QString DataMembers::accountName() const
{
    return m_accountName;
}

int DataMembers::yearOld() const
{
    return m_yearOld;
}

QString DataMembers::fullName() const
{
    return m_fullName;
}

QString DataMembers::address() const
{
    return m_address;
}

void DataMembers::setAccountName(const QString &accountName)
{
    if (m_accountName == accountName)
        return;

    m_accountName = accountName;
    emit accountNameChanged();
}

void DataMembers::setYearOld(const int &yearOld)
{
    if (m_yearOld == yearOld)
        return;

    m_yearOld = yearOld;
    emit accountNameChanged();
}

void DataMembers::setFullName(QString fullName)
{
    if (m_fullName == fullName)
        return;

    m_fullName = fullName;
    emit fullNameChanged(m_fullName);
}

void DataMembers::setAddress(QString address)
{
    if (m_address == address)
        return;

    m_address = address;
    emit addressChanged(m_address);
}
