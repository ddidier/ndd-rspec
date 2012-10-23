source 'http://rubygems.org'

HOST_OS = RbConfig::CONFIG['host_os']


# ------------------------------------------------------------------------------
# Dependencies required to use the gem.
gem 'rspec', '~> 2.11.0'


# ------------------------------------------------------------------------------
# Dependencies to develop the gem.
# Everything needed to run rake, tests, features, etc.
group :development do
  gem 'bundler',        '~> 1.2.0'
  gem 'guard',          '~> 1.5.0'
  gem 'guard-bundler',  '~> 1.0.0'
  gem 'guard-rspec',    '~> 2.1.0'
  gem 'guard-spork',    '~> 1.2.0'
  gem 'jeweler',        '~> 1.8.4'
 #gem 'rcov',           '~> 0'
  gem 'rdoc',           '~> 3.12'
  gem 'rspec',          '~> 2.11.0'

  case HOST_OS
    when /darwin/i
      gem 'growl'
      gem 'rb-fsevent'
    when /linux/i
      gem 'libnotify'
      gem 'rb-inotify'
    when /mswin|windows/i
      gem 'rb-fchange'
      gem 'rb-notifu'
      gem 'win32console'
    else
      raise "Platform '#{HOST_OS}' is not supported"
  end

end
