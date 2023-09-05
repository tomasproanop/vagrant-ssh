#!/bin/bash

sudo mkdir -p /home/hera/.ssh
sudo touch /home/hera/.ssh/authorized_keys
sudo chown -R hera:hera /home/hera/.ssh
sudo chmod 700 /home/hera/.ssh
sudo chmod 600 /home/hera/.ssh/authorized_keys

sudo mkdir -p /home/demeter/.ssh
sudo touch /home/demeter/.ssh/authorized_keys
sudo chown -R demeter:demeter /home/demeter/.ssh
sudo chmod 700 /home/demeter/.ssh
sudo chmod 600 /home/demeter/.ssh/authorized_keys

sudo mkdir -p /home/poseidon/.ssh
sudo touch /home/poseidon/.ssh/authorized_keys
sudo chown -R poseidon:poseidon /home/poseidon/.ssh
sudo chmod 700 /home/poseidon/.ssh
sudo chmod 600 /home/poseidon/.ssh/authorized_keys

sudo mkdir -p /home/zeus/.ssh
sudo touch /home/zeus/.ssh/authorized_keys
sudo chown -R zeus:zeus /home/zeus/.ssh
sudo chmod 700 /home/zeus/.ssh
sudo chmod 600 /home/zeus/.ssh/authorized_keys


