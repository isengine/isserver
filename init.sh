#!/usr/bin/env bash

path=$PWD

## Title;

echo
echo Install isServer v1.0.0

## Select folder;

echo
echo Server will be installed to the current folder:
echo - $path

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
    source ./scripts/server.sh $path
fi

echo
read -e -p "Do you want download and install Certificate (y/n)? " -i "y" confirm
if [[ $confirm == [yY] ]]
then
    source ./scripts/certificate.sh $path
fi

## Set variables;

echo
#set "domain=mydomain.com"
#set /p "domain=Set domain (%domain%): "
#echo - %domain%

echo
#set "ip=127.0.0.0"
#set /p "ip=Set local ip (%ip%): "
#echo - %ip%

echo
#set "versions="7.4.32" "8.0.24" "8.1.11""
# SET VARIABLES IN ARRAY;

#    set n=0
#    for %%a in (%versions%) do (
#        if !n!==0 (
#            echo Select PHP version or enter your own ^(%%~a^)^:
#            set "php=%%~a"
#        )
#        set /A n+=1
#        echo !n!. %%~a
#    )
#
#    set phpc=0
#    set /p "phpc=Your choise: "
#
#    if not %phpc%==0 (
#        set php=%phpc%
#        set n=0
#        for %%a in (%versions%) do (
#            set /A n+=1
#            if "!n!"=="%phpc%" (
#                set php=%%~a
#            )
#        )
#    )

# END OF SET VARIABLES IN ARRAY;
#echo - PHP v%php%

#exit /b

#:savefile
#
#if not exist "%folder%" md "%folder%"
#set "file=%folder%%filename%"
#rem:> "%file%"
#
#exit /b
#
#:savetext
#
#set "file=%folder%%filename%"
#echo %1>> "%file%"
#
#exit /b
#
#:configNginx
#
#set "folder=%path%\test\"
#set "filename=nginx.ini"
#
#rem call :savefile
#rem call :savetext "<sysid>other no %ip%</sysid>"
#rem call %path%\scripts\nginx %folder%%filename%
#
#exit /b
#
#:configFastcgi
#
#set "folder=%path%\test\"
#set "filename=fastcgi.ini"
#
#rem call :savefile
#rem call :savetext "<sysid>other no %ip%</sysid>"
#rem call %path%\scripts\fastcgi %folder%%filename%
#
#exit /b

echo === FINAL ===