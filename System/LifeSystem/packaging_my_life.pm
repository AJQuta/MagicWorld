#!/usr/bin/env perl
#So, apparently pl and pm are perl extensions, but pm is for modules
package Person;

sub new {
  my $class = shift;
  $class = ref $class if ref $class;
  my $self = bless {
    name => shift,
    height => shift,
    weight => shift
  }, $class;
  return $self;
}

sub getClass {
  my($self) = @_;
  return ref $self;
}

sub getName {
  my($self) = @_;
  return $self->{name};
}

sub getHeight {
  my($self) = @_;
  return $self->{height};
}

sub getWeight {
  my($self) = @_;
  return $self->{weight};
}

sub setName {
  my($self, $name) = @_;
  $self->{name} = $name if defined $name;
  return $self->{name};
}

sub setHeight {
  my($self, $height) = @_;
  $self->{height} = $height if defined $height;
  return $self->{height};
}

sub setWeight {
  my($self, $weight) = @_;
  $self->{weight} = $weight if defined $weight;
  return $self->{weight};
}
1;
