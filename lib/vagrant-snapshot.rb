module VagrantPlugins
  module Snapshot
    def self.root
      File.dirname(__dir__)
    end

    def self.locales
      File.join(root, 'locales')
    end
  end
end

require 'vagrant-snapshot/plugin'
require 'vagrant-snapshot/version'
