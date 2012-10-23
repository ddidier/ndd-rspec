# ----------------------------------------------------------------------------------------------------------------------
# More info at https://github.com/guard/guard#readme
# ----------------------------------------------------------------------------------------------------------------------


# ----------------------------------------------------------------------------------------------------------------------
# bundler
# ----------------------------------------------------------------------------------------------------------------------

guard 'bundler' do
  watch('Gemfile')
end


# ----------------------------------------------------------------------------------------------------------------------
# spork (must be before rspec and cucumber)
# ----------------------------------------------------------------------------------------------------------------------

guard 'spork',
      :wait => 60 do

  watch('Gemfile')
  watch('Gemfile.lock')

  # ----- spec directory
  watch('spec/spec_helper.rb')
end


# ----------------------------------------------------------------------------------------------------------------------
# rspec
# ----------------------------------------------------------------------------------------------------------------------

guard 'rspec',
      :all_after_pass => false,
      :all_on_start => false,
      :cli => '--colour --drb --format documentation --tag focused' do

  # ----- lib directory
  watch(%r{^lib/(.+)\.rb$}) { |m| %W(spec/#{m[1]}_spec.rb) }

  # ----- spec directory
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^spec/support/(.+)\.rb$}) { %W(spec) }
end
