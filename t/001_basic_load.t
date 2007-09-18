# test load of package

; use strict
; use Test::More tests => 6
; use t::Tags

; BEGIN { use_ok('Package::Subroutine','t::Tags','minze') }

; my $r=eval { minze() }
; ok(!$@)

; is($r,'blatt')

; my $ref
; ok($ref=isdefined Package::Subroutine 't::Tags' => 'minze')
; ok(! isdefined Package::Subroutine 't::Tags' => 'eukalyptus')
; is($ref->(),'blatt')