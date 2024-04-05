#!/bin/bash
sudo -i
apt update -y
apt install nginx -y
echo "<h1>Hello this is terraform nginx1</h1>" >> /var/www/html/index.html
systemctl restart nginx