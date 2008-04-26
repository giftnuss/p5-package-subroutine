
; use strict
; use Test::More tests => 2;

; package T::two

; sub new { bless {},$_[0] }
; sub eins { $_[0]->{eins} = $_[1] }
; sub zwei { $_[0]->{zwei} = $_[1] }

################################################################################
## test object helper functions
################################################################################
; package main

; BEGIN
    { use_ok('Package::Subroutine::Object',qw/applymethodhash/)
    }

; my $obj = T::two->new
; applymethodhash($obj, eins => 1, zwei => 2)

; is_deeply($obj,bless {eins => 1,zwei => 2},'T::two')

