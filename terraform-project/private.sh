#!/bin/bash
sudo -i 
apt update -y
apt install mysql-server -y
systemctl start mysql -y
