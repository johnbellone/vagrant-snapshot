# coding: utf-8
require 'pathname'

module VagrantPlugins
  module Snapshot
    lib_path = Pathname.new(File.expand_path('../vagrant-snapshot', __FILE__))
  end
end
