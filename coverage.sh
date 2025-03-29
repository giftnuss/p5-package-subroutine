#!/bin/bash

__DIR__=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

COPT="+ignore_re,vendor/lib/.*"
COPT="$COPT,+ignore_re,^t/.*\.t"
COPT="$COPT,+ignore_re,^.*/prove\$"

PERL5OPT=-MDevel::Cover=$COPT prove

COVER=cover

if ! type $COVER 2>/dev/null ; then
    COVER=vendor/bin/cover
fi

$COVER +ignore_re ^t/.*\.t \
       +ignore_re ^.*/prove\$ \
       +ignore_re ^site-lib/ \
       +ignore_re ^vendor/ \
       -report html
