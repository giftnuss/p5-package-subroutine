  package Package::Subroutine::ISA
# ********************************
; our $VERSION='0.01'
# *******************

; use Package::Subroutine 
    ('Package::Subroutine' => 'import')

########################
#   Own class methods
########################
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
   ; wantarray ? @{"${class}::ISA"} : \@{"${class}::ISA"}
   }
   
; sub remove
   { 
   }
   
; sub get
   { my ($self,$thing,@base) = @_
   ; my $class = ref $thing || $thing
   ; wantarray ? @{"${class}::ISA"} : \@{"${class}::ISA"}
   }
########################
#   Methods to export
########################
; sub isaget
   { my ($self)
   }


   
; 1

__END__

 