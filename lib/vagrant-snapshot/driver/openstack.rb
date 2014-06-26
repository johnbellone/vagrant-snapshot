module VagrantPlugins
  module Snapshot
    module Driver
      class OpenStack
        # Creates a snapshot of the associated VM.
        # @param [Hash] options Flags for the snapshot creation.
        def create_snapshot(options={})
        end

        # Destroys a snapshot associated with this VM.
        # @param [String] name Unique identifier for the snapshot.
        def destroy_snapshot(name)
        end

        # Lists the snapshots of this VM.
        # @param [Hash] options Flags for snapshot listing.
        def list_snapshots(options)
        end

        # Restores this VM to a prior snapshot.
        # @param [String] name Unique identifier for the snapshot.
        def restore_snapshot(name)
        end
      end
    end
  end
end
