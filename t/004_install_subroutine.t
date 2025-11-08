
; use Test2::V0 -srand => 7654321;

; BEGIN { plan(2) }

; use Package::Subroutine ()

; package T::one

; sub number { int( rand 6 ) + 1 }

; package T::two

; install Package::Subroutine:: (__PACKAGE__,'zahl',\&T::one::number)

; package T::three

; mixin Package::Subroutine:: ('T::two','zahl')

; package main

; is(&T::two::zahl,4)
; is(&T::three::zahl,3)
