#ifndef LIFE_FORM
#define LIFE_FORM

#include <string>

#include "LifeSystem.hh"

#define MAX_SKILL 20
#define MAX_RESISTANCE 1.0
#define MIN_RESISTANCE 0.0

class LifeForm
{
protected:
    std::string name;
    unsigned int health, max_health;
    float resistance;
    unsigned int speed, strength;
    bool dead;
    void __verify__();
    virtual void death(); // May want to create and return a Corpse Class
public:
    LifeForm(std::string, unsigned int, float, unsigned int, unsigned int);
    ~LifeForm();
    std::string getName();
    unsigned int getHealth();
    unsigned int getMaxHealth();
    float getResistance();
    unsigned int getSpeed();
    unsigned int getStrength();
    virtual void takeDamage(unsigned int);
    virtual unsigned int attack();
    void recoverHealth(unsigned int);
    void recoverAllHealth();
};

#endif