# coding: utf-8
module VagrantPlugins
  module VagrantSnapshot
    class Plugin < Vagrant.plugin('2')
      name 'snapshot command'
      description <<-DESC
        This command helps manage snapshots within the Vagrant environment
        if the guest provider has that capability.
DESC

      command('snapshot') do
        require File.expand_path('../command/root', __FILE__)
        setup_i18n
        setup_logging

        Command::Root
      end

      # Initialize the Internationalization strings for messages.
      def self.setup_i18n
        I18n.load_path << File.expand_path('locales/en.yml', Snapshot.source_root)
        I18n.reload!
      end

      # Initialize logging as any Vagrant plugin would.
      def self.setup_logging
        require 'log4r'

        level = Log4r.const_get(ENV['VAGRANT_LOG'].upcase)
        logger = Log4r::Logger.new('vagrant-snapshot')
        logger.outputters = Log4r::Outputter.stderr
        logger.level = level if level.is_a?(Integer)
      rescue NameError
      ensure
        logger = nil
      end
    end

    autoload :Action, File.expand_path('../action', __FILE__)

    module Provider
      provider_root = File.expand_path('../provider', __FILE__)
      autoload :Extension, provider_root.join('virtualbox/extension')
      autoload :Extension, provider_root.join('aws/extension')  
      autoload :Extension, provider_root.join('vmware_fusion/extension')  
      autoload :Extension, provider_root.join('openstack/extension')  
    end
  end
end
