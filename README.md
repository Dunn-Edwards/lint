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

    rake lint:coffeescript
    rake lint:ruby
    rake lint:scss

When including the gem in other gems or non-Rails apps, add this in the `Rakefile`:

    spec = Gem::Specification.find_by_name('lint')
    load "#{spec.gem_dir}/lib/tasks/lint.rake"


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
