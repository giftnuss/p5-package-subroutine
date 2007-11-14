# test load of package

; use strict
; use Test::More tests => 10
; use t::Tags

; BEGIN { use_ok('Package::Subroutine','t::Tags','minze') }

; my $r=eval { minze() }
; ok(!$@)

; is($r,'blatt')

; my $ref
; ok($ref=isdefined Package::Subroutine 't::Tags' => 'minze')
; ok(! isdefined Package::Subroutine 't::Tags' => 'eukalyptus')
; is($ref->(),'blatt')

# dynamische subclasses
; package TestC
; sub two {2}
; package TestB
; sub one {1}
; package TestA
; Test::More::is(0+@TestA::ISA,0)
; my @isa=Package::Subroutine->set_base_class(TestA => qw/TestB TestC/)
; Test::More::is(0+@isa,2)
; Test::More::is(TestA->one,1)
; Test::More::is(TestA->two,2)