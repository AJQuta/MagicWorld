#ifndef SPELL_PROF
#define SPELL_PROF

extern "C" {
    extern int spell_check(char *);
    extern char *spell_translate(char *);
    extern int *spell_parse(char *);
}

#endif