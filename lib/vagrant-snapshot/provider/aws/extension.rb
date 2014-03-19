# coding: utf-8
require 'vagrant/action/builder'

module VagrantPlugins
  module ProviderAWS
    module Extension
      def self.extension_root
        @root ||= Pathname.new(File.expand_path('../extension', __FILE__)) 
      end
      
      autoload :Action, File.join(extension_root, 'action')
    end
  end
end
