#!/usr/bin/env perl
use File::Basename;
use lib dirname(__FILE__);
use Math::Trig;

use Animal;
use HealthPotion;
$animal1 = new Animal("Animal1",100,0.12,10,14,7,6, 2*pi() / 3);
$potion1 = new HealthPotion(1,25);
$potion2 = new HealthPotion(1,30);
$potion3 = new HealthPotion(1,20);
print $animal1->takeDamage(40)."\n";
print $animal1->recoverHealth( $potion1->use )."\n";
print $animal1->recoverHealth( $potion1->use )."\n";
print $potion1->getStat."\n";
print $potion1->getClass."\n";

print $animal1->takeDamage(50)."\n";
print $animal1->useHealthPotion($potion2)."\n";
print $animal1->useHealthPotion($potion2)."\n";
print $animal1->useHealthPotion("oop")."\n";

print $animal1->takeDamage(30)."\n";
print $animal1->usePotion($potion3)."\n";
print $animal1->usePotion($potion3)."\n";
print $animal1->usePotion("oop")."\n\n";

$potion4 = new HealthPotion(4,50);
$potion5 = new HealthPotion(1,56);

print $potion4->getCharges." ".$potion4->getEffect."\n";
print $potion5->getCharges." ".$potion5->getEffect."\n\n";

$potion5->combinePotions([$potion4]);

print $potion4->getCharges." ".$potion4->getEffect."\n";
print $potion5->getCharges." ".$potion5->getEffect."\n\n";

$potion4->combinePotions([$potion5]);

print $potion4->getCharges." ".$potion4->getEffect."\n";
print $potion5->getCharges." ".$potion5->getEffect."\n";
