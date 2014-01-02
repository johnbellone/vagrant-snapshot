# coding: utf-8
Vagrant.configure('2') do |config|
  config.vm.hostname = 'vagrant-snapshot-test'
  config.vm.box = 'opscode-centos-6.5-i386'
  
  config.vm.provider :virtualbox do |vb, override|
    override.vm.box_url = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5-i386_chef-provisionerless.box'
  end

  config.vm.provider :vmware_fusion do |vw, override|
    override.vm.box_url = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/vmware/opscode_centos-6.5-i386_chef-provisionerless.box'
  end
end
