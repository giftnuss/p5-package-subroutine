use Test::More;

eval "use Test::YAML::Meta";
plan skip_all => "Test::YAML::Meta required for testing Meta.yml file" if $@;

meta_yaml_ok();
