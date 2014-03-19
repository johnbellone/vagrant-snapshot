# coding: utf-8
require 'vagrant/action/builder'

module VagrantPlugins
  module ProviderOpenstack
    module Extension
      def self.extension_root
        @root ||= Pathname.new(File.expand_path('../extension', __FILE__))
      end

      module Driver
        autoload :Base, File.expand_path('../driver/base', __FILE__)
      end
    end
  end
end
