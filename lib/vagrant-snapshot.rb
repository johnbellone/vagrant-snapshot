# coding: utf-8
require 'pathname'

module VagrantPlugins
  module VagrantSnapshot
    lib_path = Pathname.new(File.expand_path('../vagrant-snapshot', __FILE__))
    autoload :Action, lib_path.join('action')

    def self.source_root
      @source_root ||= Pathname.new(File.expand_path('../../', __FILE__))
    end
  end
end
