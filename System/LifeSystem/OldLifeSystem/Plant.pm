#!/usr/bin/env perl
package Plant;
use File::Basename;
use lib dirname(__FILE__);
use Scalar::Util qw(looks_like_number);
use Math::Round;

use parent qw(LifeForm);

# Parameters:
#   1. String name
#   2. int health,max_health
#   3. double resistance (>=0 & <=1)
#   4. int strength
#   5. int growth factor
#   6. double potency (>=0 & <=1)
sub new($$$$$$) {
  my($class) = @_;shift;
  my $self = $class->SUPER::new(shift,shift,shift,0,shift);
  $self->{growth_factor} = shift;
  $self->{potency} = shift;

  initialize($self);
  bless $self, $class;
  $self;
}

sub initialize {
  my($self) = @_;
  die unless looks_like_number($self->{growth_factor});
  die unless looks_like_number($self->{potency});

  $self->{growth_factor} = 0 if $self->{growth_factor} < 0;
  $self->{growth_factor} = 20 if $self->{growth_factor} > 20;
  $self->{potency} = 0 if $self->{potency} < 0;
  $self->{potency} = 1 if $self->{potency} > 1;

  $self->{growth_factor} = round($self->{growth_factor});
}

sub getGrowFactor {
  my($self) = @_;
  $self->{growth_factor};
}

sub getPotency {
  my($self) = @_;
  $self->{potency};
}

sub setSpeed {
  my($self) = @_;
  print $self->getClass." speed cannot be changed.";
  $self->{speed};
}

sub setGrowFactor($) {
  my($self,$growth_factor) = @_;
  $self->{growth_factor} = $growth_factor if looks_like_number($growth_factor);
  $self->{growth_factor};
}

sub setPotency($) {
  my($self,$potency) = @_;
  $self->{potency} = $potency if looks_like_number($potency);
  $self->{potency} = 0 if $self->{potency} < 0;
  $self->{potency} = 1 if $self->{potency} > 1;
  $self->{potency};
}

sub death {
  my($self) = @_;
  $self->SUPER::death();
  $self->{growth_factor} = 0;
}

sub attack {
  my($self) = @_;
  if($self->{health}>0) {
    int( (rand(1) * $self->{potency}) * (rand(1)*$self->{strength}) * $self->{growth_factor});
  } else {
    0;
  }
}

sub growth {
  my($self) = @_;
  $self->recoverHealth( int( (rand(1) * $self->{growth_factor} / 25) * $self->{health} ) );
}

1;
