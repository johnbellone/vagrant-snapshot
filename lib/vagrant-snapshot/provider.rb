# coding: utf-8
module VagrantPlugins
  module VagrantSnapshot
    module Provider
      def self.provider_root
        @root ||= Pathname.new(File.expand_path('../provider', __FILE__))
      end
    end
  end
end
