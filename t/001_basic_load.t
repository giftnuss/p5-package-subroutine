# test load of package

; use Test2::V0

; use lib 't/lib'
; use Tags

; BEGIN { plan(11) }

; use Package::Subroutine 'Tags' => 'minze'

; my $r=eval { minze() }
; ok(!$@)
; is($r,'blatt')

# 03-05
; my $ref
; ok($ref=isdefined Package::Subroutine:: 'Tags' => 'minze')
; ok(! isdefined Package::Subroutine:: 'Tags' => 'eukalyptus')
; is($ref->(),'blatt')

# 06-08
; ok($ref=isdefined Package::Subroutine:: ('Tags::minze'))
; ok(! isdefined Package::Subroutine:: ('Tags::eukalyptus'))
; is($ref->(),'blatt')

; # 09-11
; is(version Package::Subroutine::('Tags'), '0.99')
; ok(version Package::Subroutine::('Tags', '0.50'))
; ok(!version Package::Subroutine::('Tags', '1.00'))
