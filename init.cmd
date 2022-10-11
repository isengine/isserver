@echo off
setlocal EnableDelayedExpansion
rem chcp 1251 >nul
chcp 65001 >nul
set path=%cd%

rem ## Title;

echo.
echo Install isServer v1.0.0

rem ## Select folder;

echo.
echo Server will be installed to the current folder:
echo - %path%

rem ## Continue or break install;

echo.
set "continue=Yes"
set /p "continue=Do you want to continue install/reinstall (%continue%)? "
rem BREAK;

    set "variants=0 "0" "N" "NO" "No" "no" "n""
    for %%a in (%variants%) do (
        if %continue%==%%~a (
            echo - No
            exit /b
        )
    )

rem END OF BREAK;
echo - Yes

rem ## Create structure;

call %path%\scripts\createfolders %path%

rem ## Open links;

echo.
set "continue=Yes"
set "openlinks=1"
set /p "continue=Do you want open links to download and install required applications (%continue%)? "
rem SET VARIABLES YES OR NO;

    set "variants=0 "0" "N" "NO" "No" "no" "n""
    for %%a in (%variants%) do (
        if %continue%==%%~a (
            set openlinks=0
        )
    )

    set "print=Yes"
    if %openlinks%==0 (
        set "print=No"
    )

rem END OF SET VARIABLES YES OR NO;
echo - %print%

if %openlinks%==1 (
    call %path%\scripts\openlinks
)

rem ## Set variables;

echo.
set "domain=mydomain.com"
set /p "domain=Set domain (%domain%): "
echo - %domain%

echo.
set "ip=127.0.0.0"
set /p "ip=Set local ip (%ip%): "
echo - %ip%

echo.
set "versions="7.4.32" "8.0.24" "8.1.11""
rem SET VARIABLES IN ARRAY;

    set n=0
    for %%a in (%versions%) do (
        if !n!==0 (
            echo Select PHP version or enter your own ^(%%~a^)^:
            set "php=%%~a"
        )
        set /A n+=1
        echo !n!. %%~a
    )

    set phpc=0
    set /p "phpc=Your choise: "

    if not %phpc%==0 (
        set php=%phpc%
        set n=0
        for %%a in (%versions%) do (
            set /A n+=1
            if "!n!"=="%phpc%" (
                set php=%%~a
            )
        )
    )

rem END OF SET VARIABLES IN ARRAY;
echo - PHP v%php%



echo.
set "is=Yes"
set /p "is=Is install composer (%is%)? "
rem SET VARIABLES YES OR NO;

    set "variants=0 "0" "N" "NO" "No" "no" "n""
    for %%a in (%variants%) do (
        if %is%==%%~a (
            set is=0
        )
    )

    set "print=Yes"
    if %is%==0 (
        set "print=No"
    )

rem END OF SET VARIABLES YES OR NO;
echo - %print%

rem echo.
rem echo 1 - FIRST.
rem echo 2 - SECOND.
rem echo 3 - THIRD.
rem echo 4 - FOURTH.
rem echo other - EXIT.
rem set /p sym=SELECT:
rem 
rem if "%sym%"=="1" (call C:\MB2016\Files\Debits)
rem if "%sym%"=="2" (call C:\MB2016\Files\Debits\D.bat)
rem if "%sym%"=="3" (call C:\MB2016\Files\Kredits)
rem if "%sym%"=="4" (call C:\MB2016\Files\Debits\K.bat)

echo.Preparing Nginx config...
call :configNginx
echo. - File created

echo.Preparing FastCGI config...
call :configFastcgi
echo. - File created

endlocal >nul
exit /b

:savefile

if not exist "%folder%" md "%folder%"
set "file=%folder%%filename%"
rem:> "%file%"

exit /b

:savetext

set "file=%folder%%filename%"
echo %1>> "%file%"

exit /b

:configNginx

set "folder=%path%\test\"
set "filename=nginx.ini"

rem call :savefile
rem call :savetext "<sysid>other no %ip%</sysid>"
rem call %path%\scripts\nginx %folder%%filename%

exit /b

:configFastcgi

set "folder=%path%\test\"
set "filename=fastcgi.ini"

rem call :savefile
rem call :savetext "<sysid>other no %ip%</sysid>"
rem call %path%\scripts\fastcgi %folder%%filename%

exit /b
