#!/usr/bin/env perl
package Animal;
use File::Basename;
use lib dirname(__FILE__);
use Math::Trig;
use Math::Round;
use Scalar::Util qw(looks_like_number); # Still needs this even if
#  it is imported in super class
use experimental qw(switch);

use parent qw(LifeForm);

# Parameters:
#   1. String name
#   2. int health,max_health
#   3. double resistance (>=0 & <=1)
#   4. int speed
#   5. int strength
#   6. int armor
#   7. int mana,max_mana
#   8. double field of view
sub new($$$$$$$$) {
  my($class) = @_;shift;
  my $self = $class->SUPER::new(shift, shift, shift, shift, shift);
  $self->{armor} = shift;
  $self->{mana} = @_[0];
  $self->{max_mana} = shift;
  $self->{field_of_view} = shift;
  initialize($self);
  bless $self, $class;
  $self;
}

sub initialize {
  my($self) = @_;
  die unless looks_like_number($self->{armor});
  die unless looks_like_number($self->{mana});
  die unless looks_like_number($self->{field_of_view});

  $self->{armor} = 0 if $self->{armor} < 0;
  $self->{armor} = 20 if $self->{armor} > 20;
  $self->{mana} = 0 if $self->{mana} < 0;
  $self->{mana} = 20 if $self->{mana} > 20;
  $self->{field_of_view} = 0 if $self->{field_of_view} < 0;
  $self->{field_of_view} = (2*pi()) if $self->{field_of_view} > (2*pi());

  $self->{armor} = round($self->{armor});
  $self->{mana} = round($self->{mana});
  $self->{max_mana} = $self->{mana};
}

sub getArmor {
  my($self) = @_;
  $self->{armor};
}

sub getMana {
  my($self) = @_;
  $self->{mana};
}

sub getMaxMana {
  my($self) = @_;
  $self->{max_mana};
}

sub getFOV {
  my($self) = @_;
  $self->{field_of_view};
}

sub setArmor($) {
  my($self, $armor) = @_;
  $self->{armor} = $armor if looks_like_number($armor);
  $self->{armor} = 0 if $self->{armor} < 0;
  $self->{armor} = 20 if $self->{armor} > 20;
  $self->{armor} = round($self->{armor});
  $self->{armor};
}

sub setMana($) {
  my($self, $mana) = @_;
  $self->{mana} = $mana if looks_like_number($mana);
  $self->{mana} = 0 if $self->{mana} < 0;
  $self->{mana} = 20 if $self->{mana} > 20;
  $self->{mana} = round($self->{mana});
  $self->{max_mana} = $self->{mana} if $self->{mana} > $self->{max_mana};
  $self->{mana};
}

sub setMaxMana($) {
  my($self, $max_mana) = @_;
  $self->{max_mana} = $max_mana if looks_like_number($max_mana);
  $self->{max_mana} = 0 if $self->{max_mana} < 0;
  $self->{max_mana} = 20 if $self->{max_mana} > 20;
  $self->{max_mana} = round($self->{max_mana});
  $self->{mana} = $self->{max_mana} if $self->{mana} > $self->{max_mana};
  $self->{max_mana};
}

sub setFOV($) {
  my($self, $field_of_view) = @_;
  $self->{field_of_view} = $field_of_view if looks_like_number($field_of_view);
  $self->{field_of_view} = 0 if $self->{field_of_view} < 0;
  $self->{field_of_view} = (2*pi()) if $self->{field_of_view} > (2*pi());
  $self->{field_of_view};
}

sub death {
  my($self) = @_;
  $self->SUPER::death();
  $self->setMaxMana(0);
  $self->setFOV(0);
}

sub takeDamage($) {
  my($self,$damage) = @_;
  return $self->{health} unless looks_like_number($damage) && $damage > 0;
  ($damage > $self->{armor}) ? ($damage-=$self->{armor}) : ($damage = 0);
  $self->SUPER::takeDamage($damage);
}

sub attack {
  my($self) = @_;
  if ($self->{health}>0 && $self->{mana}>0) {
    $attack = round( ((rand(1) * $self->{speed}) + (rand(1)*$self->{strength})) *
      ($self->{field_of_view} / pi()) );
    $self->{mana}--;
    return $attack;
  } elsif ($self->{health}>0) {
    ($self->{health} > $self->{max_health}/2) ? ($self->recoverMana(2)) : ($self->recoverMana(1));
    int($self->SUPER::attack * ($self->{field_of_view} / pi()));
  } else {
    0;
  }
}

sub recoverAllMana {
  my($self) = @_;
  $self->{mana} = $self->{max_mana};
  $self->{mana};
}

sub recoverMana($) {
  my($self, $recover) = @_;
  $self->{mana}+=$recover if looks_like_number($recover) && $recover >= 0;
  return $self->recoverAllMana if ($self->{mana} > $self->{max_mana});
  $self->{mana};
}

sub useHealthPotion($) {
  my($self, $health_potion) = @_;
  die $health_potion." is not a Health Potion" if ref $health_potion ne HealthPotion;
  $self->recoverHealth( $health_potion->use );
}

sub useManaPotion($) {
  my($self, $mana_potion) = @_;
  die $mana_potion." is not a Mana Potion" if ref $mana_potion ne ManaPotion;
  $self->recoverMana( $mana_potion->use );
}

sub useResistancePotion($) {
  my($self, $sight_potion) = @_;
  die $sight_potion." is not a Resistance Potion" if ref $sight_potion ne ResistancePotion;
  $self->setResistance($self->{sight}+$sight_potion->use);
}

sub useSpeedPotion($) {
  my($self, $speed_potion) = @_;
  die $speed_potion." is not a Speed Potion" if ref $speed_potion ne SpeedPotion;
  $self->setSpeed($self->{speed}+$speed_potion->use);
}

sub useStrengthPotion($) {
  my($self, $strength_potion) = @_;
  die $strength_potion." is not a Strength Potion" if ref $strength_potion ne StrengthPotion;
  $self->setStrength($self->{strength}+$strength_potion->use);
}

sub useSightPotion($) {
  my($self, $sight_potion) = @_;
  die $sight_potion." is not a Sight Potion" if ref $sight_potion ne SightPotion;
  $self->setFOV($self->{field_of_view}+$sight_potion->use);
}

sub usePotion($) {
  my($self, $potion) = @_;
  given( ref $potion ){
    when(HealthPotion) {return $self->useHealthPotion($potion)}
    when(ManaPotion) {return $self->useManaPotion($potion)}
    when(ResistancePotion) {return $self->useResistancePotion($potion)}
    when(SpeedPotion) {return $self->useSpeedPotion($potion)}
    when(StrengthPotion) {return $self->useStrengthPotion($potion)}
    when(SightPotion) {return $self->useSightPotion($potion)}
  }
  $potion." is not a valid potion";
}

1;
