# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'

  config.vm.network :private_network, ip: '192.168.65.2'
  config.vm.network 'forwarded_port', guest: 3000, host: 3000
  config.vm.network 'forwarded_port', guest: 35729, host: 35729

  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--memory', '2048']
    vb.customize ['modifyvm', :id, '--cpus', '4']
    vb.customize ['modifyvm', :id, '--cpuexecutioncap', '80']
  end

  config.ssh.forward_agent = true

  if Vagrant.has_plugin?('vagrant-cachier')
    config.cache.scope = :box
    config.cache.synced_folder_opts = {
      type: :nfs,
      mount_options: %w(rw vers=3 tcp nolock)
    }
    config.cache.enable :apt
    config.cache.enable :npm
    config.cache.enable :gem
  end

  config.vm.provision 'shell', inline: <<-SHELL
    apt-get update
    apt-get install --yes software-properties-common
    apt-add-repository ppa:brightbox/ruby-ng
    apt-get update

    apt-get install --yes ruby2.2 ruby2.2-dev ruby-switch
    apt-get install --yes nodejs npm
    apt-get install --yes git htop

    apt-get install --yes sqlite3 libsqlite3-dev libpq-dev
    apt-get install --yes build-essential libtool autoconf pkg-config libxml2-dev

    ruby-switch --set ruby2.2
    gem install bundler

    cd /vagrant
    bundle config build.libv8 --with-system-v8
    bundle
    bundle exec rake db:setup db:seed
  SHELL
end
