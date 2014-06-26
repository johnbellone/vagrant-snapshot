module VagrantPlugins
  module Snapshot
    class Command::Destroy < Vagrant.plugin('2', :command)
      def initialize(app, env)
        @app = app
      end

      def call(env)
        @env = env

        env[:ui].info I18n.t('vagrant.actions.vm.snapshot.destroying',
          name: env[:machine].box.name)

        env[:machine].provider.driver.destroy_snapshot(env[:snapshot_name])

        @app.call(env)
      end

    end
  end
end
end
