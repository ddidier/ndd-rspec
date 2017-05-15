# NDD RSpec

[![Build Status](https://secure.travis-ci.org/ddidier/ndd-rspec.png)](http://travis-ci.org/ddidier/ndd-rspec)
[![Dependency Status](https://gemnasium.com/ddidier/ndd-rspec.png)](https://gemnasium.com/ddidier/ndd-rspec)
[![Code Climate](https://codeclimate.com/github/ddidier/ndd-rspec/badges/gpa.svg)](https://codeclimate.com/github/ddidier/ndd-rspec)
[![Test Coverage](https://codeclimate.com/github/ddidier/ndd-rspec/badges/coverage.svg)](https://codeclimate.com/github/ddidier/ndd-rspec)
[![Yard Documentation](http://img.shields.io/badge/yard-docs-blue.svg)](http://www.rubydoc.info/github/ddidier/ndd-rspec)
[![Documentation Coverage](https://inch-ci.org/github/ddidier/ndd-rspec.svg)](https://inch-ci.org/github/ddidier/ndd-rspec)

RSpec utilities.

The API documentation can be find at [RubyDoc](http://www.rubydoc.info/github/ddidier/ndd-rspec).

## Prerequisites

This gem requires:

- `rspec >= 3.0`

And is tested with:

- `Ruby 2.4`
- `Ruby 2.3`
- `Ruby 2.2`

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ndd-rspec-rails'
```

And then execute `bundle`

Or install it yourself with `gem install ndd-rspec-rails`

## Matchers

### be_sorted_by

```ruby
expect(%w[1 2 3]).to be_sorted_by(:to_i)  # => success
expect(%w[1 3 2]).to be_sorted_by(:to_i)  # => failure
```

### be_reverse_sorted_by

```ruby
expect(%w[3 2 1]).to be_reverse_sorted_by(:to_i)  # => true
expect(%w[1 3 2]).to be_reverse_sorted_by(:to_i)  # => false
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can 
also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the 
version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, 
push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ddidier/ndd-rspec. This project is 
intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the 
[Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
