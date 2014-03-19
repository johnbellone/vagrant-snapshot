# coding: utf-8
module VagrantPlugins
  module ProviderAWS
    module Extension
      module Action
        def self.action_root
          @root ||= Pathname.new(File.expand_path('../action', __FILE__))
        end

        autoload :CreateSnapshot, File.join(action_root, 'create_snapshot')
        autoload :DestroySnapshot, File.join(action_root, 'destroy_snapshot')
        autoload :RestoreSnapshot, File.join(action_root, 'restore_snapshot')
        autoload :ListSnapshots, File.join(action_root, 'list_snapshots')
      end      
    end
  end
end
