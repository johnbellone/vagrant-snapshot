module VagrantPlugins
  module Snapshot
    class Action::DestroySnapshot
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
