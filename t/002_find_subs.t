
; use strict
; use Test::More tests => 1;

################################################################################
## test the findsubs method
################################################################################
use Package::Subroutine;
my %expect  =
    ( import         => 1
    , export         => 1
    , _import_export => 1
    , version        => 1
    , install        => 1
    , isdefined      => 1
    , findsubs       => 1
    , set_base_class => 1
    );
    
my %methods = map { ($_ => 1) }
    Package::Subroutine->findsubs('Package::Subroutine');

is_deeply(\%methods,\%expect);