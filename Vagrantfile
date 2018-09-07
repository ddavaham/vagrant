Vagrant.configure("2") do |config|

    config.vm.box = "ubuntu/xenial64"

    # config.vm.network "private_network", ip: "192.168.34.10"

    config.vm.synced_folder "../www", "/var/www"

    config.vm.hostname = "ServerAlpha"

    config.vm.provider "virtualbox" do |vb|
        vb.name = "ServerAlpha"
        vb.memory = "4096"
    end

    config.ssh.insert_key = true

    # config.vm.provision :shell, :path => "provision.sh"

end
