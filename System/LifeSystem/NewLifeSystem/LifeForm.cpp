#include <ctime>
#include <cstdlib>
#include <cmath>

#include "LifeForm.hh"

LifeForm::LifeForm(std::string n, unsigned int h, float r, unsigned int sp, unsigned int st) :
    name(n), health(h), max_health(h), resistance(r), speed(sp), strength(st)
{
    dead = false;
    __verify__();
}

LifeForm::~LifeForm()
{
}

void LifeForm::__verify__() {
    if (resistance < MIN_RESISTANCE) {
        resistance = MIN_RESISTANCE;
    } else if (resistance > MAX_RESISTANCE) {
        resistance = MAX_RESISTANCE;
    }

    if (speed > MAX_SKILL) {
        speed = MAX_SKILL;
    }
    if (strength > MAX_SKILL) {
        strength = MAX_SKILL;
    }
}

std::string LifeForm::getName() {
    return name;
}

unsigned int LifeForm::getHealth() {
    return health;
}

unsigned int LifeForm::getMaxHealth() {
    return max_health;
}

float LifeForm::getResistance() {
    return resistance;
}

unsigned int LifeForm::getSpeed() {
    return speed;
}

unsigned int LifeForm::getStrength() {
    return strength;
}

void LifeForm::death() {
    max_health = 0;
    resistance = 0;
    speed = 0;
    strength = 0;
    dead = true;
    // May want to create and return a Corpse Class
}

void LifeForm::takeDamage(unsigned int damage) {
    if (damage == 0) {
        return;
    }
    if (health <= damage) {
        health = 0;
        this->death();
    } else {
        health -= damage;
    }
}

unsigned int LifeForm::attack() {
 if (!dead) {
    srand(time(0));
    return (unsigned int)round(rand() / (float)RAND_MAX * speed + rand() / (float)RAND_MAX * strength);
 }
}

void LifeForm::recoverHealth(unsigned int recover) {
    if (max_health <= health + recover) {
        this->recoverAllHealth();
    } else {
        health += recover;
    }
}

void LifeForm::recoverAllHealth() {
    health = max_health;
}
