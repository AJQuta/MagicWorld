#include "Animal.hh"


Animal::Animal(std::string n, unsigned int h, float r, unsigned int sp, unsigned int st, unsigned int a, unsigned int m, float f)
    : LifeForm(n, h, r, sp, st), armor(a), mana(m), max_mana(m), fov(f)
{
    __verify__();
}

Animal::~Animal()
{
}

void Animal::__verify__() {
    if (armor > MAX_SKILL) {
        armor = MAX_SKILL;
    }
    if (mana > MAX_SKILL) {
        mana = MAX_SKILL;
        max_mana = MAX_SKILL;
    }
    if (fov < MIN_FOV) {
        fov = MIN_FOV;
    } else if (fov > MAX_FOV) {
        fov = MAX_FOV;
    }
}

unsigned int Animal::getMana() {
    return mana;
}

unsigned int Animal::getMaxMana() {
    return max_mana;
}

float Animal::getFOV() {
    return fov;
}

void Animal::setFOV(float f) {
    fov = f;
}

void Animal::death() {
    LifeForm::death();
    max_mana = 0;
    fov = 0;
}