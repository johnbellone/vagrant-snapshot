# coding: utf-8
module VagrantPlugins
  module Snapshot
    module Command
      class Restore < Vagrant.plugin('2', :command)
        
        def initialize(app, env)
          @app = app
        end

        def call(env)
          @env = env

          env[:ui].info I18n.t('vagrant.actions.vm.snapshot.restoring',
            name: env[:machine].box.name)

          env[:machine].provider.driver.restore_snapshot(env[:snapshot_name])

          @app.call(env)
        end
        
      end
    end
  end
end
