# coding: utf-8
module VagrantPlugins
  module Snapshot
    module Action
      class Destroy

        def initialize(app, env)
          @app = app
        end

        def call(env)
          @env = env

          env[:ui].info I18n.t('vagrant.actions.vm.snapshot.destroying')

          @app.call(env)
        end

      end
    end
  end
end
