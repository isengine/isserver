#!/usr/bin/env bash

echo

# Nginx

#echo Nginx
#echo install Nginx

sudo apt update
sudo apt install nginx
sudo ufw allow 'Nginx Full'

sudo mkdir -p /var/www/server/public
sudo chown -R $USER:$USER /var/www/server/public
sudo chmod -R 755 /var/www/server

sudo chmod -R 755 /var/www/server
sudo cp -f $1/scripts/ubuntu/index.php /var/www/server/public/index.php
sudo cp -f $1/scripts/ubuntu/nginx.conf /etc/nginx/sites-available/server.conf
sudo ln -s /etc/nginx/sites-available/server.conf /etc/nginx/sites-enabled

sudo systemctl enable nginx

sudo apt install php-fpm php-mysql

sudo systemctl restart nginx

sudo apt install certbot python3-certbot-nginx
sudo read -e -p "Enter your email for certificate? " -i "name@mail.com" email
sudo certbot certonly --agree-tos -m $email --webroot -w /var/www/server/public -d localhost

sudo cp -f $1/scripts/ubuntu/certbot /etc/cron.d/certbot

sudo certbot renew --dry-run

# pause
# start https://nginx.org/ru/download.html
#
# echo
# echo PHP
# echo recomended thread safe version
# echo download and unpack to 'php' folder
# pause
# start https://windows.php.net/download
#
# echo
# echo Composer
# echo recomended composer.phar
# echo download and unpack to 'composer' folder
# pause
# start https://github.com/composer/composer/releases
#
# echo
# echo RunHiddenConsole
# echo download and unpack to 'console' folder
# pause
# start https://redmine.lighttpd.net/attachments/660/RunHiddenConsole.zip
#
# echo
# echo MkCert
# echo download and unpack to 'ssl' folder
# pause
# start https://github.com/FiloSottile/mkcert/releases
