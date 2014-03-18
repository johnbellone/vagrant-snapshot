# coding: utf-8
module VagrantPlugins
  module VagrantAWS
    module Action
      action_root = Pathname.new(File.expand_path('../action', __FILE__))
      autoload :CreateSnapshot, action_root.join('create_snapshot')
      autoload :DestroySnapshot, action_root.join('destroy_snapshot')
      autoload :RestoreSnapshot, action_root.join('restore_snapshot')
      autoload :ListSnapshots, action_root.join('list_snapshots')
    end
  end
end
