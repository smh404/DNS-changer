@echo off

:: ------ Set Your Interface Name Here ------
:: ------ نام اینترفیس خود را اینجا وارد کنید ------
set Interfacename=Wi-Fi


::  ********** SCRIPT TO GET ADMIN RIGHTS **********
::--------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::--------------------------------------   


echo Select an option:
echo 0. DHCP
echo 1. Google
echo 2. Cloudflare
echo 3. SHECAN
echo 4. RADAR
echo 5. ELECTRO

set in=%Interfacename%
set /p choice=Enter your choice (0-5):

if "%choice%"=="5" netsh interface ip set dns %in% dhcp & netsh interface ip add dns name=%in% 78.157.42.100 index=1 & netsh interface ip add dns name=%in% 78.157.42.101 index=2
if "%choice%"=="4" netsh interface ip set dns %in% dhcp & netsh interface ip add dns name=%in% 10.202.10.10 index=1 & netsh interface ip add dns name=%in% 10.202.10.11 index=2
if "%choice%"=="3" netsh interface ip set dns %in% dhcp & netsh interface ip add dns name=%in% 178.22.122.100 index=1 & netsh interface ip add dns name=%in% 185.51.200.2 index=2
if "%choice%"=="2" netsh interface ip set dns %in% dhcp & netsh interface ip add dns name=%in% 1.1.1.1 index=1 & netsh interface ip add dns name=%in% 1.0.0.1 index=2
if "%choice%"=="1" netsh interface ip set dns %in% dhcp & netsh interface ip add dns name=%in% 8.8.8.8 index=1 & netsh interface ip add dns name=%in% 4.2.2.4 index=2
if "%choice%"=="0" netsh interface ip set dns %in% dhcp

pause