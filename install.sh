#!/bin/bash

__DIR__=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

cd $__DIR__

mkdir -p vendor

cpanm -L vendor --self-contained <requirements.txt
cpanm -L vendor --self-contained <requirements-dev.txt
