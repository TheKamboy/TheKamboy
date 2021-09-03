@echo off
color 0b
title Pizza: Custom Battle Only

:pizzaquestion1
cls
set fard=Yes
echo -------------------------------------
echo [            PIZZA [2.0]            ]
echo [                                   ]
echo [                                   ]
echo [     Press any button to play...   ]
echo [                                   ]
echo [                                   ]
echo -------------------------------------
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
pause >nul
goto firstrun

:firstrun
cls
echo ---------------------------
echo -Hello, what is your name?-
echo ---------------------------
set /p name=Type in your name, then hit enter: 
goto menustart

:menustart
cls
echo Hello, %name%, do you want to load a Checkpoint or start from the beginning?
echo.
cmdMenuSel f870 "New Game" "Load Game" "Extras"
if %ERRORLEVEL% == 1 goto pizzasavestart
if %ERRORLEVEL% == 2 goto pizzaloadresponce
if %ERRORLEVEL% == 3 goto menuextras

:pizzasavestart
echo.
echo This Version of Pizza does not support this, to start a new game, please download Pizza 1.7.
pause
goto menustart

:pizzaloadresponce
echo.
echo This Version of Pizza does not support this, to load a save file, please download Pizza 1.7.
pause
goto menustart

:menuextras
cls
echo Welcome to the extras menu, %name%. What do you want to do?
echo.
cmdMenuSel f870 "Create Your Own Battle" "Exit"
if %ERRORLEVEL% == 1 goto createbattlename
if %ERRORLEVEL% == 2 goto menustart

:createbattlename
cls
echo First off, let's name your enemy!
set /p enemyboiname=Name your enemy here: 
goto createemenysprite

:createemenysprite
cls
echo Next, lets make the emeny sprite.
set /p enemyboisprite=
goto createenemylevel

:createenemylevel
cls
echo What level will the enemy be at? Please numbers only and no 0's at the start so it will fuction correctly.
set /p enemylevel=
goto createenemystrengh

:createenemystrengh
cls
echo What will the enemys strength be? Please numbers only and no 0's at the start so it will fuction correctly.
set /p matk=Strength: 
goto createenemyhp

:createenemyhp
cls
echo How much hp will the Enemy have? Please numbers only and no 0's at the start so it will fuction correctly.
set /p mhp1=
goto createplayerhp

:createplayerhp
cls
echo How much hp will you have? Please numbers only and no 0's at the start so it will fuction correctly.
set /p hp1=Health: 
goto createplayeratk

:createplayeratk
cls
echo How much damage can you do? Please numbers only and no 0's at the start so it will fuction correctly.
set /p patk=Damage: 
goto createquestions

:createquestions
cls
echo First Question?
set /p q1=
echo.
echo Second Question?
set /p q2=
echo.
echo Third Question?
set /p q3= 
goto createquestionanswers

:createquestionanswers
cls
echo What will the 3 answers be for Question 1?
set /p q1a1=
set /p q1a2=
set /p q1a3=
echo.
echo Which one will be p  the correct answer?
cmdMenuSel f870 "1" "2" "3"
if %ERRORLEVEL% == 1 set q1c=1
if %ERRORLEVEL% == 2 set q1c=2
if %ERRORLEVEL% == 3 set q1c=3
cls
echo What will the answers be for Question 2?
set /p q2a1=
set /p q2a2=
set /p q2a3=
echo.
echo Which one will be the correct answer?
cmdMenuSel f870 "1" "2" "3"
if %ERRORLEVEL% == 1 set q2c=1
if %ERRORLEVEL% == 2 set q2c=2
if %ERRORLEVEL% == 3 set q2c=3
cls
echo What will the answers be for Question 3?
set /p q3a1=
set /p q3a2=
set /p q3a3=
echo.
echo Which one will be the correct answer?
cmdMenuSel f870 "1" "2" "3"
if %ERRORLEVEL% == 1 set q3c=1
if %ERRORLEVEL% == 2 set q3c=2
if %ERRORLEVEL% == 3 set q3c=3
goto viewbattle


:viewbattle
cls
echo Here's what the main battle menu will look like:
echo.
echo %name% started a battle with a Level %enemylevel% %enemyboiname%!
echo %enemyboiname%: %enemyboisprite%
echo.
echo %enemyboiname% HP: %mhp1%
echo Your HP: %hp1%
echo.
if "%hp1%" == "0" goto b1death  
if "%mhp1%" == "0" goto b1yes
cmdMenuSel f870 "View Next" "Start Battle" 
if %ERRORLEVEL% == 1 goto viewbattle2
if %ERRORLEVEL% == 2 goto extrabattle

:viewbattle2
cls
echo %q1%
echo %q1a1%
echo %q1a2%
echo %q1a3%
echo Answer that is correct: Answer %q1c%
echo This feature isn't finished yet. Please save all of the work that you worked on.
cmdMenuSel f870 "Go Back" "View Next" "Start Battle"
if %ERRORLEVEL% == 1 goto viewbattle
if %ERRORLEVEL% == 2 goto viewbattle3
if %ERRORLEVEL% == 3 goto extrabattle

:viewbattle3
cls
echo %q2%
echo %q2a1%
echo %q2a2%
echo %q2a3%
echo Answer that is correct: Answer %q2c%
cmdMenuSel f870 "Go Back" "View Next" "Start Battle"
if %ERRORLEVEL% == 1 goto viewbattle2
if %ERRORLEVEL% == 2 goto viewbattle4
if %ERRORLEVEL% == 3 goto extrabattlevb

:viewbattle4
cls
echo %q3%
echo %q3a1%
echo %q3a2%
echo %q3a3%
echo Answer that is correct: Answer %q3c%
cmdMenuSel f870 "Go Back" "Start Battle"
if %ERRORLEVEL% == 1 goto viewbattle3
if %ERRORLEVEL% == 2 goto extrabattle

:extrabattlevb
set dmg=%hp1%-%matk%
set dmg2=%mhp1%-%patk%
goto extrabattle

:extrabattle
cls
echo %name% started a battle with a Level %enemylevel% %enemyboiname%!
echo %enemyboiname%: %enemyboisprite%
echo.
echo %enemyboiname% HP: %mhp1%
echo Your HP: %hp1%
echo.
if "%hp1%" == "0" goto ebdeath  
if "%mhp1%" == "0" goto ebyes
cmdMenuSel f870 "Fight" "Run" 
if %ERRORLEVEL% == 1 goto ebq1
if %ERRORLEVEL% == 2 goto ebrun

:ebrun
echo.
echo Can't run in a Custom Battle.
pause
goto extrabattle

:ebq1
cls
echo %q1% 
cmdMenuSel "%q1a1%" "%q1a2%" "%q1a3%"
if %ERRORLEVEL% == 1 goto ebq11
if %ERRORLEVEL% == 2 goto ebq12
if %ERRORLEVEL% == 3 goto ebq13

:ebq11
if "%q1c%" == "1" goto ebqd1
set /a hp1=%dmg%
goto eb2

:ebq12
if "%q1c%" == "2" goto ebqd1
set /a hp1=%dmg%
goto eb2

:ebq13
if "%q1c%" == "3" goto ebqd1
set /a hp1=%dmg%
goto eb2

:ebqd1
set /a mhp1=%dmg2%
goto eb2

:eb2
cls
echo %name% started a battle with a Level %enemylevel% %enemyboiname%!
echo %enemyboiname%: %enemyboisprite%
echo.
echo %enemyboiname% HP: %mhp1%
echo Your HP: %hp1%
echo.
if "%hp1%" == "0" goto ebdeath  
if "%mhp1%" == "0" goto ebyes
cmdMenuSel f870 "Fight" "Run" 
if %ERRORLEVEL% == 1 goto ebq2
if %ERRORLEVEL% == 2 goto ebrun2

:ebrun2
echo.
echo Can't run in a Custom Battle.
pause
goto eb2

:ebq2
cls
echo %q2%
cmdMenuSel "%q2a1%" "%q2a2%" "%q2a3%"
if %ERRORLEVEL% == 1 goto ebq21
if %ERRORLEVEL% == 2 goto ebq22
if %ERRORLEVEL% == 3 goto ebq23

:ebq21
if "%q2c%" == "1" goto ebqd2
set /a hp1=%dmg%
goto eb3

:ebq22
if "%q2c%" == "2" goto ebqd2
set /a hp1=%dmg%
goto eb3

:ebq23
if "%q2c%" == "3" goto ebqd2
set /a hp1=%dmg%
goto eb3

:ebqd2
set /a mhp1=%dmg2%
goto eb3

:eb3
cls
echo %name% started a battle with a Level %enemylevel% %enemyboiname%!
echo %enemyboiname%: %enemyboisprite%
echo.
echo %enemyboiname% HP: %mhp1%
echo Your HP: %hp1%
echo.
if "%hp1%" == "0" goto ebdeath  
if "%mhp1%" == "0" goto ebyes
cmdMenuSel f870 "Fight" "Run" 
if %ERRORLEVEL% == 1 goto ebq3
if %ERRORLEVEL% == 2 goto ebrun3

:ebq3
cls
echo %q3%
cmdMenuSel "%q3a1%" "%q3a2%" "%q3a3%"
if %ERRORLEVEL% == 1 goto ebq31
if %ERRORLEVEL% == 2 goto ebq32
if %ERRORLEVEL% == 3 goto ebq33

:ebq31
if "%q3c%" == "1" goto ebqd3
set /a hp1=%dmg%
goto extrabattle

:ebq32
if "%q3c%" == "2" goto ebqd3
set /a hp1=%dmg%
goto extrabattle

:ebq33
if "%q3c%" == "3" goto ebqd3
set /a hp1=%dmg%
goto extrabattle

:ebqd3
set /a mhp1=%dmg2%
goto extrabattle

:ebdeath
cls
echo %name% died! Want to start again?
cmdMenuSel "Yes" "No"
if %ERRORLEVEL% == 1 goto extrabattlevb
if %ERRORLEVEL% == 2 goto menuextras

:ebyes
cls
echo %name% defeated %enemyboiname%! Want to go again?
cmdMenuSel "Yes" "No"
if %ERRORLEVEL% == 1 goto extrabattlevb
if %ERRORLEVEL% == 2 goto menuextras