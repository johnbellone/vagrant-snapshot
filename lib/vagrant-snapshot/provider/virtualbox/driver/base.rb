# coding: utf-8
module VagrantPlugins
  module ProviderVirtualBox
    module Extension
      class Base
        # Creates a snapshot of the associated VM.
        #
        # @param [Hash] options Flags for the snapshot creation.
        def create_snapshot(options={})
          args = []
          args.concat(['--description', options[:description]]) if options[:description]
          args.concat('--live') if options[:live]

          execute('snapshot', @uuid, 'take', options[:name], *args)
        end

        # Destroys a snapshot associated with this VM.
        #
        # @param [String] name Unique identifier for the snapshot.
        def destroy_snapshot(name)
          execute('snapshot', @uuid, 'delete', name)
        end

        # Lists the snapshots of this VM.
        #
        # @param [Hash] options Flags for snapshot listing.
        def list_snapshots(options)
          args = []
          args.concat('--details') if options[:details]
          args.concat('--machinereadable') if options[:machine_readable]

          # TODO: Print this out in a fancy graph somehow. Likely going to always want
          # machine readable and build a decent visual representation.
          execute('snapshot', @uuid, 'list', *args)
        end

        # Restores this VM to a prior snapshot.
        #
        # @param [String] name Unique identifier for the snapshot.
        def restore_snapshot(name)
          execute('snapshot', @uuid, 'restore', name)
        end
      end
    end
  end
end
