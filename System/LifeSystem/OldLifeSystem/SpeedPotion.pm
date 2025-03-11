#!/usr/bin/env perl
package SpeedPotion;
use File::Basename;
use lib dirname(__FILE__);
use Scalar::Util qw(looks_like_number);
use Math::Round;

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
  $self->{effect} = 20 if $self->{effect} > 20;
  $self->{effect} = round($self->{effect});
}

1;
