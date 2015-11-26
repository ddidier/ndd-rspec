# NDD RSpec

[![Build Status](https://secure.travis-ci.org/ddidier/ndd-rspec.png)](http://travis-ci.org/ddidier/ndd-rspec)
[![Dependency Status](https://gemnasium.com/ddidier/ndd-rspec.png)](https://gemnasium.com/ddidier/ndd-rspec)
[![Code Climate](https://codeclimate.com/github/ddidier/ndd-rspec/badges/gpa.svg)](https://codeclimate.com/github/ddidier/ndd-rspec)
[![Test Coverage](https://codeclimate.com/github/ddidier/ndd-rspec/badges/coverage.svg)](https://codeclimate.com/github/ddidier/ndd-rspec)
[![Documentation Coverage](https://inch-ci.org/github/ddidier/ndd-rspec.svg)](https://inch-ci.org/github/ddidier/ndd-rspec)
[![Yard Documentation](http://img.shields.io/badge/yard-docs-blue.svg)](http://www.rubydoc.info/github/ddidier/ndd-rspec)

RSpec utilities.

The API documentation can be find at [RubyDoc](http://www.rubydoc.info/github/ddidier/ndd-rspec).

## Prerequisites

This gem requires RSpec 3.1 and is tested with:

- Ruby 1.9.3
- Ruby 2.0.0
- Ruby 2.1.x

## Matchers

### be\_sorted\_by

```ruby
expect([1, 2, 3]).to be_sorted_by(:to_i)  # => success
expect([1, 3, 2]).to be_sorted_by(:to_i)  # => failure

Duck = Struct.new(:color)
expect([Duck.new('Grey'), Duck.new('White')]).to be_sorted_by(:color) }  # => success
expect([Duck.new('White'), Duck.new('Grey')]).to be_sorted_by(:color) }  # => failure
```

### be\_reverse\_sorted\_by

```ruby
expect([3, 2, 1]).to be_reverse_sorted_by(:to_i)  # => true
expect([1, 3, 2]).to be_reverse_sorted_by(:to_i)  # => false

Duck = Struct.new(:color)
expect([Duck.new('White'), Duck.new('Grey')]).to be_reverse_sorted_by(:color) }  # => success
expect([Duck.new('Grey'), Duck.new('White')]).to be_reverse_sorted_by(:color) }  # => failure
```

## Copyright

Copyright (c) 2014 David DIDIER.
See `LICENSE.txt` for further details.
