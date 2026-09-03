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

if exist "BayHosaf_Updater.exe" (
    echo [1/3] CS2 ofsetleri otomatik kontrol ediliyor...
    start "" /b BayHosaf_Updater.exe
    timeout /t 1 /nobreak >nul
) else if exist "Ofset_Guncellemesi\BayHosaf_Updater.exe" (
    echo [1/3] CS2 ofsetleri otomatik kontrol ediliyor...
    start "" /b "Ofset_Guncellemesi\BayHosaf_Updater.exe"
    timeout /t 1 /nobreak >nul
)

if exist "BayHosaf_Web_Radar.exe" (
    echo [2/3] Web Radar arka planda baslatiliyor...
    start "BayHosaf Web Radar" /min BayHosaf_Web_Radar.exe
)

if exist "BayHosaf_Injector.exe" (
    echo [3/3] Enjektor yonetici yetkisiyle aciliyor...
    start "" BayHosaf_Injector.exe
)

echo.
echo Sistem hazir! CS2 acilinca enjektor uzerinden DLL'i yukleyebilirsiniz.
timeout /t 2 /nobreak >nul
exit
