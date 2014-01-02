# coding: utf-8
module VagrantPlugins
  module Snapshot
    module Command
      class List < Vagrant.plugin('2', :command)

        def initialize(app, env)
          @app = app
        end

        def call(env)
          @env = env
          
          env[:ui].info I18n.t('vagrant.actions.vm.snapshot.listing',
            name: env[:machine].box.name)

          env[:machine].provider.driver.list_snapshots

          @app.call(env)          
        end
      end
    end
  end
end
