# coding: utf-8
require 'vagrant/action/builder'

module VagrantPlugins
  module ProviderVirtualBox
    module Extension
      def self.extension_root
        @root ||= Pathname.new(File.expand_path('../extension', __FILE__))
      end

      autoload :Driver, File.join(extension_root, 'driver')
    end
  end
end
