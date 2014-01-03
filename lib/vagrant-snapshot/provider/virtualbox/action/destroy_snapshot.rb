# coding: utf-8
module VagrantPlugins
  module ProviderVirtualBox
    module Action
      class DestroySnapshot

        def initialize(app, env)
          @app = app
        end

        def call(env)
          @env = env
        end

      end
    end
  end
end
