#!/usr/bin/env perl
use File::Basename;
use lib dirname(__FILE__);
use Math::Trig;

use Animal;

$animal1 = new Animal("Wolf1", 100, .1, 18, 8, 6, 3, 2*pi() / 3 );
$animal2 = new Animal("Wolf2", 100, .08, 16, 10, 7, 5, 2*pi() / 3);
$count=0;
while ($animal1->getHealth > 0 && $animal2->getHealth > 0) {
  $count++;
  print $animal1->getName . ": ".$animal1->getHealth.", ".$animal1->getMana. " ; ";
  print $animal2->getName . ": ".$animal2->getHealth.", ".$animal2->getMana. "\n";

  $animal2->takeDamage( $animal1->attack );
  $animal1->takeDamage( $animal2->attack );
  if($count % 5 == 0) {
    $animal1->recoverHealth( int rand(21) );
    $animal2->recoverHealth( int rand(21) );
  }
}
print $animal1->getName . ": ".$animal1->getHealth.", ".$animal1->getMana. " ; ";
print $animal2->getName . ": ".$animal2->getHealth.", ".$animal2->getMana. "\n";
