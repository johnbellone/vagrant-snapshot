require 'pathname'

module VagrantPlugins
  module Snapshot
    def self.source_root
      @source_root ||= Pathname.new(File.expand_path('../../', __FILE__))
    end
  end
end

require 'vagrant-snapshot/plugin'
require 'vagrant-snapshot/version'
