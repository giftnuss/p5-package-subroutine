  package Package::Subroutine::Sugar
# **********************************
; our $VERSION='0.01'

; sub import
    { eval <<'__PERL__'
; package from
# ************
; our $VERSION='0.07'
; use Package::Subroutine 'Package::Subroutine' 
    => qw/import export mixin version/ 
__PERL__
    }
    
; sub unimport
    { delete $::{'from::'}
    }

; 1

__END__



