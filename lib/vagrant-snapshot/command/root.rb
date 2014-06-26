module VagrantPlugins
  module Snapshot
    # Defines the root command for `vagrant snapshot` which delegates work
    # out to subcommands for general management.
    class Command::Root < Vagrant.plugin('2', :command)
      def self.synopsis
        'Manages snapshots: creation, deletion, etc.'
      end

      # @param [Integer] argc
      # @param [Array] argv
      def initialize(argc, argv)
        super

        @main_args, @sub_command, @sub_args = split_main_and_subcommand(argv)

        @subcommands = Vagrant::Registry.new
        @subcommands.register(:list) do
          require_relative 'list'
          List
        end

        @subcommands.register(:create) do
          require_relative 'create'
          Create
        end

        @subcommands.register(:destroy) do
          require_relative 'destroy'
          Destroy
        end

        @subcommands.register(:restore) do
          require_relative 'restore'
          Restore
        end

        @subcommands.register(:show) do
          require_relative 'show'
          Restore
        end

        # TODO: When provider capabilities are available expose volume the
        # volume snapshots for OpenStack/Amazon.

        # TODO: When host capabilities are available expose filesystem
        # snapshots prior (and after) running provisioners.
      end

      def execute
        # Print the help description for all the subcommands.
        return help if @main_args.include?('-h') || @main_args.include?('--help')

        # At this point we have a subcommand that needs to be parsed and
        # dispatched. Use the registry that was built on initialization.
        command_klass = @subcommands.get(@sub_command.to_sym) if @sub_command
        return help unless command_klass

        @logger.debug("Invoking command class: #{command_klass} with #{@sub_args.inspect}")
        command_klass.new(@sub_args, @env).execute
      end

      def help
        opts = OptionParser.new do |o|
          o.banner = 'Usage: vagrant snapshot <command> [<args>]'
          o.separator ''
          o.separator 'Available subcommands:'

          @subcommands.keys.sort.each { |k| o.separator "     #{k}" }

          o.separator ''
          o.separator 'For help on any individual command run `vagrant snapshot COMMAND -h'
        end

        @env.ui.info(opts.help, prefix: false)
      end
    end
  end
end
