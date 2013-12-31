# coding: utf-8
$:.unshift File.expand_path('../lib', __FILE__)
require 'vagrant-snapshot/version'

Gem::Specification.new do |s|
  s.name = 'vagrant-snapshot'
  s.summary = 'Enables Vagrant to manage snapshots.'
  s.version = VagrantPlugins::Snapshot::VERSION
  s.platform = Gem::Platform::RUBY
  s.license = 'MIT'
  s.authors = 'John Bellone'
  s.email = 'jbellone@bloomberg.net'
  
  s.required_rubygems_version = '>= 1.3.6'
  s.rubyforge_project = 'vagrant-snapshot'
  
  s.add_runtime_dependency 'fog', '~> 1.18'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'  
  s.add_development_dependency 'pry-debugger'

  s.require_path = 'lib'
end
