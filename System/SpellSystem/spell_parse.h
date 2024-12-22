#ifndef SPELL_PARSE 
#define SPELL_PARSE

char ELEMENTS[] = {'F','S','R','W','L','D','N','K', '\0'};
char DIRECTIONS[] = {'O','U','E', '\0'};
char SPEC_CHAR = 'Y';
int SPEC_LIMIT = 3;

int spell_check(char *);

char *TRANSLATE_ELEM[] = {
    "Fire",
    "Water",
    "Rock",
    "Wind",
    "Light",
    "Dark",
    "Null",
    "Ki"
};

char *TRANLATE_DIR[] = {
    "wide",
    "focused",
    "self"
};

char *FIRE_TIERS[] = {
    "to burn",
    "to melt",
    "to destroy"
};

char *WATER_TIERS[] = {
    "to flow",
    "to freeze",
    "to create"
};

char *ROCK_TIERS[] = {
    "to harden",
    "to sharpen",
    "to construct"
};

char *WIND_TIERS[] = {
    "to move",
    "to search",
    "to weather"
};

char *LIGHT_TIERS[] = {
    "to lighten",
    "to heal",
    "to purify"
};

char *DARK_TIERS[] = {
    "to darken",
    "to plague",
    "to corrupt"
};

char *NULL_TIERS[] = {
    "to delete",
    "to remove",
    "to annul"
};

char *KI_TIERS[] = {
    "to motivate",
    "to protect",
    "to unify"
};

int NUM_CHARS = 200;


char *spell_translate(char *);
int *spell_parse(char *);

#endif