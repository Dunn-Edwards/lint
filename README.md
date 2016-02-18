# lint

A collection of code linters and opinionated config files.

Made primarily for internal use.

[![Gem Version](https://badge.fury.io/rb/lint.svg)](http://badge.fury.io/rb/lint)


## Installation

Add this line to your application's Gemfile (in the development/test group):

    gem 'lint'

And then execute:

    $ bundle

Or install it manually as:

    $ gem install lint


## Usage

When using Rails, the following Rake tasks become available after adding the gem:

    rake lint
    rake lint:coffeescript
    rake lint:ruby
    rake lint:scss
    
By default the gem checks modified and new files.

When including the gem in other gems or non-Rails apps, add this in the `Rakefile`:

    spec = Gem::Specification.find_by_name('lint')
    load "#{spec.gem_dir}/lib/tasks/lint.rake"

## Configuration

To configure behaviour of the gem, add `lint.yml` to `config/` directory, with the following content:

```yaml
config_file:
  scss: config/custom_rules/scss.yml
  ruby: config/custom_rules/ruby.yml
  coffeescript: config/custom_rules/coffeescript.json

# Uncomment to check all files. By default lint checks modified and new files.
# check_all_files: true

# Uncomment to fail if code style does not match style rules. By default lint
# does not fail.
# fail_when_violations_found: true
```

## Contributing

1. Fork it
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create new Pull Request


## Copyright

Copyright (c) 2015 Matthias Siegel. See [LICENSE][] for details.


## Changelog

See [CHANGELOG][] for details.

[license]: LICENSE.md
[changelog]: CHANGELOG.md
