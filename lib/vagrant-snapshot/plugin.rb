require 'vagrant-snapshot/action'
require 'vagrant-snapshot/command'
require 'vagrant-snapshot/driver'

module VagrantPlugins
  module Snapshot
    class Plugin < Vagrant.plugin('2')
      def self.require_optional_dependencies!
        %w(vagrant-aws vagrant-openstack-plugin vagrant-vmware-fusion).each do |name|
          begin
            logger.info "Trying to load optional dependency #{name}."
            require name
          rescue Exception => e
            logger.info "Failed to load #{name}: #{e.inspect}"
          end
        end
      end

      # Initialize the Internationalization strings for messages.
      def self.setup_i18n
        I18n.load_path << Snapshot.locales
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

      name 'snapshot command'
      description <<-DESC
        This command helps manage snapshots within the Vagrant environment
        if the guest provider has that capability.
DESC

      setup_i18n
      setup_logging
      require_optional_dependencies!

      command('snapshot') do
        Command::Root
      end
    end
  end
end
