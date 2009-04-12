use Test::More;

eval "use Test::DistManifest";
plan skip_all => "Test::DistManifest  required for testing MANIFEST file" if $@;

manifest_ok();
