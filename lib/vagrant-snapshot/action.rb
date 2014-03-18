# coding: utf-8
module VagrantPlugins
  module VagrantSnapshot
    module Action
      action_root = Pathname.new(File.expand_path('../action', __FILE__))
      autoload :Create, action_root.join('create')
      autoload :Destroy, action_root.join('destroy')
      autoload :Restore, action_root.join('restore')
      autoload :List, action_root.join('list')
    end
  end
end
