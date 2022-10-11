@echo off
echo SSL Certificate generate...
echo by 'mkcert'
echo from 'https://github.com/FiloSottile/mkcert/releases'

mkcert.exe -install
mkcert.exe localhost 127.0.0.1
mkcert.exe -CAROOT

echo Rename certificates to 'localhost.crt' and 'localhost.key'
echo Also rename from root certificates to 'rootCA.crt' and 'rootCA.key'
echo And install it to system as root certificates

pause