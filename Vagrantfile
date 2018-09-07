Vagrant.configure("2") do |config|

    config.vm.box = "ubuntu/xenial64"

    config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
    config.vm.network "forwarded_port", guest: 443, host: 8443, host_ip: "127.0.0.1"

    config.vm.synced_folder "../www", "/var/www",
        owner: "www-data",
        group: "www-data",
        mount_options: ['dmode=775', 'fmode=664']

    config.vm.hostname = "ServerAlpha"

    config.vm.provider "virtualbox" do |vb|
        vb.name = "ServerAlpha"
        vb.memory = "4096"
    end

    config.ssh.insert_key = true

    config.vm.provision :shell, :path => "provision.sh"

end
