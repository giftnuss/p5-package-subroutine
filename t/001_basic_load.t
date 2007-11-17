# test load of package

; use strict
; use Test::More tests => 10
; use t::Tags

# 01
; BEGIN { use_ok('Package::Subroutine','t::Tags','minze') }

# 02
; my $r=eval { minze() }
; ok(!$@)

# 03
; is($r,'blatt')

# 04-06
; my $ref
; ok($ref=isdefined Package::Subroutine 't::Tags' => 'minze')
; ok(! isdefined Package::Subroutine 't::Tags' => 'eukalyptus')
; is($ref->(),'blatt')

# dynamic subclasses
# 07-10
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