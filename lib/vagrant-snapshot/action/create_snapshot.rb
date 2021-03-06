module VagrantPlugins
  module Snapshot
    class Action::CreateSnapshot
      def initialize(app, env)
        @app = app
      end

      def call(env)
        @env = env

        # TODO: Options from configuration or command flags.
        env[:ui].info I18n.t('vagrant.actions.vm.snapshot.creating')
        env[:machine].provider.driver.create_snapshot({})

        @app.call(env)
      end
    end
  end
end
