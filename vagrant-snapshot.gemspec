# coding: utf-8
$:.unshift File.expand_path('../lib', __FILE__)
require 'vagrant-snapshot/version'

Gem::Specification.new do |s|
  s.name = 'vagrant-snapshot'
  s.summary = 'Enables Vagrant for snapshotting.'
  s.description = %q{}
  s.homepage = %q{}
  s.version = VagrantPlugins::Snapshot::VERSION
  s.platform = Gem::Platform::RUBY
  s.license = 'MIT'
  s.authors = 'John Bellone'
  s.email = 'john.bellone.jr@gmail.com'

  s.files = `git ls-files`.split($/)
  s.bindir = 'bin'
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files = s.files.grep(%r{^(test|spec)/})
  s.require_path = 'lib'

  s.required_rubygems_version = '>= 1.3.6'
  s.rubyforge_project = 'vagrant-snapshot'

  s.required_ruby_version = '>= 1.9.3'

  s.add_runtime_dependency 'fog', '~> 1.19'

  s.add_development_dependency 'bundler', '~> 1.3'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'pry-debugger'
  s.add_development_dependency 'guard-minitest'
end
