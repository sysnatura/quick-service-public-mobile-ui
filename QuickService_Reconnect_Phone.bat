@echo off
setlocal

set "ADB=C:\Users\USER\AppData\Local\Android\Sdk\platform-tools\adb.exe"
set "DEVICE=R9ZR20MRCHA"

title QuickService Phone Reconnect

echo ==========================================
echo   QuickService - Phone Reconnect
echo ==========================================
echo.

if not exist "%ADB%" (
    echo ERROR: ADB was not found here:
    echo %ADB%
    echo.
    echo Please check that the Android SDK is installed at this location.
    goto :finish
)

echo Starting ADB...
"%ADB%" start-server
echo.

echo Connected devices:
"%ADB%" devices
echo.

echo Checking your Samsung phone (%DEVICE%)...
"%ADB%" -s "%DEVICE%" get-state >nul 2>&1
if errorlevel 1 (
    echo ERROR: Your phone is not ready or is not authorized.
    echo.
    echo Check that:
    echo  1. The USB cable is connected.
    echo  2. The phone is unlocked.
    echo  3. USB debugging is enabled and the computer is authorized.
    echo.
    echo No reverse mapping was changed.
    goto :finish
)

echo Restoring QuickService API port mapping...
"%ADB%" -s "%DEVICE%" reverse tcp:36365 tcp:36365
if errorlevel 1 (
    echo ERROR: Could not restore the port mapping.
    goto :finish
)

echo.
echo Current reverse mappings:
"%ADB%" -s "%DEVICE%" reverse --list

echo.
echo REMINDER:
echo The API must be running on your computer at:
echo http://localhost:36365/
echo This file does not start the API or rebuild the app.

:finish
echo.
pause
endlocal
