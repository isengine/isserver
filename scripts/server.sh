#!/usr/bin/env bash

sudo mkdir -p /var/www/server.com/public
sudo chown -R $USER:$USER /var/www/server.com/public
sudo chmod -R 755 /var/www/server.com

sudo chmod -R 755 /var/www/server.com
sudo cp -f $1/scripts/ubuntu/index.php /var/www/server.com/public/index.php
sudo cp -f $1/scripts/ubuntu/nginx.conf /etc/nginx/sites-available/server.com.conf
sudo ln -s /etc/nginx/sites-available/server.com.conf /etc/nginx/sites-enabled

sudo systemctl enable nginx
sudo systemctl restart nginx
