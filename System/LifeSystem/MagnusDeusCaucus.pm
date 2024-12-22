#!/usr/bin/env perl
package MagnusDeusCaucus;
use File::Basename;
use lib dirname(__FILE__);
use Scalar::Util qw(looks_like_number);

use parent qw(PotionPlant);

# Parameters:
#   1. String name
#   2. int health, max_health
#   3. double resistance (>=0 & <=1)
#   4. int strength
#   5. int growth_factor
#   6. double potency
#   7. int potion_effect
sub new($$$$$$$) {
  my($class) = @_;shift;
  my $self = $class->SUPER::new(shift, shift, shift, shift, shift, shift, StrengthPotion, shift);
  bless $self, $class;
  $self;
}

sub setPotionStat($) {
  my($self, $potion_stat) = @_;
  die if looks_like_number($potion_stat);
  return $self->{potion_stat} unless $potion_stat eq StrengthPotion;
  $self->SUPER::setPotionStat($potion_stat);
}

1;
