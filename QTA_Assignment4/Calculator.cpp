#include "Calculator.h"
#include <cmath>
#include <QDebug>
#define LOG qDebug() << __FUNCTION__ << __LINE__

Calculator::Calculator(QObject *parent) : QObject(parent),
    m_display{""}, m_displayTemp{""}, m_currentResult{0}, m_pendingOperator{""}, m_waitingOperand{true}
{}
bool isAssign = false;
bool isClear = false;
void Calculator::addDigit(int digit)
{
    if(m_waitingOperand) {
        m_display.clear();
        m_waitingOperand = false;
    }
    if (m_display == "0" && digit == 0) {
        return;
    }
    if(isClear) {
        m_display.clear();
        isClear = false;
    }
    m_display += QString::number(digit);
    m_displayTemp += QString::number(digit); // hien thi bieu thuc vua nhap
    LOG << m_display;
    emit displayChanged();
}

void Calculator::addOperator(const QString &op)
{
    LOG << m_pendingOperator;
    if (!m_pendingOperator.isEmpty()) {
        calculate();
    }
    m_currentResult = m_display.toDouble();
    m_pendingOperator = op;
    m_displayTemp += m_pendingOperator;
    m_waitingOperand = true;
    LOG << m_displayTemp;
    emit displayTempChanged();
    if(isAssign) { // hien thi lien tiep cac expression
        m_displayTemp = m_display;
        m_displayTemp += m_pendingOperator;
        emit displayTempChanged();
    }
}

void Calculator::addDecimal()
{
    if (m_waitingOperand) {
        m_display = "0";
        m_waitingOperand = false;
    }
    if (!m_display.contains(".")) {
        m_display += ".";
        m_displayTemp += ".";
    }
    emit displayChanged();
}

void Calculator::addSpecialOperator(const QString &op)
{
    if (!m_pendingOperator.isEmpty()) {
        calculate();
    }
    m_currentResult = m_display.toDouble();

    if(op == "1/x") {
        m_pendingOperator = op;
        m_displayTemp = "1/(" + m_displayTemp + ")";
        m_waitingOperand = true;
        LOG << m_displayTemp;
        emit displayTempChanged();
    } else if(op == "x^2") {
        m_pendingOperator = op;
        m_displayTemp = "sqr(" + m_displayTemp + ")";
        m_waitingOperand = true;
        LOG << m_displayTemp;
        emit displayTempChanged();
    } else if(op == "sqrt(x)") {
        m_pendingOperator = op;
        m_displayTemp = "sqrt(" + m_displayTemp + ")";
        m_waitingOperand = true;
        LOG << m_displayTemp;
        emit displayTempChanged();
    }
    if(isAssign) { // hien thi lien tiep cac expression
        if(op == "1/x")
            m_displayTemp = "1/(" + m_display + ")";
        else if(op == "x^2")
            m_displayTemp = "sqr(" + m_display + ")";
        else if(op == "sqrt(x)")
            m_displayTemp = "sqrt(" + m_display + ")";
        //m_displayTemp += m_pendingOperator;
        LOG << m_displayTemp;
        emit displayTempChanged();
    }
}

void Calculator::calculate()
{
    if (m_pendingOperator.isEmpty()) {
        return;
    }
    double operand = m_display.toDouble();
    if (m_pendingOperator == "+") {
        m_currentResult += operand;
    } else if (m_pendingOperator == "-") {
        m_currentResult -= operand;
    } else if (m_pendingOperator == "*") {
        m_currentResult *= operand;
    } else if (m_pendingOperator == "/") {
        if (operand != 0) {
            m_currentResult /= operand;
        } else {
            m_display = "Can not divide by Zero";
            emit displayChanged();
            emit displayTempChanged();
            return;
        }
    } else if (m_pendingOperator == "1/x") {
        m_currentResult = 1 / m_currentResult;
    } else if (m_pendingOperator == "x^2") {
        m_currentResult = m_currentResult * m_currentResult;
    } else if (m_pendingOperator == "sqrt(x)") {
        m_currentResult = sqrt(m_currentResult);
    }

    m_display = QString::number(m_currentResult);
    m_displayTemp += "=";
    LOG << m_display;
    m_pendingOperator.clear();
    m_waitingOperand = true;
    isAssign = true;
    emit displayChanged();
    emit displayTempChanged();
}

void Calculator::clear()
{
    isClear = true;
    m_display = "0";
    m_currentResult = 0;
    m_pendingOperator.clear();
    m_waitingOperand = false;
    m_displayTemp = "";
    emit displayChanged();
    emit displayTempChanged();
}

QString Calculator::getDisplay() const
{
    return m_display;
}

QString Calculator::getDisplayTemp() const
{
    return m_displayTemp;
}

void Calculator::setDisplayTemp(QString displayTemp)
{
    if (m_displayTemp == displayTemp)
        return;

    m_displayTemp = displayTemp;
    emit displayTempChanged();
}
