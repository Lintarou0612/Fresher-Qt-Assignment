#ifndef IFPROFILELISTENER_H
#define IFPROFILELISTENER_H

class IFProfileListener {
public:
    virtual ~IFProfileListener() {}
    virtual void onActiveUser(int id) = 0;
};

#endif // IFPROFILELISTENER_H
