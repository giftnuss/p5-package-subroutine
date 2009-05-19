use Test::More;

plan( skip_all => "Author tests not required for installation" )
  unless $ENV{AUTOMATED_TESTING} or $ENV{RELEASE_TESTING};

eval "use Test::DistManifest";
plan skip_all => "Test::DistManifest  required for testing MANIFEST file" if $@;

manifest_ok();
