# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "omnibus-ruby-#{ENV['DEGITALOCEAN_IMAGE']}" do |c|
    c.vm.provider :digital_ocean do |provider, override|
      provider.ssh_key_name = ENV['DEGITALOCEAN_SSHKEY']
      override.ssh.private_key_path = ENV['VAGRANT_PRIVATE_KEY_PATH']
      override.vm.box = 'digital_ocean'
      override.vm.box_url = "https://github.com/devopsgroup-io/vagrant-digitalocean/raw/master/box/digital_ocean.box"
      provider.token = ENV['DEGITALOCEAN_TOKEN']
      provider.image = ENV['DEGITALOCEAN_IMAGE']
      provider.region = 'sgp1'
      provider.size = '8gb'
    end
  end

  config.vm.provision "shell", inline: <<-SHELL
    yum install epel-release -y
    yum install make gcc gcc-c++ git kernel-devel zlib-devel openssl-devel readline-devel curl-devel sqlite-devel libyaml-devel libffi-devel rpm-build autoconf -y
    git config --global user.email #{ENV['GIT_EMAIL']}
    git config --global user.name #{ENV['GIT_USERNAME']}
    cd /usr/local/
    git clone https://github.com/tagomoris/xbuild.git
    /usr/local/xbuild/ruby-install 2.4.0 /usr/local/ruby-2.4.0
    echo 'export PATH=/usr/local/ruby-2.4.0/bin:$PATH' > /etc/profile.d/ruby-2.4.0.sh
    source /etc/profile.d/ruby-2.4.0.sh
    gem install bundler omnibus
    cd /
    git clone https://github.com/youyo/omnibus-ruby.git
    cd omnibus-ruby
    bundle install --binstubs
    ./bin/omnibus build ruby
  SHELL
end
