#!/usr/bin/env perl
package Potion;
use Scalar::Util qw(looks_like_number);
use Math::Round;

# Paramaters:
#   1. Object stat
#   2. int charges
#   3. int effect
sub new($$$) {
  my $class = shift;
  $class = ref $class if ref $class;
  my $self = bless {
    stat => shift,
    charges => shift,
    effect => shift
  }, $class;
  initialize($self);
  $self;
}

sub initialize {
  my($self) = @_;
  die if looks_like_number($self->{stat});
  die unless looks_like_number($self->{charges});
  die unless looks_like_number($self->{effect});

  $self->{charges} = 0 unless $self->{charges} > 0;
  $self->{effect} = 0 unless $self->{effect} > 0;

  $self->{charges} = round($self->{charges});
}


sub getClass {
  my($self) = @_;
  ref $self;
}

sub getStat {
  my($self) = @_;
  $self->{stat};
}
 sub getCharges {
   my($self) = @_;
   $self->{charges};
 }

 sub getEffect {
   my($self) = @_;
   $self->{effect};
 }

sub setStatus($) {
  my($self, $stat) = @_;
  $self->{stat} = $stat unless looks_like_number($stat);
  $self->{stat};
}

sub setCharges($) {
  my($self, $charges) = @_;
  $self->{charges} = $charges if looks_like_number($charges);
  $self->{charges} = 0 unless $self->{charges} > 0;
  $self->{charges} = round($self->{charges});
  $self->{charges};
}

sub setEffect($) {
  my($self, $effect) = @_;
  $self->{effect} = $effect if looks_like_number($effect);
  $self->{effect} = 0 unless $self->{effect} > 0;
  $self->{effect} = round($self->{effect});
  $self->{effect};
}

sub use {
  my($self) = @_;
  return $self->{charges} unless $self->{charges} > 0;
  $self->{charges}--;
  $self->{effect};
}

sub combinePotions(@) {
  my($self, $potions) = @_;
  $charges = $self->{charges};
  $effect = $self->{effect} * $self->{charges};
  foreach my $potion (@$potions) {
    return $self unless ref $self eq $potion->getStat;
    while($potion->getCharges > 0) {
      $charges++;
      $effect += $potion->use;
    }
    $self->setCharges($charges);
    $self->setEffect($effect/$charges);
    $potion->setEffect(0);
  }
  $self;
}

1;
