#!/usr/bin/env perl
# Required statements to add directory to @INC (PATH)
use File::Basename;
use lib dirname(__FILE__);

use packaging_my_life;
$person1 = new Person("Adel",69,59);

## Weird way
print $person1->getClass()."\n";
print $person1."\n";
print $person1->getName()."\n";
print $person1->getHeight()."\n";
print $person1->getWeight()."\n";
$person1->setName("Nadel")."\n";
print $person1->getName()."\n";
$person1->setHeight(70)."\n";
print $person1->getHeight()."\n";
$person1->setWeight(56)."\n";
print $person1->getWeight()."\n";
print "\n";

## Or the converse weird way
$test = getClass $person1;
print $test."\n"; # For some reason it requires that it be set to a
# variable first
$test = getName $person1;
print $test."\n";
$test = getHeight $person1;
print $test."\n";
$test = getWeight $person1;
print $test."\n";
print "\n";
print scalar getClass $person1 ."\n"; # Or you can use scalar/array/hash/etc.
print scalar getName $person1 ."\n";
print scalar getHeight $person1 ."\n";
print scalar getWeight $person1 ."\n";
print scalar setName $person1("Guess Who's Back!!") ."\n";
print scalar (setHeight $person1(60)) ."\n"; # Watch out here, parenthesis must
#  be added or else a newline character will be added to the parameter
print scalar (setWeight $person1(48)) ."\n";
# print "hello";
print scalar getWeight $person1 ."\n";
print scalar getHeight $person1 ."\n";
