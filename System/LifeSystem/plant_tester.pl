#!/usr/bin/env perl
use File::Basename;
use lib dirname(__FILE__);

use Plant;
$plant1 = new Plant("Plant 1",100,.04,4,13,.8);
$plant2 = new Plant("Plant 2",60,.08,9,8,.6);
while ($plant1->getHealth > 0 && $plant2->getHealth > 0) {
  $count++;
  print $plant1->getName . ": ".$plant1->getHealth. " ; ";
  print $plant2->getName . ": ".$plant2->getHealth. "\n";

  $plant2->takeDamage( $plant1->attack );
  $plant1->takeDamage( $plant2->attack );
  if($count % 3 == 0) {
    $plant1->growth;
    $plant2->growth;
  }
}
print $plant1->getName . ": ".$plant1->getHealth." ; ";
print $plant2->getName . ": ".$plant2->getHealth."\n";
# print $plant1."\n";
# print $plant1->getName."\n";
# print $plant1->setSpeed(10)."\n";
# print $plant1->getResistance."\n";
# print $plant1->getGrowFactor."\n";
# print $plant1->getPotency."\n";
# print $plant1->attack."\n";
# print $plant1->takeDamage(10)."\n";
# print $plant1->growth."\n";
