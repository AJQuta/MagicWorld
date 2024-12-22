#include <iostream>
#include <string>
#include "Spell.hpp"

namespace Spells {
    class Spell {
        private:
            static const int MIN_REQ = 0;
            static const int MAX_REQ = 3;
            int *reqs;
        public:
            Spell(int f,int s,int r,int w,int l,int d,int n,int k) : Spell(new int[8]{f,s,r,w,l,d,n,k}) {};
            Spell(int *);
            Spell(std::string);
            ~Spell();
        };
        
        Spell::Spell(int f, int s, int r, int w, int l, int d, int n, int k) {
            int ins[] = {f,s,r,w,l,d,n,k};
            reqs = new int[8];
            for (int i = 0; i < 8; i++) {
                reqs[i] = ins[i];
            }
        }

        Spell::Spell(int *ins) {
            reqs = new int[8];
            for (int i = 0; i < 8; i++) {
                reqs[i] = ins[i];
            }
        }

        Spell::Spell(std::string spell) {
            int *ins = spell_parse(&spell[0]);
            reqs = new int[8];
            for (int i=0; i < 8; i++) {
                reqs[i] = ins[i];
            }
        }
        
        Spell::~Spell()
        {
            free(reqs);
        }
    
}