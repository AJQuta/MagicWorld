#!/usr/bin/env perl
use File::Basename;
use lib dirname(__FILE__);

use LifeForm;
$person1 = new LifeForm("Adel Quta",100,.02,"8",3);
# print $person1->getName."\n";
# print $person1->getHealth."\n";
# print $person1->getResistance."\n";
# print $person1->getSpeed."\n";
# print $person1->getStrength."\n";
print $person1->setName("Being 1")."\n";
# print $person1->setHealth(92)."\n";
print $person1->setMaxHealth(92)."\n";
print $person1->setResistance(.10)."\n";
print $person1->setSpeed(7)."\n";
print $person1->setStrength(14)."\n\n";
# print $person1->takeDamage(1000)."\n";
# print $person1->attack."\n";
$person2 = new LifeForm("Being 2",100,.12,4,15);
while ($person1->getHealth > 0 && $person2->getHealth > 0) {
  print "Person 2 : ".$person2->takeDamage( $person1->attack ) . "\n";
  print "Person 1 : ".$person1->takeDamage( $person2->attack ) . "\n";
}
print "\nPerson 1 : ".$person1->getName.", ".$person1->getMaxHealth.", ".$person1->getHealth."\n";
print "Person 2 : ".$person2->getName.", ".$person2->getMaxHealth.", ".$person2->getHealth."\n";
