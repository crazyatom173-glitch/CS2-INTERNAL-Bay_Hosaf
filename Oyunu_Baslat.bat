@echo off
title BayHosaf - CS2 Otomatik Baslatici

:: Otomatik Yonetici Izni
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    powershell -Command "Start-Process cmd -ArgumentList '/c ""%~f0""' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

echo ======================================================
echo           BAYHOSAF PRO - OTOMATIK BASLATICI          
echo ======================================================
echo.

set "SYS_DIR=Gerekli_Sistem_Bilesenleri"

:: 1. CS2 Ofset Kontrolü
if exist "%SYS_DIR%\BayHosaf_Updater.exe" (
    echo [1/3] CS2 ofsetleri otomatik kontrol ediliyor...
    start "" /d "%SYS_DIR%" /b "%SYS_DIR%\BayHosaf_Updater.exe"
    timeout /t 1 /nobreak >nul
) else if exist "BayHosaf_Updater.exe" (
    echo [1/3] CS2 ofsetleri otomatik kontrol ediliyor...
    start "" /b BayHosaf_Updater.exe
    timeout /t 1 /nobreak >nul
)

:: 2. Web Radar
if exist "%SYS_DIR%\BayHosaf_Web_Radar.exe" (
    echo [2/3] Web Radar arka planda baslatiliyor...
    start "BayHosaf Web Radar" /min /d "%SYS_DIR%" "%SYS_DIR%\BayHosaf_Web_Radar.exe"
) else if exist "BayHosaf_Web_Radar.exe" (
    echo [2/3] Web Radar arka planda baslatiliyor...
    start "BayHosaf Web Radar" /min BayHosaf_Web_Radar.exe
)

:: 3. Enjektör
if exist "BayHosaf_Injector.exe" (
    echo [3/3] Enjektor yonetici yetkisiyle aciliyor...
    start "" BayHosaf_Injector.exe
) else if exist "%SYS_DIR%\BayHosaf_Injector.exe" (
    echo [3/3] Enjektor yonetici yetkisiyle aciliyor...
    start "" "%SYS_DIR%\BayHosaf_Injector.exe"
)

echo.
echo Sistem hazir! CS2 acilinca enjektor uzerinden DLL'i yukleyebilirsiniz.
timeout /t 2 /nobreak >nul
exit
