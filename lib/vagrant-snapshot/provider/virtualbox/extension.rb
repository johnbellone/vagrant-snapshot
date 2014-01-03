# coding: utf-8
require 'vagrant/action/builder'

module VagrantPlugins
  module ProviderVirtualBox
    module Extension
      autoload :Action, File.expand_path('../action', __FILE__)

      module Driver
        autoload :Base, File.expand_path('../driver/base', __FILE__)
      end
    end
  end
end
