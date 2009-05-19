use Test::More;

plan( skip_all => "Author tests not required for installation" )
  unless $ENV{AUTOMATED_TESTING} or $ENV{RELEASE_TESTING};

eval "use Test::Pod::Coverage 1.00";
plan skip_all => "Test::Pod::Coverage 1.00 required for testing POD coverage" if $@;
all_pod_coverage_ok();
