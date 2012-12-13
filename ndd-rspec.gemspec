# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ndd-rspec"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David DIDIER"]
  s.date = "2012-12-13"
  s.description = "RSpec utilities"
  s.email = "c_inconnu2@yahoo.fr"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".travis.yml",
    "CHANGELOG.md",
    "Gemfile",
    "Gemfile.lock",
    "Guardfile",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/ndd/rspec/matchers.rb",
    "lib/ndd/rspec/matchers/be_reverse_sorted_by.rb",
    "lib/ndd/rspec/matchers/be_sorted_by.rb",
    "ndd-rspec.gemspec",
    "spec/ndd/rspec/matchers/be_reverse_sorted_by_spec.rb",
    "spec/ndd/rspec/matchers/be_sorted_by_spec.rb",
    "spec/ndd/rspec/matchers/shared_examples.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/ddidier/ndd-rspec"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "RSpec utilities"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspec>, ["~> 2.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.2"])
      s.add_development_dependency(%q<guard>, ["~> 1.0"])
      s.add_development_dependency(%q<guard-bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<guard-rspec>, ["~> 2.0"])
      s.add_development_dependency(%q<guard-spork>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.7"])
      s.add_development_dependency(%q<libnotify>, [">= 0"])
      s.add_development_dependency(%q<rb-inotify>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, ["~> 2.0"])
      s.add_dependency(%q<bundler>, ["~> 1.2"])
      s.add_dependency(%q<guard>, ["~> 1.0"])
      s.add_dependency(%q<guard-bundler>, ["~> 1.0"])
      s.add_dependency(%q<guard-rspec>, ["~> 2.0"])
      s.add_dependency(%q<guard-spork>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<simplecov>, ["~> 0.7"])
      s.add_dependency(%q<libnotify>, [">= 0"])
      s.add_dependency(%q<rb-inotify>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2.0"])
    s.add_dependency(%q<bundler>, ["~> 1.2"])
    s.add_dependency(%q<guard>, ["~> 1.0"])
    s.add_dependency(%q<guard-bundler>, ["~> 1.0"])
    s.add_dependency(%q<guard-rspec>, ["~> 2.0"])
    s.add_dependency(%q<guard-spork>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<simplecov>, ["~> 0.7"])
    s.add_dependency(%q<libnotify>, [">= 0"])
    s.add_dependency(%q<rb-inotify>, [">= 0"])
  end
end

