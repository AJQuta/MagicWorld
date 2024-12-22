#!/usr/bin/env perl
package Humanoid;
use File::Basename;
use lib dirname(__FILE__);
use Scalar::Util qw(looks_like_number);
use Math::Round;

use parent qw(Animal);

=begin Parameters
  1. String name
  2. int health,max_health
  3. double resistance (>=0 & <=1)
  4. int speed
  5. int strength
  6. int armor
  7. int mana,max_mana
  8. double field of view (>=0 & <=2π)
  9. int height
  10. int weight
  11. int intelligence
  12. int evasion
  13. int stamina
=cut
sub new($$$$$$$$$$$$$) {
  my($class) = @_;shift;
  my $self = $class->SUPER::new(shift,shift,shift,shift,shift,shift,shift,shift);
  $self->{height} = shift;
  $self->{weight} = shift;
  $self->{intelligence} = shift;
  $self->{evasion} = shift;
  $self->{stamina} = @_[0];
  $self->{max_stamina} = shift;
  initialize($self);
  bless $self, $class;
  $self;
}

sub initialize {
  my($self) = @_;
  die unless looks_like_number($self->{height});
  die unless looks_like_number($self->{weight});
  die unless looks_like_number($self->{intelligence});
  die unless looks_like_number($self->{stamina});

  $self->{height} = 0 if $self->{height} < 0;
  $self->{height} = 20 if $self->{height} > 20;
  $self->{weight} = 0 if $self->{weight} < 0;
  $self->{weight} = 20 if $self->{weight} > 20;
  $self->{intelligence} = 0 if $self->{intelligence} < 0;
  $self->{intelligence} = 20 if $self->{intelligence} > 20;
  $self->{evasion} = 0 if $self->{evasion} < 0;
  $self->{evasion} = 20 if $self->{evasion} > 20;
  $self->{stamina} = 0 if $self->{stamina} < 0;
  $self->{stamina} = 100 if $self->{stamina} > 100;

  $self->{height} = round($self->{height});
  $self->{weight} = round($self->{weight});
  $self->{intelligence} = round($self->{intelligence});
  $self->{evasion} = round($self->{evasion});
  $self->{stamina} = round($self->{stamina});
  $self->{max_stamina} = $self->{stamina};
}

sub getHeight {
  my($self) = @_;
  $self->{height};
}

sub getWeight {
  my($self) = @_;
  $self->{weight};
}

sub getIntelligence {
  my($self) = @_;
  $self->{intelligence};
}

sub getEvasion {
  my($self) = @_;
  $self->{evasion};
}

sub getStamina {
  my($self) = @_;
  $self->{stamina};
}

sub getMaxStamina {
  my($self) = @_;
  $self->{max_stamina};
}

sub setHeight($) {
  my($self, $height) = @_;
  $self->{height} = $height if looks_like_number($height);
  $self->{height} = 0 if $self->{height} < 0;
  $self->{height};
}

sub setWeight($) {
  my($self, $weight) = @_;
  $self->{weight} = $weight if looks_like_number($weight);
  $self->{weight} = 0 if $self->{weight} < 0;
  $self->{weight};
}

sub setIntelligence($) {
  my($self, $intelligence) = @_;
  $self->{intelligence} = $intelligence if looks_like_number($intelligence);
  $self->{intelligence} = 0 if $self->{intelligence} < 0;
  $self->{intelligence} = 20 if $self->{intelligence} > 20;
  $self->{intelligence} = round($self->{intelligence});
  $self->{intelligence};
}

sub setEvasion($) {
  my($self, $evasion) = @_;
  $self->{evasion} = $evasion if looks_like_number($evasion);
  $self->{evasion} = 0 if $self->{evasion} < 0;
  $self->{evasion} = 20 if $self->{evasion} > 20;
  $self->{evasion} = round($self->{evasion});
  $self->{evasion};
}

sub setStamina($) {
  my($self, $stamina) = @_;
  $self->{stamina} = $stamina if looks_like_number($stamina);
  $self->{stamina} = 0 if $self->{stamina} < 0;
  $self->{stamina} = 100 if $self->{stamina} > 100;
  $self->{stamina} = round($self->{stamina});
  $self->{max_stamina} = $self->{stamina} if $self->{stamina} > $self->{max_stamina};
  $self->{stamina};
}

sub setMaxStamina($) {
  my($self, $max_stamina) = @_;
  $self->{max_stamina} = $max_stamina if looks_like_number($max_stamina);
  $self->{max_stamina} = 0 if $self->{max_stamina} < 0;
  $self->{max_stamina} = 100 if $self->{max_stamina} > 100;
  $self->{max_stamina} = round($self->{max_stamina});
  $self->{stamina} = $self->{max_stamina} if $self->{stamina} > $self->{max_stamina};
  $self->{max_stamina};
}

sub death {
  my($self) = @_;
  $self->SUPER::death();
  $self->setIntelligence(0);
  $self->setEvasion(0);
  $self->setMaxStamina(0);
}

sub sacrifice {
  my($self) = @_;
  $sacrifice = $self->{health};
  $self->death();
  $sacrifice;
}

sub takeDamage($) {
  my($self,$damage) = @_;
  return $self->{health} unless looks_like_number($damage) && $damage > 0;
  $stamina_drain = round(($self->{strength} + $self->{speed}) / 2) + round(($self->{height} + $self->{weight}) / 2)
    + ($self->{armor});
  if ($self->{stamina}>=$stamina_drain) {
    $self->{stamina} -= $stamina_drain;
    $damage -= round((rand(1)*$self->{evasion})*(rand(1)*$self->{intelligence})*5);
  }
  $self->SUPER::takeDamage($damage);
}

sub attack {
  my($self) = @_;
  $stamina_no_mana_drain = round(($self->{strength} + $self->{speed}) / 2) + round(($self->{height} + $self->{weight}) / 2)
    + ($self->{armor});
  $stamina_mana_drain = round($stamina_no_mana_drain / $self->{intelligence} * 5) if $self->{intelligence}>0;
  if ($self->{stamina}>=$stamina_mana_drain && $self->{mana}>0 && $self->{intelligence}>0) {
    $self->{stamina}-=$stamina_mana_drain;
    return round($self->SUPER::attack() + (rand(1)*$self->{intelligence}));
  } elsif ($self->{stamina}>=$stamina_no_mana_drain) {
    $self->{stamina}-=$stamina_no_mana_drain;
    return $self->SUPER::attack();
  } else {
    $self->recoverStamina(round($self->{max_stamina}/3));
    $self->recoverHealth(round($self->{max_health}/20));
    0;
  }
}

sub recoverAllStamina {
  my($self) = @_;
  $self->{stamina} = $self->{max_stamina};
  $self->{stamina};
}

sub recoverStamina($) {
  my($self, $recover) = @_;
  $self->{stamina}+=$recover if looks_like_number($recover) && $recover >= 0;
  return $self->recoverAllStamina if ($self->{stamina} > $self->{max_stamina});
  $self->{stamina};
}

1;
