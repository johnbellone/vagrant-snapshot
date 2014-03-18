# coding: utf-8
$:.unshift File.expand_path('../lib', __FILE__)
require 'vagrant-snapshot/version'

Gem::Specification.new do |spec|
  spec.name = 'vagrant-snapshot'
  spec.version = VagrantPlugins::VagrantSnapshot::VERSION
  spec.authors = ['John Bellone']
  spec.email = ['jbellone@bloomberg.net']
  spec.description = 'A Vagrant plugin which exposes virtual machine snapshot features.'
  spec.summary = spec.description
  spec.homepage = 'https://github.com/johnbellone/vagrant-snapshot'
  spec.license = 'Apache 2.0'
  spec.cert_chain    = ['certs/jbellone.pem']
  spec.signing_key   = File.join(Dir.home, '.config/gem-private_key.pem') if $0 =~ /gem\z/
  
  spec.files = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']  
  spec.required_ruby_version = '>= 2.0'

  spec.add_runtime_dependency 'fog', '~> 1.18'
end
