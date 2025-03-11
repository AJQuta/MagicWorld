#!/usr/bin/env perl
package SightPotion;
use File::Basename;
use lib dirname(__FILE__);
use Scalar::Util qw(looks_like_number);
use Math::Trig;

use parent qw(Potion);

# Parameters:
#   1. int charges
#   2. int effect
sub new($$) {
  my($class) = @_; # Don't shift so it sends status name to super class.
  my $self = $class->SUPER::new(shift,shift,shift);

  initialize($self);
  bless $self, $class;
  $self;
}

sub initialize {
  my($self) = @_;
  # Parent Class already checks if effect less than 0.
  $self->{effect} = (2*pi()) if $self->{effect} > (2*pi());
}

sub setEffect($) {
  my($self, $effect) = @_;
  $self->{effect} = $effect if looks_like_number($effect);
  $self->{effect} = 0 if $self->{effect} < 0;
  $self->{effect} = (2*pi()) if $self->{effect} > (2*pi());
  $self->{effect};
}

1;
