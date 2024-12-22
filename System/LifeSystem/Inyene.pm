#!/usr/bin/env perl
package Inyene;

use File::Basename;
use lib dirname(__FILE__);
use parent qw(Metal);

=begin Classifications
  low: magnetism
  slight: weight, strength
  relative: rarity
  great:
  high: conductivity, lustre
=cut

=begin Parameters
  1. String name
  2. int weight >=2 && <=5
  3. int strength >=2 && <=6
  4. int rarity >=6 && <=10
  5. double magnetism (>=0.2 && <=0.3)
  6. double conductivity (>=1.6 && <=2)
  7. double lustre (>=4.3 && <=5)
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
  $self->{name} = "Inyene ".$self->{name};
  $self->{weight} = 2 if $self->{weight} < 2;
  $self->{weight} = 5 if $self->{weight} > 5;
  $self->{strength} = 2 if $self->{strength} < 2;
  $self->{strength} = 6 if $self->{strength} > 6;
  $self->{rarity} = 6 if $self->{rarity} < 6;
  $self->{rarity} = 12 if $self->{rarity} > 10;
  $self->{magnetism} = 0.2 if $self->{magnetism} < 0.2;
  $self->{magnetism} = 0.3 if $self->{magnetism} > 0.3;
  $self->{conductivity} = 1.6 if $self->{conductivity} < 1.6;
  $self->{lustre} = 4.3 if $self->{lustre} < 4.3;
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
