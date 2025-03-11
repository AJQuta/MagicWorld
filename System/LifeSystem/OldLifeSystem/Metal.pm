#!/usr/bin/env perl
package Metal;

use Scalar::Util qw(looks_like_number);
use Math::Round;

=begin Classifications of attributes:
  low: <=20%
  slight: <=40%
  relative: <=60%
  great: <=80%
  high: >80%
=cut

=begin Parameters
  1. String name
  2. int weight
  3. int strength
  4. int rarity
  5. double magnetism (>=0 && <=2)
  6. double conductivity (>=0 && <=2)
  7. double lustre (>=0 && <=5)
=cut
sub new($$$$$$$) {
  my $class = shift;
  my $self = bless {
    name => shift,
    weight => shift,
    strength => shift,
    rarity => shift,
    magnetism => shift,
    conductivity => shift,
    lustre => shift
  }, $class;
  initialize($self);
  $self;
}

sub initialize {
  my($self) = @_;
  die if looks_like_number($self->{name});
  die unless looks_like_number($self->{weight});
  die unless looks_like_number($self->{strength});
  die unless looks_like_number($self->{rarity});
  die unless looks_like_number($self->{magnetism});
  die unless looks_like_number($self->{conductivity});
  die unless looks_like_number($self->{lustre});

  $self->{weight} = 0 if $self->{weight} < 0;
  $self->{weight} = 20 if $self->{weight} > 20;
  $self->{strength} = 0 if $self->{strength} < 0;
  $self->{strength} = 20 if $self->{strength} > 20;
  $self->{rarity} = 0 if $self->{rarity} < 0;
  $self->{rarity} = 20 if $self->{rarity} > 20;
  $self->{magnetism} = 0 if $self->{magnetism} < 0;
  $self->{magnetism} = 2 if $self->{magnetism} > 2;
  $self->{conductivity} = 0 if $self->{conductivity} < 0;
  $self->{conductivity} = 2 if $self->{conductivity} > 2;
  $self->{lustre} = 0 if $self->{lustre} < 0;
  $self->{lustre} = 5 if $self->{lustre} > 5;

  $self->{weight} = round($self->{weight});
  $self->{strength} = round($self->{strength});
  $self->{rarity} = round($self->{rarity});
}


sub getName {
  my($self) = @_;
  $self->{name};
}

sub getWeight {
  my($self) = @_;
  $self->{weight};
}

sub getStrength {
  my($self) = @_;
  $self->{strength};
}

sub getRarity {
  my($self) = @_;
  $self->{rarity};
}

sub getMagnetism {
  my($self) = @_;
  $self->{magnetism};
}

sub getConductivity {
  my($self) = @_;
  $self->{conductivity};
}

sub getLustre {
  my($self) = @_;
  $self->{lustre};
}

sub setName($) {
  my($self, $name) = @_;
  $self->{name} = $name unless looks_like_number($name);
  initialize($self);
  $self->{name};
}

sub setWeight($) {
  my($self, $value) = @_;
  $self->{weight} = $value if looks_like_number($value);
  initialize($self);
  $self->{weight};
}

sub setStrength($) {
  my($self, $value) = @_;
  $self->{strength} = $value if looks_like_number($value);
  initialize($self);
  $self->{strength};
}

sub setRarity($) {
  my($self, $value) = @_;
  $self->{rarity} = $value if looks_like_number($value);
  initialize($self);
  $self->{rarity};
}

sub setMagnetism($) {
  my($self, $value) = @_;
  $self->{magnetism} = $value if looks_like_number($value);
  initialize($self);
  $self->{magnetism};
}

sub setConductivity($) {
  my($self, $value) = @_;
  $self->{conductivity} = $value if looks_like_number($value);
  initialize($self);
  $self->{conductivity};
}

sub setLustre($) {
  my($self, $value) = @_;
  $self->{lustre} = $value if looks_like_number($value);
  initialize($self);
  $self->{lustre};
}

1;
