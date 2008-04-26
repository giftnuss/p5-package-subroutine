
; use strict; use warnings

; package T::Sugar
; use Test::More tests => 4

; use t::Tags

; BEGIN
    { use_ok('Package::Subroutine::Sugar')
    ; eval { import from 't::Tags' => 'minze' }
    ; ok(!$@)
    }

; ok(T::Sugar->can('minze'))

; package T::good

; no Package::Subroutine::Sugar

# interessting - this is not an error
# it seems this function is not executed
; import from('t::Tags' => 'minze')

; Test::More::ok(!T::good->can('minze'))
 