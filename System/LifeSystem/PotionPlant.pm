#!/usr/bin/env perl
package PotionPlant;
use File::Basename;
use lib dirname(__FILE__);
use Scalar::Util qw(looks_like_number);
use Math::Round;
use experimental qw(switch);

use parent qw(Plant);

use HealthPotion;
use ManaPotion;
use ResistancePotion;
use SpeedPotion;
use StrengthPotion;
use SightPotion;

# Parameters:
#   1. String name
#   2. int health,max_health
#   3. double resistance (>=0 & <=1)
#   4. int strength
#   5. int growth_factor
#   6. double potency (>=0 & <=1)
#   7. String potion_stat
#   8. int potion_effect
sub new($$$$$$$$) {
  my($class) = @_;shift;
  my $self = $class->SUPER::new(shift,shift,shift,shift,shift,shift);
  $self->{potion_stat} = shift; # Only to know what type of potion it makes
  $self->{potion_effect} = shift;

  initialize($self);
  bless $self, $class;
  $self;
}

sub initialize {
  my($self) = @_;
  die if looks_like_number($self->{potion_stat});
  die unless looks_like_number($self->{potion_effect});

  $self->{potion_effect} = 0 if $self->{potion_effect} < 0;

  $self->{potion_effect} = round($self->{potion_effect});
}

sub getPotionStat {
  my($self) = @_;
  $self->{potion_stat};
}

sub getPotionEffect {
  my($self) = @_;
  $self->{potion_effect};
}

sub setPotionStat($) {
  my($self, $potion_stat) = @_;
  die if looks_like_number($potion_stat);
  $self->{potion_stat} = $potion_stat;
  $self->{potion_stat};
}

sub setPotionEffect($) {
  my($self, $potion_effect) = @_;
  $self->{potion_stat} = $potion_effect if looks_like_number($potion_effect) &&
    $potion_effect >= 0;
  $self->{potion_stat};
}

sub turnToPotion {
  my($self) = @_;
  given($self->{potion_stat}) {
    when(HealthPotion) {
      $self = new HealthPotion(1, $self->{potency} * $self->{potion_effect} )
    }
    when(ManaPotion) {
      $self = new ManaPotion(1, $self->{potency} * $self->{potion_effect} )
    }
    when(ResistancePotion) {
      $self = new ResistancePotion(1, $self->{potency})
    }
    when(SpeedPotion) {
      $self = new SpeedPotion(1, $self->{potency} * $self->{potion_effect} )
    }
    when(StrengthPotion) {
      $self = new StrengthPotion(1, $self->{potency} * $self->{potion_effect} )
    }
    when(SightPotion) {
      $self = new SightPotion(1, $self->{potency} * $self->{potion_effect} )
    }
  }
  $self;
}

1;
