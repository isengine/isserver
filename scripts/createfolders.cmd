rem ## Create folders

echo Create folder for PHP Composer...
if not exist "%1\composer" (
    md "%1\composer"
    echo - ok
) else (
    echo - exist
)

echo Create folder for console tool...
if not exist "%1\console" (
    md "%1\console"
    echo - ok
) else (
    echo - exist
)

echo Create Nginx folder...
if not exist "%1\nginx\conf" (
    md "%1\nginx\conf"
    echo - ok
)
if not exist "%1\nginx" (
    md "%1\nginx"
) else (
    echo - exist
)

echo Create PHP folder...
if not exist "%1\php" (
    md "%1\php"
    echo - ok
) else (
    echo - exist
)

echo Create folder for certificates and tools...
if not exist "%1\ssl" (
    md "%1\ssl"
    echo - ok
) else (
    echo - exist
)

rem ## Copy files

copy %1\scripts\files\nginx.conf %1\nginx\conf\nginx.conf
copy %1\scripts\files\fastcgi_params %1\nginx\conf\fastcgi_params
copy %1\scripts\files\php.ini %1\php\php.ini
copy %1\scripts\files\cert.cmd %1\ssl\cert.cmd

exit /b