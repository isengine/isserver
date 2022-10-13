#!/usr/bin/env bash

echo install Certificate

sudo apt install certbot python3-certbot-nginx
read -e -p "Enter your email for certificate? " -i "mail@server.com" email
sudo certbot certonly --agree-tos -m $email --webroot -w /var/www/$2/public -d $2

sudo cp -f $1/scripts/ubuntu/certbot /etc/cron.d/certbot

sudo certbot renew --dry-run
