  package Package::Subroutine::ISA
# ********************************
; use strict 'subs','vars'; use warnings
# **************************************
; our $VERSION='0.01'
# *******************

; sub add
   { my ($self,$thing,@base) = @_
   ; my $class = ref $thing || $thing
   
   ; my %isa
   ; $isa{$_}++ for @{"${class}::ISA"}
   
   ; foreach my $base (@base)
       { next if $isa{$base}
       ; push @{"${class}::ISA"},$base
       ; $isa{$base}++
       }
   ; @{"${class}::ISA"}
   }
   
; sub remove
   { 
   }
   
; sub get
   { my ($self,$thing,@base) = @_
   ; my $class = ref $thing || $thing
   ; wantarray ? @{"${class}::ISA"} : \@{"${class}::ISA"}
   }
   
; 1

__END__

=head1 NAME

Package::Subroutine::ISA -- manipulate @ISA at runtime
  
=head1 SYNOPSIS

