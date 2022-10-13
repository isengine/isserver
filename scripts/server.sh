#!/usr/bin/env bash

sudo mkdir -p /var/www/$2/public
sudo chown -R $USER:$USER /var/www/$2/public
sudo chmod -R 755 /var/www/$2

sudo chmod -R 755 /var/www/$2
sudo cp -f $1/scripts/ubuntu/index.php /var/www/$2/public/index.php
sudo cp -f $1/scripts/ubuntu/nginx.conf /etc/nginx/sites-available/$2.conf
sudo ln -s /etc/nginx/sites-available/$2.conf /etc/nginx/sites-enabled

sudo systemctl enable nginx
sudo systemctl restart nginx
