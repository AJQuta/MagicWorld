#!/usr/bin/env perl
use File::Basename;
use lib dirname(__FILE__);
use Math::Trig;

use Animal;
use ManaPotion;
$animal1 = new Animal("Animal1",100,.12,10,14,7,6, 2*pi() / 3);
$potion1 = new ManaPotion(1,3);
$potion2 = new ManaPotion(1,2);
$potion3 = new ManaPotion(1,4);
print $animal1->getMana."\n";
$animal1->attack;
print $animal1->getMana."\n";
$animal1->attack;
print $animal1->getMana."\n";
$animal1->attack;
print $animal1->getMana."\n";
print $animal1->recoverMana( $potion1->use )."\n";
$animal1->attack;
print $animal1->getMana."\n";
$animal1->attack;
print $animal1->getMana."\n";
print $animal1->recoverMana( $potion1->use )."\n";
print $potion1->getStat."\n";
print $potion1->getClass."\n";

$animal1->attack;$animal1->attack;$animal1->attack;
print $animal1->getMana."\n";
print $animal1->useManaPotion($potion2)."\n";

$animal1->attack;
print $animal1->getMana."\n";
print $animal1->usePotion($potion3)."\n\n";

$potion4 = new ManaPotion(5,2);
$potion5 = new ManaPotion(3,8);

print $potion4->getCharges." ".$potion4->getEffect."\n";
print $potion5->getCharges." ".$potion5->getEffect."\n\n";

$potion5->combinePotions([$potion4]);

print $potion4->getCharges." ".$potion4->getEffect."\n";
print $potion5->getCharges." ".$potion5->getEffect."\n\n";

$potion4->combinePotions([$potion5]);

print $potion4->getCharges." ".$potion4->getEffect."\n";
print $potion5->getCharges." ".$potion5->getEffect."\n";
