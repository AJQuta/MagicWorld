#!/usr/bin/env perl
use File::Basename;
use lib dirname(__FILE__);
use Math::Trig;

use Humanoid;
$humanoid1 = new Humanoid("Humanoid1",100,0.20,20,20,20,8,2*pi()/3,0,0,20,20,100);
print "50 ".$humanoid1->takeDamage(50)." ".$humanoid1->getStamina."\n";
print "50 ".$humanoid1->takeDamage(50)." ".$humanoid1->getStamina."\n";
print $humanoid1->attack." ".$humanoid1->getHealth." ".$humanoid1->getStamina."\n";
print $humanoid1->attack." ".$humanoid1->getHealth." ".$humanoid1->getStamina."\n";
print $humanoid1->attack." ".$humanoid1->getHealth." ".$humanoid1->getStamina."\n";
