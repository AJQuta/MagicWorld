#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "spell_parse.h"

int spell_check(char *spell) {
    int i = 0;
    int align = 0;
    int spec_counter = 0;
    int elem_counter = 0;
    char prev_elems[sizeof(ELEMENTS)];
    while (spell[i] != '\0') {
        spell[i] = toupper((unsigned char)spell[i]);
        if (i%2 == 1 - align) {
            if (strchr(DIRECTIONS, spell[i]) == NULL) {
                return 0;
            }
            if (spell[i+1] == SPEC_CHAR) {
                if (spec_counter >= SPEC_LIMIT) {
                    return 0;
                }
                spec_counter++;
            }
        }
        if (i%2 == align) {
            if (i < 2 && spell[i] == SPEC_CHAR) {
                return 0;
            }
            if (spell[i+1] == '\0') {
                return 0;
            }
            if (spell[i] != SPEC_CHAR) {
                if (strchr(ELEMENTS, spell[i]) == NULL) {
                    return 0;
                }  
                if (strchr(prev_elems, spell[i]) != NULL) {
                    return 0;
                }
                if (i != 0) {
                    align = 1 - align;
                    spec_counter = 1;
                } 
                prev_elems[elem_counter++] = spell[i];
            }
        } 
        i++;
    }
    return 1;
}

char *spell_translate(char *spell) {
    if (spell_check(spell) != 1) {
        return NULL;
    }
    char *res = malloc(strlen(spell) * 10);
    char *elem_ptr;
    char *dir_ptr;
    int spec_counter = 0;
    char elem;
    while (*spell != '\0') {
        *spell = toupper((unsigned char)*spell);
        elem_ptr = strchr(ELEMENTS, *spell);
        if (elem_ptr != NULL) {
            elem = *spell;
            strcat(res, TRANSLATE_ELEM[elem_ptr - (char *)ELEMENTS]);
            spec_counter = 0;
        }
        dir_ptr = strchr(DIRECTIONS, *spell);
        if (dir_ptr != NULL) {
            strcat(res, TRANLATE_DIR[dir_ptr - (char *)DIRECTIONS]);
        }
        if (*spell == SPEC_CHAR) {
            switch (elem) {
                case 'F':
                    strcat(res, FIRE_TIERS[spec_counter]);
                    break;
                case 'S':
                    strcat(res, WATER_TIERS[spec_counter]);
                    break;
                case 'R':
                    strcat(res, ROCK_TIERS[spec_counter]);
                    break;
                case 'W':
                    strcat(res, WIND_TIERS[spec_counter]);
                    break;
                case 'L':
                    strcat(res, LIGHT_TIERS[spec_counter]);
                    break;
                case 'D':
                    strcat(res, DARK_TIERS[spec_counter]);
                    break;
                case 'N':
                    strcat(res, NULL_TIERS[spec_counter]);
                    break;
                case 'K':
                    strcat(res, KI_TIERS[spec_counter]);
                    break;
            }
            spec_counter++;
        }
        strcat(res, " ");
        spell++;
    }

    return res;
}

int *spell_parse(char *spell) {
    int *res = calloc(8, sizeof(int));
    if (res == NULL) {
        return NULL;
    }

    if (spell_check(spell) != 1) {
        free(res);
        return NULL;
    }

    char *elem_ptr;
    int *prof_counter;
    while (*spell != '\0') {
        *spell = toupper((unsigned char)*spell);
        elem_ptr = strchr(ELEMENTS, *spell);
        if (elem_ptr != NULL) {
            prof_counter = &res[elem_ptr - ELEMENTS];
        }

        if (*spell == 'Y') {
            (*prof_counter)++;
        }
        spell++;
    }

    return res;
}
