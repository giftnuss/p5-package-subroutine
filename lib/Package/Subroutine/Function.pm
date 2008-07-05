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
    ; if(@args)
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

    # calls $method on $obj only when @args is not ().
    setter($obj,$method,@args);
    
=head1 DESCRIPTION

These are all tiny helper functions provided by this package.

C<setter> returns undef when there are no arguments otherwise it returns
the result of the method call.

=head1 AUTHOR

Sebastian Knapp, <rock@ccls-online.de>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-package-subroutine@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 COPYRIGHT & LICENSE

Copyleft 2007-2008 Sebastian Knapp

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut
