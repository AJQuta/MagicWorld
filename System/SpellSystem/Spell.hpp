#ifndef SPELL
#define SPELL

extern "C" {
    extern int spell_check(char *);
    extern int *spell_parse(char *);
    extern char *spell_translate(char *);
}

#endif