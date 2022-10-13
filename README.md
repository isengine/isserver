# isServer

Сервер на базе Nginx и PHP.

На данный момент настроен для работы под ОС Windows.

## Быстрый старт

Для установки и запуска сервера скопируйте файлы в папку

    C:\isServer

Сюда же нужно скачать и установить все необходимые компоненты.

Запустите командную строку или PowerShell и введите команду

    init

Следуйте этапам установки.

Для запуска сервера используйте команду

    run

## Для Linux Ubuntu

Распакуйте файлы в папку, например:

    /home/user/isserver

Перейдите в эту папку и в командной строке введите:

    chmod +x ./*.sh

Это сделает скрипты исполняемыми.

А затем запустите скрипт установки:

    ./init.sh

## Необходимые для работы компоненты

**Nginx**
Скачать и распаковать в папку 'nginx'.
[https://nginx.org/ru/download.html](https://nginx.org/ru/download.html)

**PHP**
Скачать и распаковать в папку 'php'.
Рекомендуется использовать версию 'thread safe'.
[https://windows.php.net/download](https://windows.php.net/download)

**Composer**
Скачать и распаковать в папку 'composer'.
Рекомендуется использовать версию 'composer.phar'.
[https://github.com/composer/composer/releases](https://github.com/composer/composer/releases)

**RunHiddenConsole**
Скачать и распаковать в папку 'console'.
[https://redmine.lighttpd.net/attachments/660/RunHiddenConsole.zip](https://redmine.lighttpd.net/attachments/660/RunHiddenConsole.zip)

**MkCert**
Скачать и распаковать в папку 'ssl'.
[https://github.com/FiloSottile/mkcert/releases](https://github.com/FiloSottile/mkcert/releases)

## Управление сервером

- init - установка или обновление настроек сервера в режиме командной строки;
- run - запуск сервера;
- restart - перезапуск сервера;
- stop - остановка сервера.

## Дорожная карта

- пользователь сможет изменить папку установки;
- работа под Linux Ubuntu, Debian, FreeBSD, MacOS;
- поддержка менеджеров пакетов под Windows: winget, chocolatey, scoop;
- поддержка менеджеров пакетов под MacOS: homebrew;
- возможность создания нескольких серверов с разными папками, ip-адресами и портами;
- подключение баз данных;
- поддержка CRON;
- работа по SSH;
- панель управления сервером;
- поддержка сертификатов Let’s Encrypt с регулярным обновлением через CRON;
- работа в связке Nginx + Node.js.
