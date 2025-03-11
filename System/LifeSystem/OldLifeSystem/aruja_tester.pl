#!/usr/bin/env perl
use File::Basename;
use lib dirname(__FILE__);

use Aruja;
$aruja1 = new Aruja("Silb Aruja",43,.09,7,3,.98,10);

print $aruja1."\n";
print $aruja1->getName."\n";
print $aruja1->getPotionStat."\n";
print $aruja1->getGrowFactor."\n";
# print $aruja1->setPotionStat(ResistancePotion)."\n\n";

$potion1 = $aruja1->turnToPotion;
print $aruja1->turnToPotion ."\n";
print $potion1."\n";
print $aruja1."\n";
# print $aruja1->getCharges."\n";

print $potion1->getStat ."\n";
print $potion1->getCharges."\n";
print $potion1->getEffect."\n\n";
#
$aruja1 = $potion1;
print $aruja1->getStat ."\n";
print $aruja1->getCharges ."\n";
print $aruja1->getEffect ."\n";
