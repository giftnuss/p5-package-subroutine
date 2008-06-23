  package Package::Subroutine::Namespace
# **************************************
; our $VERSION='0.01'
# *******************
; use strict ('vars','subs')
; use warnings

; use Perl6::Junction ()

; sub list_childs
    { my ($self,$package) = @_
    ; map { s/::$// ; $_ } 
      grep { /::$/ } keys %{"${package}::"}
    }
    
; sub delete_childs
    { my ($self,$package,@keep) = @_
    ; for my $chld ($self->list_childs($package))
        { next if $chld eq Perl6::Junction::any(@keep)
        ; delete ${"${package}::"}{"${chld}::"}
        }
    }
    
; 1

__END__

