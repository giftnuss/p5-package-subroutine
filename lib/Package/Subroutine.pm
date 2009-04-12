  package Package::Subroutine
# ***************************
; our $VERSION = '0.12'
# *********************
; sub export
    { my $ns = (caller(1))[0]
    ; shift() # rm package
    # working shortcut for __PACKAGE__
    ; splice(@_,0,1,"".caller) if $_[0] eq '_'
    ; exporter($ns,@_)
    }

; sub import
    { my $ns = (caller(0))[0]
    ; shift() # rm package
    ; exporter($ns,@_)
    }

; sub mixin
    { my $ns  = (caller(0))[0]
    ; my $pkg = shift()
    ; if(@_==1)
        { push @_, $pkg->findsubs($ns)
        }
    ; exporter($ns,@_)
    }

; sub exporter
    { my $namespace = shift
    ; my $from      = shift
    ; my @methods   = @_
    ; local $_

    ; for ( @methods )
        { my $srcm = my $trgm = $_
        ; ($srcm,$trgm) = @$_ if ref eq 'ARRAY'

        ; my $target = "${namespace}::${trgm}"
        ; my $source = "${from}::${srcm}"
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
   
; sub isdefined
   { my ($pkg,$namespace,$subname)=@_
   ; unless($subname)
       { my @ns = split /\'|\:\:/, $namespace
       ; $subname = pop @ns
       ; $namespace = join "::",@ns
       }
   ; *{"${namespace}::${subname}"}{CODE} || undef
   }
   
; sub findsubs
   { my ($self,$class)=@_
   ; grep { *{"${class}::${_}"}{CODE} } keys %{"${class}::"}
   }

; 1

__END__

=head1 NAME

Package::Subroutine - minimalistic import/export and other util methods

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

Sure, installation of a coderef is possible too.

   ; install Package::Subroutine 'Cold::Inf' => nose => sub { 'hatchie' }

Test if a subroutine is defined.

   ; (isdefined Package::Subroutine('Cold::Inf' => 'tissue')||sub{})->()

As a helper exists a method which lists all subroutines in a package.

   ; print "$_\n" for Package::Subroutine->findsubs('Cold::Inf')

=head1 DESCRIPTION

=head2 C<import,mixin and export>

This module provides two class methods to transfer subs
from one namespace into another. C<mixin> is an alias for 
import with the addition to import all subroutines from a namespace.

The way this module works is very simple, so it is possible that it does not work
for you under all circumstances. Please send a bug report if things
go wrong. You are also free to use the long time available
and stable alternatives. Anyway I hope this package finds its
ecological niche.

A possible use case for this module is an situation where a package 
decides during load time from where the used functions come from. 
In such a case Exporter is not a good solution because it 
is bound to C<use> and C<@ISA> what made things a little bit 
harder to change things dynamically. 

The inport or export needs at least two arguments. The first is a
package name. Second argument is a list of function names.

It is safest, if the package was loaded before you transfer the subs 
around. 

There is a shortcut for the current namespace included because 
you can't write

   export Package::Subroutine __PACKAGE__ => qw/foo bar/

Things go wrong, because you really export from __PACKAGE__::
namespace and this is seldom what you want. Please use the form
from synopsis with one underscore, when the current package is
the source for the subroutines.

You can change the name of the sub in the target namespace. To do so, 
you give a array reference with the sourcename and the targetname 
instead of the plain string name.

  package Here;

  export Package::Subroutine There => [loosy => 'groovy'];
  # now is There::groovy equal Here::loosy

  import Package::Subroutine There => [wild => 'wilder'];
  # and There::wild -> Here::wilder
  
The purpose of mixin is that your code can distinguish between
functions and methods. The convention I suggest is to use C<mixin>
for methods and C<import> for the rest. Calling mixin without the list 
of method names imports all subs from the given namespace.

=head2 C<exporter>

The methods above are using one function. This function is usable with full
qualified name or is simply imported.

It takes three arguments, first is the target namespace,
second is the source namespace and the third is a list of method names
to move around.

=head2 C<version>

    print Package::Subroutine->version('Package::Subroutine');

This is a evaled wrapper around UNIVERSAL::VERSION so it will not die.
You have seen in synopsis how a check against a version number is
performed.

=head2 C<install>

This mehod installs a code reference as a subroutine. First argument
is the namespace, second the name for the subroutine and third is the
coderef.

=head2 C<isdefined>

This method returns like UNIVERSAL::can a code reference or C<undef>
for a function. As argument is the full quallified function name allowed
or a pair of package name and function name.

=head2 C<findsubs>

This method returns a list or an array with all defined functions
for a given package.

=head1 Note

I know this package does not much, what is not possible with core
functionality or other CPAN modules. But for me it seems to make some
things easier to type and hopefully the code a little bit more
readable.  

=head2 Other helper packages

=over 4

=item L<Package::Subroutine::ISA>

=item L<Package::Subroutine::Object>

=item L<Package::Subroutine::Function>

=item L<Package::Subroutine::Functions>

=item L<Package::Subroutine::Sugar>

=back

=head1 SEE ALSO

=over 4

=item L<Sub::Install|Sub::Install>

=item L<Exporter>

=back

=head1 CONTRIBUTIONS

Thank you, ysth from perlmonks for your suggestions. Without you this
would have never arrived in CPAN. :) (He was also not sure if this
should happen anyway.)

=head1 LICENSE

Perl has a free license, so this module shares it with this
programming language.

Copyleft 2006-2009 by Sebastian Knapp E<lt>rock@ccls-online.deE<gt>

