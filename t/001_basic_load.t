# test load of package

; use strict
; use Test::More tests => 6
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
