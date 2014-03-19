# coding: utf-8
require 'vagrant/action/builder'

module VagrantPlugins
  module ProviderVmwareFusion
    module Extension
      def self.extension_root
        @root ||= Pathname.new(File.dirname(__FILE__)) 
      end

      autoload :Driver, File.join(extension_root, 'driver')
    end
  end
end
