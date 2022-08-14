@echo off
echo Starting virtual server...
set SRVPATH=%cd%
pushd %SRVPATH%\nginx
start nginx.exe
popd
console\RunHiddenConsole.exe "%SRVPATH%\php\php-cgi.exe" -b 127.0.0.1:9000 -c "%SRVPATH%\php\php.ini"