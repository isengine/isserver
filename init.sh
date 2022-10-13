#!/usr/bin/env bash

path=$PWD

## Title;

echo
echo Install isServer v1.0.0

## Select folder;

echo
echo Server will be installed to the current folder:
echo - $path

## Set variables;

echo
read -e -p "Set domain: " -i "server.com" domain

echo
read -e -p "Set local ip: " -i "127.0.0.0" ip

#set "versions="7.4.32" "8.0.24" "8.1.11""
# SET VARIABLES IN ARRAY;
# END OF SET VARIABLES IN ARRAY;
#echo - PHP v%php%

## Create structure;
#read -e -p "Do you want to continue install/reinstall (y/n)? " -i "y" confirm && [[ $confirm == [yY] ]] || exit 1

## Open links;

echo
read -e -p "Do you want download and install Nginx (y/n)? " -i "y" confirm
if [[ $confirm == [yY] ]]
then
    source ./scripts/nginx.sh
fi

echo
read -e -p "Do you want download and install PHP-fpm (y/n)? " -i "y" confirm
if [[ $confirm == [yY] ]]
then
    source ./scripts/phpfpm.sh
fi

echo
read -e -p "Do you want download and install MySQL (y/n)? " -i "y" confirm
if [[ $confirm == [yY] ]]
then
    source ./scripts/mysql.sh
fi

echo
read -e -p "Do you want download and setup Server (y/n)? " -i "y" confirm
if [[ $confirm == [yY] ]]
then
    source ./scripts/server.sh $path $domain $ip
fi

echo
read -e -p "Do you want download and install Certificate (y/n)? " -i "y" confirm
if [[ $confirm == [yY] ]]
then
    source ./scripts/certificate.sh $path $domain $ip
fi

echo
echo FINAL
echo
