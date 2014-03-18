# coding: utf-8
module VagrantPlugins
  module VagrantSnapshot
    module Action
      class List

        def initialize(app, env)
          @app = app
        end

        def call(env)
          @env = env

          env[:ui].info I18n.t('vagrant.actions.vm.snapshot.listing')

          @app.call(env)
        end

      end
    end
  end
end
