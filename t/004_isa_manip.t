

; use strict; use warnings
; use Test::More tests => 5

###############################################################################
## tests for @ISA manipulation
###############################################################################

; package T::three
; BEGIN
    { Test::More::use_ok
        ('Package::Subroutine::ISA',qw/isaget isaadd isarm/)
    }
    
########################    
    
; package TestC
; sub two {2}
; package TestB
; sub one {1}
; package TestA
; Test::More::is(0+@TestA::ISA,0)
; my @isa=Package::Subroutine::ISA->add(TestA => qw/TestB TestC/)
; Test::More::is(0+@isa,2)
; Test::More::is(TestA->one,1)
; Test::More::is(TestA->two,2)

; 