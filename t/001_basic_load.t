# test load of package

; use strict
; use Test::More tests => 3
; use t::Tags

; BEGIN { use_ok('from','t::Tags','minze') }

; my $r=eval { minze() }
; ok(!$@)

; is($r,'blatt')