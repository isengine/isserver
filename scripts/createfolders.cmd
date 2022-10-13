rem ## Create folders

echo Create folder for PHP Composer...
if not exist "%1\composer" (
    md "%1\composer"
)

echo Create folder for console tool...
if not exist "%1\console" (
    md "%1\console"
)

echo Create Nginx folder...
if not exist "%1\nginx" (
    md "%1\nginx"
)
if not exist "%1\nginx\conf" (
    md "%1\nginx\conf"
)

echo Create PHP folder...
if not exist "%1\php" (
    md "%1\php"
)

echo Create folder for certificates and tools...
if not exist "%1\server" (
    md "%1\server"
)
if not exist "%1\server\public" (
    md "%1\server\public"
)
if not exist "%1\server\ssl" (
    md "%1\server\ssl"
)

rem ## Copy files

copy %1\scripts\files\nginx.conf %1\nginx\conf\nginx.conf
copy %1\scripts\files\fastcgi_params %1\nginx\conf\fastcgi_params
copy %1\scripts\files\php.ini %1\php\php.ini
copy %1\scripts\files\cert.cmd %1\server\ssl\cert.cmd
copy %1\scripts\files\index.php %1\server\public\index.php

exit /b