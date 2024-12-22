#!/usr/bin/env perl
use File::Basename;
use lib dirname(__FILE__);
use Math::Trig;

use Animal;
use ResistancePotion;
$animal1 = new Animal("Animal1",100,.12,10,14,0,6, 2*pi() / 3);
$animal2 = new Animal("Animal1",100,12,10,14,0,6, 2*pi() / 3);
$potion1 = new ResistancePotion(1,.25);
$potion2 = new ResistancePotion(1,.30);
$potion3 = new ResistancePotion(1,.50);
$potion4 = new ResistancePotion(1,50);
print $animal1->takeDamage(30)."\n";
print $animal1->getResistance."\n";
print $potion1->getStat."\n";
print $potion1->getClass."\n";

print $animal1->useResistancePotion($potion1)."\n";
print $animal1->useResistancePotion($potion1)."\n";
print $animal1->useResistancePotion("oop")."\n";
print $animal1->takeDamage(30)."\n";

print $animal1->usePotion($potion2)."\n";
print $animal1->usePotion($potion2)."\n";
print $animal1->usePotion("oop")."\n";
print $animal1->takeDamage(30)."\n";

print $animal1->usePotion($potion3)."\n";
print $animal1->takeDamage(30)."\n\n";

print $animal2->getResistance."\n\n";

print $potion4->getEffect."\n";
