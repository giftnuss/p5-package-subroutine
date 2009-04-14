use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Package::Subroutine',
    license             => 'perl',
    dist_author         => 'Sebastian Knapp <sk@computer-leipzig.com>',
    dist_version        => '0.16_1',
    dist_abstract       =>
        'minimalistic import/export and other util package functions',
    requires => {
        'perl'          => '5.6.0',
        'Perl6::Junction' => '1.30000', 
    },
    build_requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'Package-Subroutine-*' ],
    create_makefile_pl  => 'traditional', 
);

$builder->create_build_script();
