#!/bin/bash

__DIR__=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

cd $__DIR__

mkdir -p vendor   

if [ -n "$MINICPAN" ] ; then
    FROM="--from $MINICPAN"
else
    FROM=""
fi

cpanm -L vendor $FROM --self-contained <requirements.txt
cpanm -L vendor $FROM --self-contained <requirements-dev.txt
cpanm -L vendor $FROM --self-contained <requirements-release.txt
