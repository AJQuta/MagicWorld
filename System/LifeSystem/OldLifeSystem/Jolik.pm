#!/usr/bin/env perl
package Jolik;

use File::Basename;
use lib dirname(__FILE__);
use parent qw(Metal);

=begin Classifications
  low: strength, rarity, magnetism
  slight: weight
  relative: conductivity
  great:
  high: lustre
=cut

=begin Parameters
  1. String name
  2. int weight <=5
  3. int strength <=4
  4. int rarity <=2
  5. double magnetism (>=0 && <=0.1)
  6. double conductivity (>=0.8 && <=1.2)
  7. double lustre (>=3.8 && <=4.4)
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
  $self->{name} = "Jolik ".$self->{name};
  $self->{weight} = 5 if $self->{weight} > 5;
  $self->{strength} = 4 if $self->{strength} > 4;
  $self->{rarity} = 2 if $self->{rarity} > 2;
  $self->{magnetism} = 0.1 if $self->{magnetism} > 0.1;
  $self->{conductivity} = 0.8 if $self->{conductivity} < 0.8;
  $self->{conductivity} = 1.2 if $self->{conductivity} > 1.2;
  $self->{lustre} = 3.8 if $self->{lustre} < 3.8;
  $self->{lustre} = 4.4 if $self->{lustre} > 4.4;
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
