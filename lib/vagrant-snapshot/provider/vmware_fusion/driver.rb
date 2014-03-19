# coding: utf-8
module VagrantPlugins
  module ProviderVmwareFusion
    module Extension
      module Driver
        def self.driver_root
          @root ||= Pathname.new(File.expand_path('../driver', __FILE__)) 
        end        

        autoload :Base, File.join(driver_root, 'base')
      end
    end
  end
end
