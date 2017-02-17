# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  # There is a problem with 'ubuntu/xenial64' with the default user that will be 'ubuntu'
  # instead of 'vagrant'. We will use 'v0rtex/xenial64' instead as mentioned in: 
  # http://askubuntu.com/questions/832137/ubuntu-xenial64-box-password
  config.vm.box = "v0rtex/xenial64"
  #config.vm.box = "ubuntu/xenial64"

  config.vm.hostname = "scibox"

  config.vm.provider "virtualbox" do |vb|
     vb.customize [
      "modifyvm", :id,
      "--memory", "4096",
      "--cpus", "4"
    ]
  end

  # This should be a work around for error:
  # E: Could not get lock /var/lib/dpkg/lock - open (11: Resource temporarily unavailable)
  # it is actually caused by ubuntu 16.04 daily autoupdater which runs 
  # immediately after startup of new box
  config.vm.provision :shell, privileged: true, :path => ".provision/disableAutoUpdate.sh"

  # =================== transfer and configure scripts =====================
  # - tranfer scripts
  # - run preparation script
  config.vm.provision "file", source: ".provision/waitForApt.sh", destination: "waitForApt.sh"
  config.vm.provision :shell, privileged: false, :path => ".provision/prepare.sh"
  # ------------------------------------------------------------------------

  # ============================= provisioning =============================
  # - upgrade if specified by command: > UPGRADE=1 vagrant up
  if(ENV['UPGRADE']) then
    config.vm.provision :shell, privileged: true, :path => ".provision/upgrade.sh"
  end
  # install crucial tools / packages
  config.vm.provision :shell, privileged: false, :path => ".provision/crucial.sh"
  # replace shell with oh-my-zsh
  config.vm.provision :shell, privileged: false, :path => ".provision/installOhMyZsh.sh"
  # run bootstraping script (main)
  config.vm.provision :shell, privileged: false, :path => ".provision/bootstrap.sh"
  # run Julia bootstraping script
  config.vm.provision :shell, privileged: false, :path => ".provision/bootstrapJulia.jl"
  # run configure Jupyter script
  config.vm.provision :shell, privileged: false, :path => ".provision/configureJupyter.sh"
  # cleanup after provisioning
  config.vm.provision :shell, privileged: false, :path => ".provision/cleanup.sh"
  
  # ------------------------------------------------------------------------


  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.

  config.vm.network "forwarded_port", guest: 8888, host: 8888, auto_correct: true
  config.vm.network "forwarded_port", guest: 8000, host: 8000, auto_correct: true
  
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.synced_folder "projects", "/home/vagrant/projects", create: true
 
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL

  # reboot is required if box was upgraded 
  if(ENV['UPGRADE']) then
      print "The machine after upgrade needs reboot. Please run 'vagrant reload'\n"
      # this doesnt work very well - it will caus vagrant to display disconnection
      # message during provisioning. vagrant-reload plugin would be probably better
      # see: https://github.com/aidanns/vagrant-reload
      # config.vm.provision :shell, privileged: true, :path => ".provision/reboot.sh"
  end

  # ============================= always run =============================
  config.vm.provision "shell", run: "always", privileged: false, inline: <<-SHELL
    jupyter notebook --notebook-dir=~/projects &
  SHELL
  # ----------------------------------------------------------------------

end
