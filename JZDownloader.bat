@echo off
title Zaxx7 App Installer
color 0a
cls

:: شاشة البداية المخصصة
echo.
echo          #############################################
echo          #               ZAXX7 INSTALLER             #
echo          #         Powered by Batch Wizardry         #
echo          #############################################
echo.
echo             Type 'set install' to begin installation
echo.

:: انتظار الأمر الصحيح
:input
set /p "cmd=          cmd>> ||Enter Command: "
if /i not "%cmd%"=="set install" (
    echo Invalid command! Please type 'set install'
    goto input
)

:: القائمة الرئيسية
:menu
cls
echo.
echo  === APPLICATION SELECTION ===
echo.
echo  [WEB BROWSERS]
echo  1. Google Chrome
echo  2. Firefox
echo  3. Brave
echo.
echo  [DESIGN TOOLS]
echo  4. Bandicam
echo  5. OBS Studio
echo.
echo  [GAME PLATFORMS]
echo  6. Steam
echo  7. Epic Games
echo  8. Battle.net
echo  9. Rockstar Games
echo  10. Ubisoft Connect
echo.
echo  [APPLICATIONS]
echo  11. Discord
echo  12. YouTube Music
echo  13. Cheat Engine
echo  14. WinRAR
echo  15. Instagram
echo.
echo  Type numbers separated by commas (e.g., 1,3,6)
echo  Then type 'install' to begin
echo.

:: اختيار التطبيقات
:select
set /p "apps=Select apps: "
if /i "%apps%"=="install" goto install
if "%apps%"=="" (
    echo Please select at least one application
    goto select
)

:: عملية التثبيت
:install
cls
echo.
echo  === INSTALLATION STARTED ===
echo.

:: تثبيت المتصفحات
if "%apps%"=="*" (
    set "web=1,2,3"
    set "design=4,5"
    set "games=6,7,8,9,10"
    set "tools=11,12,13,14,15"
) else (
    set "web=%apps%"
    set "design=%apps%"
    set "games=%apps%"
    set "tools=%apps%"
)

:: دالة التثبيت
call :install_apps "%web%" "%design%" "%games%" "%tools%"

echo.
echo  === INSTALLATION COMPLETE ===
echo.
pause
exit /b

:: دالة مساعدة للتثبيت
:install_apps
for %%i in (%~1) do (
    if "%%i"=="1" winget install Google.Chrome -h --accept-source-agreements --accept-package-agreements
    if "%%i"=="2" winget install Mozilla.Firefox -h --accept-source-agreements --accept-package-agreements
    if "%%i"=="3" winget install Brave.Brave -h --accept-source-agreements --accept-package-agreements
    if "%%i"=="4" winget install Bandicam.Bandicam -h --accept-source-agreements --accept-package-agreements
    if "%%i"=="5" winget install OBSProject.OBSStudio -h --accept-source-agreements --accept-package-agreements
    if "%%i"=="6" winget install Valve.Steam -h --accept-source-agreements --accept-package-agreements
    if "%%i"=="7" winget install EpicGames.EpicGamesLauncher -h --accept-source-agreements --accept-package-agreements
    if "%%i"=="8" winget install Blizzard.BattleNet -h --accept-source-agreements --accept-package-agreements
    if "%%i"=="9" winget install RockstarGames.RockstarGamesLauncher -h --accept-source-agreements --accept-package-agreements
    if "%%i"=="10" winget install Ubisoft.Connect -h --accept-source-agreements --accept-package-agreements
    if "%%i"=="11" winget install Discord.Discord -h --accept-source-agreements --accept-package-agreements
    if "%%i"=="12" winget install Google.YouTubeMusic -h --accept-source-agreements --accept-package-agreements
    if "%%i"=="13" winget install CheatEngine.CheatEngine -h --accept-source-agreements --accept-package-agreements
    if "%%i"=="14" winget install RARLab.WinRAR -h --accept-source-agreements --accept-package-agreements
    if "%%i"=="15" winget install Instagram.Instagram -h --accept-source-agreements --accept-package-agreements
)
goto :eof