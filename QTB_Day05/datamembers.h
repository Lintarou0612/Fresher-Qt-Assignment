#ifndef DATAMEMBERS_H
#define DATAMEMBERS_H

#include <QObject>

class DataMembers : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString accountName READ accountName WRITE setAccountName NOTIFY accountNameChanged)
    Q_PROPERTY(int yearOld READ yearOld WRITE setYearOld NOTIFY yearOldChanged)
    Q_PROPERTY(QString fullName READ fullName WRITE setFullName NOTIFY fullNameChanged)
    Q_PROPERTY(QString address READ address WRITE setAddress NOTIFY addressChanged)

public:
    DataMembers(QObject *parent = nullptr);
    DataMembers(const QString &accountName, const int &yearOld, const QString &fullName, const QString &address, QObject *parent = 0);

    QString accountName() const;
    int yearOld() const;
    QString fullName() const;
    QString address() const;

public slots:
    void setAccountName(const QString &accountName);
    void setYearOld(const int &yearOld);
    void setFullName(QString fullName);
    void setAddress(QString address);

signals:
    void accountNameChanged();
    void yearOldChanged();
    void fullNameChanged(QString fullName);
    void addressChanged(QString address);

private:
    QString m_accountName;
    int m_yearOld;
    QString m_fullName;
    QString m_address;
};

#endif // DATAMEMBERS_H
