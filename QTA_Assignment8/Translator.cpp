#include "Translator.h"
#include <QGuiApplication>
Translator::Translator(QObject *parent) : QObject(parent)
{

}

void Translator::setTranslation(QString translation)
{
    m_translator.load(":/languages/Language_" + translation, ".qm");
    qApp->installTranslator(&m_translator);
    emit languageChanged();
}
