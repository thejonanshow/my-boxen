# -*- encoding: utf-8 -*-
# stub: facter 2.5.1 universal-darwin lib

Gem::Specification.new do |s|
  s.name = "facter".freeze
  s.version = "2.5.1"
  s.platform = "universal-darwin".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Puppet Labs".freeze]
  s.date = "2017-08-17"
  s.description = "You can prove anything with facts!".freeze
  s.email = "info@puppetlabs.com".freeze
  s.executables = ["facter".freeze]
  s.files = ["bin/facter".freeze]
  s.homepage = "https://github.com/puppetlabs/facter".freeze
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Facter, a system inventory tool".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<CFPropertyList>.freeze, ["~> 2.2"])
    else
      s.add_dependency(%q<CFPropertyList>.freeze, ["~> 2.2"])
    end
  else
    s.add_dependency(%q<CFPropertyList>.freeze, ["~> 2.2"])
  end
end
