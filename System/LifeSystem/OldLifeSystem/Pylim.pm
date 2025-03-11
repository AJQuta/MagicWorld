#!/usr/bin/env perl
package Pylim;

use File::Basename;
use lib dirname(__FILE__);
use parent qw(Metal);

=begin Classifications
  low: conductivity
  slight: lustre
  relative:
  great:
  high: weight, strength, rarity, magnetism
=cut

=begin Parameters
  1. String name
  2. int weight >=16 && <=20
  3. int strength >=15 && <=20
  4. int rarity >=16 && <=20
  5. double magnetism (>=1.6 && <=2)
  6. double conductivity (>=0 && <=0.3)
  7. double lustre (>=1 && <=1.4)
=cut
sub new($$$$$$$) {
  my($class) = @_;shift;
  my $self = $class->SUPER::new(shift,shift,shift,shift,shift,shift,shift);
  initialize($self);
  bless $self, $class;
  $self;
}

sub initialize {
  my($self) = @_;
  $self->{name} = "Pylim ".$self->{name};
  $self->{weight} = 16 if $self->{weight} < 16;
  $self->{strength} = 15 if $self->{strength} < 15;
  $self->{rarity} = 16 if $self->{rarity} < 16;
  $self->{magnetism} = 1.6 if $self->{magnetism} < 1.6;
  $self->{conductivity} = 0.3 if $self->{conductivity} > 0.3;
  $self->{lustre} = 1 if $self->{lustre} < 1;
  $self->{lustre} = 1.4 if $self->{lustre} > 1.4;
}

sub setName($) {
  my($self, $name) = @_;
  $self->SUPER::setName($name);
  initialize($self);
  $self->{name};
}

sub setWeight($) {
  my($self, $value) = @_;
  $self->SUPER::setWeight($value);
  initialize($self);
  $self->{weight};
}

sub setStrength($) {
  my($self, $value) = @_;
  $self->SUPER::setStrength($value);
  initialize($self);
  $self->{strength};
}

sub setRarity($) {
  my($self, $value) = @_;
  $self->SUPER::setRarity($value);
  initialize($self);
  $self->{rarity};
}

sub setMagnetism($) {
  my($self, $value) = @_;
  $self->SUPER::setMagnetism($value);
  initialize($self);
  $self->{magnetism};
}

sub setConductivity($) {
  my($self, $value) = @_;
  $self->SUPER::setConductivity($value);
  initialize($self);
  $self->{conductivity};
}

sub setLustre($) {
  my($self, $value) = @_;
  $self->SUPER::setLustre($value);
  initialize($self);
  $self->{lustre};
}

1;
