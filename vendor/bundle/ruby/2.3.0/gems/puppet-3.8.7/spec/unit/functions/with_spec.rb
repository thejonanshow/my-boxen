require 'spec_helper'

require 'puppet_spec/compiler'
require 'matchers/resource'

describe 'the with function' do
  include PuppetSpec::Compiler
  include Matchers::Resource

  before :each do
    Puppet[:parser] = 'future'
  end

  it 'calls a lambda passing no arguments' do
    expect(compile_to_catalog("with() || { notify { testing: } }")).to have_resource('Notify[testing]')
  end

  it 'calls a lambda passing a single argument' do
    expect(compile_to_catalog('with(1) |$x| { notify { "testing$x": } }')).to have_resource('Notify[testing1]')
  end

  it 'calls a lambda passing more than one argument' do
    expect(compile_to_catalog('with(1, 2) |*$x| { notify { "testing${x[0]}, ${x[1]}": } }')).to have_resource('Notify[testing1, 2]')
  end

  it 'passes a type reference to a lambda' do
    expect(compile_to_catalog('notify { test: message => "data" } with(Notify[test]) |$x| { notify { "${x[message]}": } }')).to have_resource('Notify[data]')
  end

  # Conditinoally left out for Ruby 1.8.x since the Proc created for the expected number of arguments will accept
  # a call with fewer arguments and then pass all arguments to the closure. The closure then receives an argument
  # array of correct size with nil values instead of an array with too few arguments
  unless RUBY_VERSION[0,3] == '1.8'
    it 'errors when not given enough arguments for the lambda' do
      expect do
        compile_to_catalog('with(1) |$x, $y| { }')
      end.to raise_error(/Parameter \$y is required but no value was given/m)
    end
  end
end
