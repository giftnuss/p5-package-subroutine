use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Package-Subroutine',
    license             => 'perl',
    dist_author         => 'Sebastian Knapp <sk@computer-leipzig.com>',
	dist_version         => '0.12',
	requires => {
        'perl'          => '5.6.0'
	},
    requires => {
        'Perl6::Junction' => undef, 
    },
    build_requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'Package-Subroutine-*' ],
	create_makefile_pl  => 'traditional', 
);

$builder->create_build_script();
