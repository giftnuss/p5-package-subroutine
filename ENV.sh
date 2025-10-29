



__DIR__=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

export PERL5LIB=./blib/lib:$__DIR__/vendor/lib/perl5:$PERL5LIB
