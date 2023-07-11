# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  # Define the base box for the VMs
  config.vm.box = "ubuntu/focal64"
 
  # Create three virtual machines
  (1..3).each do |i|
    config.vm.define "machine#{i}" do |node|

      # Set the hostname for each machine
      node.vm.hostname = "machine#{i}"

      # Configure networking
      node.vm.network "private_network", ip: "192.168.56.#{i}"

      # Provision the machine
      node.vm.provision "shell" do |shell|
        shell.inline = <<-SHELL
          # Install necessary packages
          sudo apt-get install -y openssh-server expect
          sudo apt-get update

          # Create multiple users
          sudo useradd -m poseidon
          sudo useradd -m zeus
          sudo useradd -m hera
          sudo useradd -m demeter
          
          #Generate folders and set permissions
	  sudo mkdir -p /home/hera/.ssh
	  sudo touch /home/hera/.ssh/authorized_keys
	  sudo chown -R hera:hera /home/hera/.ssh
	  sudo chmod 700 /home/hera/.ssh
	  sudo chmod 600 /home/hera/.ssh/authorized_keys
	  sudo chmod 600 /home/hera/.ssh/id_rsa; chmod 600 /home/hera/.ssh/id_rsa.pub

	  sudo mkdir -p /home/demeter/.ssh
	  sudo touch /home/demeter/.ssh/authorized_keys
	  sudo chown -R demeter:demeter /home/demeter/.ssh
	  sudo chmod 700 /home/demeter/.ssh
	  sudo chmod 600 /home/demeter/.ssh/authorized_keys
	  sudo chmod 600 /home/demeter/.ssh/id_rsa; chmod 600 /home/demeter/.ssh/id_rsa.pub

	  sudo mkdir -p /home/poseidon/.ssh
	  sudo touch /home/poseidon/.ssh/authorized_keys
	  sudo chown -R poseidon:poseidon /home/poseidon/.ssh
	  sudo chmod 700 /home/poseidon/.ssh
	  sudo chmod 600 /home/poseidon/.ssh/authorized_keys
	  sudo chmod 600 /home/poseidon/.ssh/id_rsa; chmod 600 /home/poseidon/.ssh/id_rsa.pub

	  sudo mkdir -p /home/zeus/.ssh
	  sudo touch /home/zeus/.ssh/authorized_keys
	  sudo chown -R zeus:zeus /home/zeus/.ssh
	  sudo chmod 700 /home/zeus/.ssh
	  sudo chmod 600 /home/zeus/.ssh/authorized_keys
	  sudo chmod 600 /home/zeus/.ssh/id_rsa; chmod 600 /home/zeus/.ssh/id_rsa.pub

          # Generate ssh keys for passwordless login
          ssh-keygen -t rsa -N "" -f /home/poseidon/.ssh/id_rsa
          ssh-keygen -t rsa -N "" -f /home/zeus/.ssh/id_rsa
          ssh-keygen -t rsa -N "" -f /home/hera/.ssh/id_rsa
          ssh-keygen -t rsa -N "" -f /home/demeter/.ssh/id_rsa

          # Add public keys to authorized_keys file
          cat /home/poseidon/.ssh/id_rsa.pub >> /home/poseidon/.ssh/authorized_keys
          cat /home/zeus/.ssh/id_rsa.pub >> /home/zeus/.ssh/authorized_keys
          cat /home/hera/.ssh/id_rsa.pub >> /home/hera/.ssh/authorized_keys
          cat /home/demeter/.ssh/id_rsa.pub >> /home/demeter/.ssh/authorized_keys

          # Configure SSH server to allow passwordless login
          sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
          sudo systemctl restart sshd
          
          # Install necessary software for running the script
          sudo apt-get update
          sudo apt-get install -y openssh-client
    
          # Copy the SSH login script to the guest machines
          cp /home/tomas/projekt/ssh_login.sh ~/

    	  # Add cron job to automate SSH login
    	  echo "*/5 * * * * ~/ssh_login.sh" >> mycron
    	  crontab mycron
    	  rm mycron
    
        SHELL
      end
    end
  end

  # Provisioner script to log in to other machines via SSH and run evaluation scripts
  config.vm.provision "shell", inline: <<-SHELL
    # Install necessary packages
    sudo apt-get update
    sudo apt-get install -y openssh-client expect

    # Define the evaluation script
    script='#!/bin/bash
  
logfile="/var/log/auth.log"
users=("poseidon" "zeus" "hera" "demeter")

for user in "${users[@]}"; do
  echo "User $user has number of logins $(grep -c "$user" $logfile)"

  first_login=$(grep "$user" $logfile | head -n 1 | awk '{print $1, $2, $3}')
  last_login=$(grep "$user" $logfile | tail -n 1 | awk '{print $1, $2, $3}')
  echo "First login of $user at $first_login"
  echo "Last login of $user at $last_login"

  time_difference=$(($(date -d "$last_login" +%s) - $(date -d "$first_login" +%s)))
  time_difference_formatted=$(date -u -d @"$time_difference" +"%T")
  echo "The time difference between first and last login was $time_difference_formatted."

  num_logins=$(grep -c "$user" $logfile)
  average_time_difference=$((time_difference / (num_logins - 1)))
  average_time_difference_formatted=$(date -u -d @"$average_time_difference" +"%T")
  echo "During the first and last login, the user logged in on average every $average_time_difference_formatted."
done'

  SHELL

end
