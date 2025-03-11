#!/usr/bin/env perl

package LifeForm;
use Scalar::Util qw(looks_like_number);
use Math::Round;

# Parameters:
#   1. String name
#   2. int health,max_health
#   3. double resistance (>=0 & <=1)
#   4. int speed
#   5. int strength
sub new($$$$$) {
  my $class = shift;
  $class = ref $class if ref $class;
  my $self = bless {
    name => shift,
    health => @_[0],
    max_health => shift,
    resistance => shift,
    speed => shift,
    strength => shift
  }, $class;
  initialize($self); # I hated what I had to go through to figure THIS
  $self;
}

sub initialize {
  my($self) = @_;
  die if looks_like_number($self->{name});
  die unless looks_like_number($self->{health});
  die unless looks_like_number($self->{resistance});
  die unless looks_like_number($self->{speed});
  die unless looks_like_number($self->{strength});

  return $self->death if $self->{health} < 0;
  $self->{resistance} = 0 if $self->{resistance} < 0;
  $self->{resistance} = 1 if $self->{resistance} > 1;
  $self->{speed} = 0 if $self->{speed} < 0;
  $self->{speed} = 20 if $self->{speed} > 20;
  $self->{strength} = 0 if $self->{strength} < 0;
  $self->{strength} = 20 if $self->{strength} > 20;

  $self->{health} = round($self->{health});
  $self->{max_health} = $self->{health};
  $self->{speed} = round($self->{speed});
  $self->{strength} = round($self->{strength});
}

sub getClass {
  my($self) = @_;
  ref $self;
}

sub getName {
  my($self) = @_;
  $self->{name};
}

sub getHealth {
  my($self) = @_;
  $self->{health};
}

sub getMaxHealth {
  my($self) = @_;
  $self->{max_health};
}

sub getResistance {
  my($self) = @_;
  $self->{resistance};
}

sub getSpeed {
  my($self) = @_;
  $self->{speed};
}

sub getStrength {
  my($self) = @_;
  $self->{strength};
}

sub setName($) {
  my($self, $name) = @_;
  $self->{name} = $name unless looks_like_number($name);
  $self->{name};
}

sub setHealth($) {
  my($self, $health) = @_;
  $self->{health} = $health if looks_like_number($health);
  $self->{health} = round($self->{health});
  $self->{max_health} = $self->{health} if $self->{health} > $self->{max_health};
  $self->{health};
}

sub setMaxHealth($) {
  my($self, $max_health) = @_;
  $self->{max_health} = $max_health if looks_like_number($max_health);
  $self->{max_health} = round($self->{max_health});
  $self->{health} = $self->{max_health} if $self->{health} > $self->{max_health};
  $self->{max_health};
}

sub setResistance($) {
  my($self, $resistance) = @_;
  $self->{resistance} = $resistance if looks_like_number($resistance);
  $self->{resistance} = 0 if $self->{resistance} < 0;
  $self->{resistance} = 1 if $self->{resistance} > 1;
  $self->{resistance};
}

sub setSpeed($) {
  my($self, $speed) = @_;
  $self->{speed} = $speed if looks_like_number($speed);
  $self->{speed} = 0 if $self->{speed} < 0;
  $self->{speed} = 20 if $self->{speed} > 20;
  $self->{speed} = round($self->{speed});
  $self->{speed};
}

sub setStrength($) {
  my($self, $strength) = @_;
  $self->{strength} = $strength if looks_like_number($strength);
  $self->{strength} = 0 if $self->{strength} < 0;
  $self->{strength} = 20 if $self->{strength} > 20;
  $self->{strength} = round($self->{strength});
  $self->{strength};
}

sub death {
  my($self) = @_;
  $self->setMaxHealth(0); # This is the top-most defined version of this method
  $self->setResistance(0);
  $self->setSpeed(0);
  $self->setStrength(0);
}

sub takeDamage($) {
  my($self, $damage) = @_;
  return $self->{health} unless looks_like_number($damage) && $damage > 0;
  $damage -= round($damage * (rand(1) * $self->{resistance}));
  if ($self->{health} > $damage) {
    $self->{health} -= $damage;
  } else {
    $self->death();
  }
  $self->{health};
}

sub attack {
  my($self) = @_;
  if($self->{health}>0) {
    round( (rand(1) * $self->{speed}) + (rand(1)*$self->{strength}) );
  } else {
    0;
  }
}

sub recoverAllHealth {
  my($self) = @_;
  return $self->setHealth($self->{max_health});
}

sub recoverHealth($) {
  my($self, $recover) = @_;
  $self->{health}+=$recover if looks_like_number($recover) && $recover >= 0;
  return $self->recoverAllHealth if ($self->{health} > $self->{max_health});
  $self->{health};
}


1; # This is actually required
