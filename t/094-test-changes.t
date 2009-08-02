use Test::More;

plan( skip_all => "Author tests not required for installation" )
  unless $ENV{AUTOMATED_TESTING} or $ENV{RELEASE_TESTING};

eval "use Test::CheckChanges";
plan skip_all => "Test::CheckChanges  required for testing Changes file" if $@;

ok_changes();
