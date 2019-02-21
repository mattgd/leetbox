# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.define "leetbox.local", primary: true do |app|
    app.vm.hostname = "leetbox"

    app.vm.network "private_network", type: "dhcp"
  end

  #config.vm.network "public_network", ip: "192.168.0.23"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--name", "leetbox", "--memory", "1024"]
  end

  config.vm.provider "docker" do |d, override|
    override.vm.box = nil

    d.name = "Leetbox"
    d.build_dir = "docker"
    d.create_args = ["--publish-all", "--security-opt=seccomp:unconfined",
                     "--tmpfs=/run", "--tmpfs=/run/lock", "--tmpfs=/tmp",
                     "--volume=/sys/fs/cgroup:/sys/fs/cgroup:ro"]
    d.has_ssh = true
  end

  # Synced folder for file transfers from local
  config.vm.synced_folder "./files", "/home/vagrant/files"

  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.provision "file", source: ".bash_aliases", destination: "~/.bash_aliases"
end
