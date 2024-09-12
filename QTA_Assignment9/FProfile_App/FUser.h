#ifndef FUSER_H
#define FUSER_H

#include <QString>

class FUser {
public:
    FUser(int id = 0, const QString &name = "", const QString &avatar = "")
        : m_id(id), m_name(name), m_avatar(avatar) {}

    int id() const { return m_id; }
    QString name() const { return m_name; }
    QString avatar() const { return m_avatar; }

private:
    int m_id;
    QString m_name;
    QString m_avatar;
};

#endif // FUSER_H
