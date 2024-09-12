#ifndef FUSER_H
#define FUSER_H

#include <QString>
class FUser
{
public:
    FUser(int id = -1, const QString &name = "", const QString &avatar = "")
        : m_id(id), m_name(name), m_avatar(avatar)
    {

    }

    int getId() const { return m_id; }
    QString getName() const { return m_name; }
    QString getAvatar() const { return m_avatar; }

private:
    int m_id;
    QString m_name;
    QString m_avatar;
};

#endif // FUSER_H
