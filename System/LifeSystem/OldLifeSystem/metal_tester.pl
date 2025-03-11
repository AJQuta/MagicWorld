use File::Basename;
use lib dirname(__FILE__);
use feature qw(say);

use Metal;
use Jolik;
$metal1 = new Metal("metalloid", 12, 14, 8, 1.6, 0.7, 4.3);
say $metal1->getName;
say $metal1->getWeight;
say $metal1->getConductivity;
say $metal1->setName("Metallic Creature");
say $metal1->setWeight(280);
say $metal1->setStrength(-90);
say $metal1->setConductivity(5);
say $metal1->setLustre(4.8)."\n";

$metal2 = new Jolik("Mesa", 2, 3, 2, 1.4, 1.2, 3.8);
say $metal2->getName;
say $metal2->getWeight;
say $metal2->getMagnetism;
say $metal2->getConductivity;
say $metal2->getLustre;
say $metal2->setName("Tojnir");
say $metal2->setStrength(-90);
