#ifndef CALCULATOR_H
#define CALCULATOR_H

#include <QObject>
#include <QString>

class Calculator : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString display READ getDisplay NOTIFY displayChanged)
    Q_PROPERTY(QString displayTemp READ getDisplayTemp WRITE setDisplayTemp NOTIFY displayTempChanged)

public:
    explicit Calculator(QObject *parent = nullptr);

    Q_INVOKABLE void addDigit(int digit);
    Q_INVOKABLE void addOperator(const QString &op);
    Q_INVOKABLE void addDecimal(); // thao tac voi dau cham dong
    Q_INVOKABLE void addSpecialOperator(const QString &op); // 1/x, sqrt(x), x^2
    Q_INVOKABLE void calculate();
    Q_INVOKABLE void clear();
    QString getDisplay() const;
    QString getDisplayTemp() const;

public slots:
    void setDisplayTemp(QString displayTemp);

signals:
    void displayChanged();
    void displayTempChanged();

private:
    QString m_display;
    QString m_displayTemp;
    double m_currentResult;
    QString m_pendingOperator;
    bool m_waitingOperand;

    void updateDisplay();
};

#endif // CALCULATOR_H
