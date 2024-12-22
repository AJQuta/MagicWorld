#include <iostream>
#include <string>
#include "SpellProficiency.hpp"

namespace Spells {
    class SpellProficiency {
        private:
            static const int NUM_PROFS = 8;
            static const int MAX_PROF = 3;
            static const int MIN_PROF = 0;

            int *profs;

            void setProf(int *, int);
        public:
            SpellProficiency(int=0,int=0,int=0,int=0,int=0,int=0,int=0,int=0);
            SpellProficiency(int *);
            ~SpellProficiency();

            static std::string translateSpell(std::string);
            bool canCast(std::string);
            std::string showProficiencies();
    };

    void SpellProficiency::setProf(int *prof, int new_prof) {
        if (new_prof > MAX_PROF) {
            new_prof = MAX_PROF;
        }
        if (new_prof < MIN_PROF) {
            new_prof = MIN_PROF;
        }
        *prof = new_prof; 
    }

    SpellProficiency::SpellProficiency(int f, int s, int r,
                                        int w, int l, int d,
                                        int n, int k)
    {
        profs = new int[NUM_PROFS];
        int ins[NUM_PROFS] = {f,s,r,w,l,d,n,k};
        for (int i = 0; i < NUM_PROFS; i++) {
            SpellProficiency::setProf(&profs[i], ins[i]);
        }
    }

    SpellProficiency::SpellProficiency(int *ins)
    {
        profs = new int[NUM_PROFS];
        for (int i = 0; i < NUM_PROFS; i++) {
            SpellProficiency::setProf(&profs[i], ins[i]);
        }
    }

    SpellProficiency::~SpellProficiency()
    {
        free(profs);
    }

    std::string SpellProficiency::translateSpell(std::string spell) {
        char *ptr = spell_translate(&spell[0]);
        if (ptr == NULL) {
            return "";
        }
        std::string res = ptr;
        free(ptr);
        return res;
    }

    bool SpellProficiency::canCast(std::string spell) {
        if (spell_check(&spell[0]) != 1) {
            return false;
        }
        int *prof_reqs = spell_parse(&spell[0]);
        for (int i = 0; i<NUM_PROFS; i++) {
            if (prof_reqs[i] > profs[i]) {
                free(prof_reqs);
                return false;
            }
        }
        free(prof_reqs);

        return true;
    }

    std::string SpellProficiency::showProficiencies() {
        return "Fire: " + std::to_string(profs[0]) + "\n"
        + "Water: " + std::to_string(profs[1]) + "\n"
        + "Rock: " + std::to_string(profs[2]) + "\n"
        + "Wind: " + std::to_string(profs[3]) + "\n"
        + "Light: " + std::to_string(profs[4]) +"\n"
        + "Dark: " + std::to_string(profs[5]) + "\n"
        + "Null: " + std::to_string(profs[6]) + "\n"
        + "Ki: " + std::to_string(profs[7]);
    }
}

using namespace Spells;
using namespace std;

int main(int argc, char **argv)
{
    if (argc != 2) {
        cout << "Incorrect Number of Arguments" << endl;
        return 0;
    }

    string spell = argv[1];
    cout << spell << endl;
    cout << SpellProficiency(1,2,3).canCast(spell) << endl;
    cout << SpellProficiency::translateSpell(spell) << endl;
    cout << spell << endl;
    return 0;
}
