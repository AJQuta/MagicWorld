#!/usr/bin/env perl
package Hward;

use File::Basename;
use lib dirname(__FILE__);
use parent qw(Metal);

=begin Classifications
  low: weight, lustre
  slight: conductivity
  relative: strength, rarity
  great:
  high: magnetism
=cut

=begin Parameters
  1. String name
  2. int weight >=0 && <=3
  3. int strength >=5 && <=10
  4. int rarity >=6 && <=12
  5. double magnetism (>=1.4 && <=2)
  6. double conductivity (>=0 && <=0.8)
  7. double lustre (>=0 && <=0.4)
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
  $self->{name} = "Hward ".$self->{name};
  $self->{weight} = 3 if $self->{weight} > 3;
  $self->{strength} = 5 if $self->{strength} < 5;
  $self->{strength} = 10 if $self->{strength} > 10;
  $self->{rarity} = 6 if $self->{rarity} < 6;
  $self->{rarity} = 12 if $self->{rarity} > 12;
  $self->{magnetism} = 1.4 if $self->{magnetism} < 1.4;
  $self->{conductivity} = 0.8 if $self->{conductivity} > 0.8;
  $self->{lustre} = 0.4 if $self->{lustre} > 0.4;
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
