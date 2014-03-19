# coding: utf-8
module VagrantPlugins
  module ProviderOpenstack
    module Extension
      module Driver
        def self.driver_root
          @root ||= File.expand_path('../driver', extension_root)
        end

        autoload :Base, File.join(driver_root, 'base')
      end
    end
  end
end
