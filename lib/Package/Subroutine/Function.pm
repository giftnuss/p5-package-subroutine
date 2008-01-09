  package Package::Subroutine::Function
# *************************************
; our $VERSION = '0.01'
# *********************

; use strict; use warnings; use utf8

; require Exporter
; our @ISA = qw/Exporter/

; our @EXPORT_OK = qw/run perform setter/
; our @EXPORT = qw//

; sub run
    { my ($ref,@args) = @_
    ; if(ref $ref eq 'CODE')
        {
             return $ref->(@args)
        }
    ; return
    }
    
; sub perform
    { my ($ref,@args) = @_
    ; if(ref $ref eq 'CODE')
        {
            return $ref->(@args)
        }
    ; return $ref
    }
    
; sub setter
    { my ($obj,$method,@args) = @_
    ; if($args[0])
        {
            return $obj->$method(@args)
        }
    ; return undef
    }
    
; 1

__END__

=head1 NAME

Package::Subroutine::Function

=head1 SYNOPSIS

    use Package::Subroutine::Function qw/run perform setter/
    
    run(undef); # returns undef
    run($not_a_code_ref); # returns undef too
    run($coderef,@args);  # returns $coderef->(@args)
    
    perform(undef); # returns undef
    perform($not_a_code_ref); # returns $not_a_code_ref
    perform($coderef,@args);  # same as with run
    
=head1 DESCRIPTION