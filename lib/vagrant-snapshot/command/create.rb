# coding: utf-8
module VagrantPlugins
  module Snapshot
    module Command
      class Create < Vagrant.plugin('2', :command)

        def initialize(app, env)
          @app = app
        end

        def call(env)
          @env = env

          env[:ui].info I18n.t('vagrant.actions.vm.snapshot.creating',
            name: env[:machine].box.name)
          
          env[:machine].provider.driver.create_snapshot({
            description: env[:snapshot_description],
            live: env[:snapshot_live],
            name: env[:snapshot_name]
          })

          @app.call(env)
        end

      end
    end
  end
end
