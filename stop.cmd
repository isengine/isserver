@echo off
echo Shutting down servers...
set SRVPATH=%cd%
pushd %SRVPATH%\nginx
nginx.exe -s quit
popd
taskkill /IM nginx.exe /F
taskkill /IM php-cgi.exe /F