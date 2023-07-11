#!/bin/bash

# Define  command
ssh_command="ssh -i home/tomas/projekt/.vagrant/machines/machine1/virtualbox/private_key
 -o StrictHostKeyChecking=no"

ssh_command="ssh -i home/tomas/projekt/.vagrant/machines/machine2/virtualbox/private_key
 -o StrictHostKeyChecking=no"

ssh_command="ssh -i home/tomas/projekt/.vagrant/machines/machine3/virtualbox/private_key
 -o StrictHostKeyChecking=no"

# host machine 1 & users
machine_1_host="machine1"
machine_1_user1="hera"
machine_1_user2="demeter"
machine_1_user3="zeus"
machine_1_user4="poseidon"

# host machine 2 & users
machine_2_host="machine2"
machine_2_user1="hera"
machine_2_user2="demeter"
machine_2_user3="zeus"
machine_2_user4="poseidon"

# host machine 3 & users
machine_3_host="machine3"
machine_3_user1="hera"
machine_3_user2="demeter"
machine_3_user3="zeus"
machine_3_user4="poseidon"

# connect to machine 1 
$ssh_command $machine_1_user1@$machine_1_host
$ssh_command $machine_1_user2@$machine_1_host
$ssh_command $machine_1_user3@$machine_1_host
$ssh_command $machine_1_user4@$machine_1_host

# connect to machine 2 
$ssh_command $machine_1_user1@$machine_2_host
$ssh_command $machine_1_user2@$machine_2_host
$ssh_command $machine_1_user3@$machine_2_host
$ssh_command $machine_1_user4@$machine_2_host

# connect to machine 3 
$ssh_command $machine_1_user1@$machine_3_host
$ssh_command $machine_1_user2@$machine_3_host
$ssh_command $machine_1_user3@$machine_3_host
$ssh_command $machine_1_user4@$machine_3_host


