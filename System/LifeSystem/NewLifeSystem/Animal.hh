#ifndef ANIMAL
#define ANIMAL

#include "LifeForm.hh"

#define PI 3.1415
#define MAX_FOV 2*PI
#define MIN_FOV 0.0

class Animal : public LifeForm
{
protected:
    unsigned int armor;
    unsigned int mana, max_mana;
    float fov;
    void __verify__();
    void death() override;
public:
    Animal(std::string, unsigned int, float, unsigned int, unsigned int, unsigned int, unsigned int, float);
    ~Animal();
    unsigned int getArmor();
    unsigned int getMana();
    unsigned int getMaxMana();
    float getFOV();
    void setFOV(float f);
};

#endif