  Vagrant.configure("2") do |config|    
    config.vm.box = "ubuntu/bionic64"    
    config.vm.hostname = "youtrack-env"

    config.vm.provision "shell", path: "provision.sh"

    config.vm.provider "virtualbox" do |vb|
      #vb.gui=true      
      vb.name = "youtrack-env"
      vb.memory = "2048"
      vb.cpus = 2
      vb.customize ["modifyvm", :id, "--vram", "256"]
      vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']  
    end
end
