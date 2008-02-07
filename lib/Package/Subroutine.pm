  package Package::Subroutine
# ***************************
; our $VERSION = '0.10'
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
   
; sub set_base_class
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

=head1 DESCRIPTION

=head2 C<import and export>

This module provides two class methods to transfer subs
from one namespace into another.

It is very simple, so it is possible that it does not work
for you under all circumstances. Tell me please if things
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
around. There is a shortcut for the current namespace included because 

C<export> takes the caller as the target namespace, import uses 
the calling package as source namespace.

There is a shortcut for the current namespace included because 
you can't write

   export Package::Subroutine __PACKAGE__ => qw/foo bar/

Things go wrong, because you really export from __PACKAGE__::
namespace and this is seldom what you want. Please use the form
from synopsis with one underscore.

You can change the name of the sub in the target namespace. To do so, 
you give a array reference with the sourcename and the targetname 
instead of the plain string name.

  package Here;

  export Package::Subroutine There => [loosy => 'groovy'];
  # now is There::groovy equal Here::loosy

  import Package::Subroutine There => [wild => 'wilder'];
  # and There::wild -> Here::wilder

=head2 C<version>

    print Package::Subroutine->version('Package::Subroutine');

This is a evaled wrapper around UNIVERSAL::VERSION so it will not die.
You have seen in synopsis how a check against a version number is
performed.

=head2 C<set_base_class>

=head2 Importable functions

=head3 setglobal

    use Package::Subroutine::Functions 'setglobal';
    
    setglobal(__PACKAGE__,'@EXPORT','something');


=head1 SEE ALSO

L<Sub::Install|Sub::Install>

L<Exporter|Exporter>

=head1 CONTRIBUTIONS

Thank you, ysth from perlmonks for your suggestions. Without you this
would have never arrived in CPAN. :)

=head1 LICENSE

Perl has a free license, so this module shares it with this
programming language.

Copyleft 2006-2008 by Sebastian Knapp <rock@ccls-online.de
