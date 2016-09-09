## Puppet for Kubernetes HA

Vagrant + Puppet manifests for Kubernetes HA.

### Puppet modules, roles, and profiles
This repo works on a [roles/profile architecture](https://puppetlabs.com/presentations/designing-puppet-rolesprofiles-pattern).
Roles can be found in `hieradata/roles` and profiles are in `modules/profiles`.

### Architecture:
- 1x loadbalancer(Nginx)
- 3x etcd server (cluster HA)
- 2x Kubernetes master(Cluster HA)
- 2x Kuberentes nodes

### Hardware requirements for Vagrant:
- around 4GB free RAM
- 2-4 CPU cores
- 20GB free HDD space

## Prepare Vagrant box for virtualbox 
Please use [this description](https://github.com/oisis/packer-centos7) to do it.

### Clone this repo:
```git clone https://github.com/oisis/kubernetes-ha```

```cd /kubernetes-ha```

### Install librarian-puppet:
```gem install librarian-puppet```

### Install puppet modules
```librarian-puppet install```

### Run Vagrant
```vagrant up```
