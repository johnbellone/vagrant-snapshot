module VagrantPlugins
  module Snapshot
    module Driver
      def self.load_providers
        if Vagrant.has_plugin?('vagrant-aws')
          require 'vagrant-plugin/driver/aws'
        end

        if Vagrant.has_plugin('vagrant-openstack-plugin')
          require 'vagrant-plugin/driver/openstack'
        end

        if Vagrant.has_plugin('vagrant-vmware-fusion')
          require 'vagrant-plugin/driver/vmware_fusion'
        end

        require 'vagrant-plugin/driver/virtualbox'
      end
    end
  end
end
