source 'http://rubygems.org'

HOST_OS = RbConfig::CONFIG['host_os']


# ------------------------------------------------------------------------------
# Dependencies required to use the gem.
gem 'rspec', '~> 3.3'


# ------------------------------------------------------------------------------
# Dependencies to develop the gem.
# Everything needed to run rake, tests, features, etc.
group :development do
  gem 'bundler',       '~> 1.10', require: false
  gem 'guard',         '~> 2.13', require: false
  gem 'guard-bundler', '~> 2.0',  require: false
  gem 'guard-rspec',   '~> 4.6',  require: false
  gem 'guard-spork',   '~> 2.0',  require: false
  gem 'jeweler',       '~> 2.0',  require: false
  gem 'rdoc',          '~> 4.1',  require: false
  gem 'simplecov',     '~> 0.9',  require: false
  gem 'spork',         '~> 0.9',  require: false
  gem 'yard',          '~> 0.8',  require: false

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

group :test do
  gem 'codeclimate-test-reporter', '~> 0.4', require: false
end
