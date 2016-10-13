# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box_check_update = false
    # Build image with packer: https://github.com/oisis/packer-centos7
    config.vm.box = "centos71"
    config.vm.provider :virtualbox do |vb|
        vb.gui = false
    end

$fill_hosts = <<SCRIPT
cat > /etc/hosts <<EOF
127.0.0.1 localhost localhost.localdomain localhost4 localhost4.localdomain4
::1       localhost localhost.localdomain localhost6 localhost6.localdomain6
192.168.0.2 etcd1.example.com
192.168.0.3 etcd2.example.com
192.168.0.4 etcd3.example.com
192.168.0.10 k8s1.example.com
192.168.0.11 k8s2.example.com
192.168.0.20 k8s-node1.example.com
192.168.0.21 k8s-node2.example.com
192.168.0.100 etcd.example.com
192.168.0.100 k8s.example.com
192.168.0.100 www.example.com
192.168.0.100 lb.example.com
192.168.0.200 test.example.com
EOF
SCRIPT

  config.vm.define "lb" do |config|
    config.vm.hostname = "lb.example.com"
    config.vm.provision "shell", inline: $fill_hosts
    config.vm.network :private_network,ip: "192.168.0.100"
    config.vm.network :forwarded_port, guest: 1936, host: 1936
    config.vm.provision :puppet do |puppet|
      puppet.module_path = 'modules'
      puppet.manifest_file = 'site.pp'
      puppet.working_directory = "/vagrant"
      puppet.hiera_config_path = "hiera.yaml"
      puppet.environment = "vagrant"
      puppet.facter = {
        "environment"     => "vagrant",
        "system_role"     => "loadbalancer",
        "system_profile"  => "loadbalancer",
      }
    end
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", 1, "--ioapic", "on", "--cpuexecutioncap", "50"]
    end
  end

  config.vm.define "etcd1" do |config|
    config.vm.hostname = "etcd1.example.com"
    config.vm.provision "shell", inline: $fill_hosts
    config.vm.network :private_network,ip: "192.168.0.2"
    config.vm.network :forwarded_port, guest: 2379, host: 2379
    config.vm.network :forwarded_port, guest: 4001, host: 4001
    config.vm.provision :puppet do |puppet|
      puppet.module_path = 'modules'
      puppet.manifest_file = 'site.pp'
      puppet.working_directory = "/vagrant"
      puppet.hiera_config_path = "hiera.yaml"
      puppet.environment = "vagrant"
      puppet.facter = {
        "environment"     => "vagrant",
        "system_role"     => "etcd",
        "system_profile"  => "etcd",
      }
    end
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "256", "--cpus", 1, "--ioapic", "on", "--cpuexecutioncap", "50"]
    end
  end

  config.vm.define "etcd2" do |config|
    config.vm.hostname = "etcd2.example.com"
    config.vm.provision "shell", inline: $fill_hosts
    config.vm.network :private_network,ip: "192.168.0.3"
    config.vm.provision :puppet do |puppet|
      puppet.module_path = 'modules'
      puppet.manifest_file = 'site.pp'
      puppet.working_directory = "/vagrant"
      puppet.hiera_config_path = "hiera.yaml"
      puppet.environment = "vagrant"
      puppet.facter = {
        "environment"     => "vagrant",
        "system_role"     => "etcd",
        "system_profile"  => "etcd",
      }
    end
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "256", "--cpus", 1, "--ioapic", "on", "--cpuexecutioncap", "50"]
    end
  end

  config.vm.define "etcd3" do |config|
    config.vm.hostname = "etcd3.example.com"
    config.vm.provision "shell", inline: $fill_hosts
    config.vm.network :private_network,ip: "192.168.0.4"
    config.vm.provision :puppet do |puppet|
      puppet.module_path = 'modules'
      puppet.manifest_file = 'site.pp'
      puppet.working_directory = "/vagrant"
      puppet.hiera_config_path = "hiera.yaml"
      puppet.environment = "vagrant"
      puppet.facter = {
        "environment"     => "vagrant",
        "system_role"     => "etcd",
        "system_profile"  => "etcd",
      }
    end
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "256", "--cpus", 1, "--ioapic", "on", "--cpuexecutioncap", "50"]
    end
  end


  config.vm.define "k8s1" do |config|
    config.vm.hostname = "k8s1.example.com"
    config.vm.provision "shell", inline: $fill_hosts
    config.vm.network :private_network,ip: "192.168.0.10"
    config.vm.network :forwarded_port, guest: 8080, host: 8080
    config.vm.provision :puppet do |puppet|
      puppet.module_path = 'modules'
      puppet.manifest_file = 'site.pp'
      puppet.working_directory = "/vagrant"
      puppet.hiera_config_path = "hiera.yaml"
      puppet.environment = "vagrant"
      puppet.facter = {
        "environment"     => "vagrant",
        "system_role"     => "k8s_master",
        "system_profile"  => "k8s_master",
      }
    end
    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", 1, "--ioapic", "on", "--cpuexecutioncap", "50"]
    end
  end

  config.vm.define "k8s2" do |config|
    config.vm.hostname = "k8s2.example.com"
    config.vm.provision "shell", inline: $fill_hosts
    config.vm.network :private_network,ip: "192.168.0.11"
    config.vm.provision :puppet do |puppet|
      puppet.module_path = 'modules'
      puppet.manifest_file = 'site.pp'
      puppet.working_directory = "/vagrant"
      puppet.hiera_config_path = "hiera.yaml"
      puppet.environment = "vagrant"
      puppet.facter = {
        "environment"     => "vagrant",
        "system_role"     => "k8s_master",
        "system_profile"  => "k8s_master",
      }
    end
    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", 1, "--ioapic", "on", "--cpuexecutioncap", "50"]
    end
  end

  config.vm.define "node1" do |config|
    config.vm.hostname = "k8s-node1.example.com"
    config.vm.provision "shell", inline: $fill_hosts
    config.vm.network :private_network,ip: "192.168.0.20"
    config.vm.provision :puppet do |puppet|
      puppet.module_path = 'modules'
      puppet.manifest_file = 'site.pp'
      puppet.working_directory = "/vagrant"
      puppet.hiera_config_path = "hiera.yaml"
      puppet.environment = "vagrant"
      puppet.facter = {
        "environment"     => "vagrant",
        "system_role"     => "k8s_node",
        "system_profile"  => "k8s_node",
      }
    end
    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024", "--cpus", 1, "--ioapic", "on", "--cpuexecutioncap", "50"]
    end
  end

  config.vm.define "node2" do |config|
    config.vm.hostname = "k8s-node2.example.com"
    config.vm.provision "shell", inline: $fill_hosts
    config.vm.network :private_network,ip: "192.168.0.21"
    config.vm.provision :puppet do |puppet|
      puppet.module_path = 'modules'
      puppet.manifest_file = 'site.pp'
      puppet.working_directory = "/vagrant"
      puppet.hiera_config_path = "hiera.yaml"
      puppet.environment = "vagrant"
      puppet.facter = {
        "environment"     => "vagrant",
        "system_role"     => "k8s_node",
        "system_profile"  => "k8s_node",
      }
    end
    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024", "--cpus", 1, "--ioapic", "on", "--cpuexecutioncap", "50"]
    end
  end

  config.vm.define "test" do |config|
    config.vm.hostname = "test.example.com"
    config.vm.provision "shell", inline: $fill_hosts
    config.vm.network :private_network,ip: "192.168.0.200"
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024", "--cpus", 1, "--ioapic", "on", "--cpuexecutioncap", "50"]
    end
  end
end
