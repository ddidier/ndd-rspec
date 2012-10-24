# NDD-RSpec

[![Build Status](https://secure.travis-ci.org/ddidier/ndd-rspec.png)](http://travis-ci.org/ddidier/ndd-rspec)
[![Dependency Status](https://gemnasium.com/ddidier/ndd-rspec.png)](https://gemnasium.com/ddidier/ndd-rspec)

RSpec utilities.

## Matchers

### be\_sorted\_by

```ruby
[1, 2, 3].should be_sorted_by(:to_i) # => true
[1, 3, 2].should be_sorted_by(:to_i) # => false
```

### be\_reverse\_sorted\_by

```ruby
[3, 2, 1].should be_reverse_sorted_by(:to_i) # => true
[1, 3, 2].should be_reverse_sorted_by(:to_i) # => false
```

## Contributing to ndd-rspec

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version,
  or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 David DIDIER. See LICENSE.txt for further details.
