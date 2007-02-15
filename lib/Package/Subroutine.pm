  package Package::Subroutine
# ***************************
; our $VERSION = '0.05'
# *********************

; sub export 
    { my $ns = (caller(1))[0]
    ; shift() # rm package
    # working shortcut for __PACKAGE__
    ; splice(@_,0,1,"".caller) if $_[0] eq '_'
    ; _import_export($ns,@_)
    }

; sub import
    { my $ns = (caller(0))[0]
    ; shift() # rm package
    ; _import_export($ns,@_)
    }

; sub _import_export
    { my $namespace = shift
    ; my $from      = shift
    ; my @methods   = @_

    ; for ( @methods )
        { my $target = "${namespace}::${_}"
        ; my $source = "${from}::${_}"
        ; *$target = \&$source
        }
    }

; sub version
    { my ($f,$pkg,$num)=@_  
    ; if( defined($num) )
        { $num=eval { UNIVERSAL::VERSION($pkg,$num) }
        ; return $@ ? undef : $num
        }
    ; eval { UNIVERSAL::VERSION($pkg) }
    }

; sub install
   { my ($pkg,$target,$name,$coderef)=@_
   ; $target="${target}::${name}"
   ; *$target = $coderef
   }

; 1

__END__

=head1 NAME

Package::Subroutine - minimalistic import and export modul

=head1 SYNOPSIS

Exporting functions from a module is very simple.

   ; package Recipe::Condiment; use Package::Subroutine
   ; sub import
      { export Package::Subroutine _ => qw/required optional var/ }

You can import too.

   ; import Package::Subroutine 'Various::Types' => qw/string email/

And you can build a relay for your subroutines.                                 
                                                                                
   ; package SubRelay                                                           
                                                                                
   ; sub import                                                                 
       { export Package::Subroutine FooModule => qw/foo fun/                                   
       ; export Package::Subroutine BarPackage => qw/bar geld/                                 
       }   

And you can get and compare version numbers with this module.

   ; say "SOTA" if version Package::Subroutine 'Xpose::Nature' => 0.99

   ; say "SOTA" if version Package::Subroutine 'Protect::Whales' >= 62.0

=head1 DESCRIPTION

This module provides two class methods to transfer subs
from one namespace into another.
 
It is very simple, so it is possible that it does not work
for you under all circumstances. Tell me please if things
go wrong. You are also free to use the long time available 
and stable alternatives. Anyway I hope this package finds his 
ecological niche.

In each case you have at least two arguments. The first is a
package name, Safiest is it, the package was loaded before you 
transfer the subs around. There is a shortcut for the current
namespace included beause you cant write

   export Package::Subroutine __PACKAGE__ => qw/foo bar/ 
   
Things go wrong, because you really export from __PACKAGE__::
namespace and this is seldom what you want. Please use the form 
from synopsis with one underscore.

Second argument is a list of function names.

=head1 HOW AND WHY

I wish you have fun with this module, but please use it with care.
It is not robust like the alternatives, but I hope it is faster
and I think in some cases, it is easier to use. I use it together
with dynamically created packages and functions and in this area
the import facility spares the creation of extra code.

Another use case is an situation where a package decides during load 
time where the used functions come from. In such a case Exporter is not
a good solution because it is bound to C<use> and C<@ISA> what made 
things a little bit harder.

=head1 SEE ALSO

L<Sub::Install|Sub::Install>

L<Exporter|Exporter>

=head1 CONTRIBUTIONS

Thank you, ysth from perlmonks for your suggestions. Without your this
has never been arrived the CPAN. :) 

=head1 LICENSE

Perl has a free license, so this module shares it with this
programming language.

Copyleft 2006-2007 by Sebastian Knapp <giftnuss@netscape.net>
