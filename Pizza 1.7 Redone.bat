@echo off
title Pizza 1.7
color 07

:start
cls
echo Welcome to Pizza 1.7 Redone! To start, please enter your name.
set /p playername=">"
cls
echo %playername%, huh? Cool.
pause
goto menu

:menu
cls
echo Are you ready to start?
cmdMenuSel f870 "Yes" "No"
if %ERRORLEVEL% == 1 goto startinfo
if %ERRORLEVEL% == 2 goto startconfused

:startconfused
cls
echo Huh??? Uhhhh, ok? Well, here's the settings menu, if you are not ready...
pause
goto settingsmenu

:settingsmenu
cls
echo Settings: Change Settings Here.
cmdMenuSel f870 "Change Color" "Exit"
if %ERRORLEVEL% == 1 goto settingsmenucolor
if %ERRORLEVEL% == 2 goto exitsettingsmenu

:settingsmenucolor
cls
echo Settings: What color would you like?
cmdMenuSel f870 "Dark Mode" "Light Mode" "Dark Red Mode" "Exit"
if %ERRORLEVEL% == 1 color 07
if %ERRORLEVEL% == 2 color 70
if %ERRORLEVEL% == 3 color 04
if %ERRORLEVEL% == 4 goto settingsmenu
goto settingsmenucolor

:exitsettingsmenu
cls
echo Oh? You're back? Great!
pause
goto menu

:startinfo
cls
echo Ok! Great. So, have you heard of a Q and A?
pause
echo.
echo Ehhh, doesn't matter. You ready? Let's start.
pause
goto q1

:q1
cls
echo Who is the best human?
cmdMenuSel f870 "Issac Newton" "No one is perfect" "Your Mom"
if %ERRORLEVEL% == 1 set q1a=Incorrect
if %ERRORLEVEL% == 2 set q1a=Correct
if %ERRORLEVEL% == 3 set q1a=Incorrect
goto q2

:q2
cls
echo If P = 10 and X = 4, then what is 4p - 9x + 50?
set /p input=">"
set /a answer=%input%-10
if "%answer%" == "44" set q2a=Correct
if "%answer%" == "44" goto q3
set q2a=Incorrect
goto q2fail

:q2fail
cls
echo Wow. You suck at math! That says a lot...
pause
goto q2extra

:q2extra
cls
echo Surely you can answer this.
echo.
echo What's 9 + 10?
set /p input=">"
set /a answer=%input%-5
if "%answer%" == "14" goto q2extrayes
cls
echo ...
echo.
echo Ughhhh.
pause
goto q3

:q2extrayes
cls
echo I guess you don't know algebra yet.
pause
goto q3

:q3
cls
echo Last Question.
echo.
echo Who created this game?
cmdMenuSel f870 "Me" "IDK" "TheKamboy"
if %ERRORLEVEL% == 1 set q3a=Incorrect
if %ERRORLEVEL% == 2 set q3a=Incorrect
if %ERRORLEVEL% == 3 set q3a=Correct
goto qend

:qend
cls
echo Good job! Question 1 was %q1a%, Question 2 was %q2a%, and Question 3 was %q3a%.
pause
echo.
echo ...What? You want to go home?
pause
echo.
echo ...
pause
echo.
echo Nope, goodbye.
pause
echo.
echo %playername% got banished to the underworld...and encountered a Goblin, but you can't run away from it.
goto battle1var

:battle1var
set hp=1
set mhp=2
set atk=1
set matk=1
set dmg=%mhp%-%atk%
set dmg2=%hp%-%matk%
goto battle1

:battle1
cls
echo %playername% started a battle with a Goblin!
echo.
echo Your HP: %hp%
echo Goblin's HP: %mhp%
echo.
cmdMenuSel f870 "Fight" "Run"
if %ERRORLEVEL% == 1 goto battleq1
if %ERRORLEVEL% == 2 goto battlerunfail

:battlerunfail
cls
echo You tried to run, but crashed into a invisible wall.
pause
goto battle1

:battleq1
cls
echo What is a Goblin's favorite snack?
cmdMenuSel f870 "Club" "Human" "Crackers"
if %ERRORLEVEL% == 1 set /a hp=%dmg2%
if %ERRORLEVEL% == 2 set /a mhp=%dmg%
if %ERRORLEVEL% == 3 set /a hp=%dmg2%
goto battle12

:battle12
cls
echo %playername% is battling a Goblin!
echo.
echo Your HP: %hp%
echo Goblin's HP: %mhp%
echo.
if "%hp%" == "0" goto battled
cmdMenuSel f870 "Fight" "Run"
if %ERRORLEVEL% == 1 goto battleq2
if %ERRORLEVEL% == 2 goto battlerunfail2

:battleq2
cls
echo The Goblin attacks!
pause
goto battled

:battled
cls
echo You got knocked out by the Goblin! You woke up to being dragged by the Goblin. You were too hurt to kill the Goblin, when all of a sudden...
pause
echo.
echo Bam! The Goblin got taken out.
pause
echo.
echo ???: Come on, let's get outta here.
pause
goto whatjusthappened

:whatjusthappened
cls
echo %playername% follow ???.
pause
echo.
echo ???: It must of hurt to get hit by the Goblin, right? Btw, what's your name?
cmdMenuSel f870 "My name is %playername%" "Not telling" "First, what's yours?"
if %ERRORLEVEL% == 1 goto talk2a1
if %ERRORLEVEL% == 2 goto talk2a2
if %ERRORLEVEL% == 3 goto talk2a3

:talk2a1
cls
echo ???: %playername%, got it.
pause
echo.
echo John: My name is John, nice to meet you.
pause
goto talkq2

:talk2a2
cls
echo ???: ...
pause
echo.
echo ???: I guess I will say my name first then.
pause
echo.
echo John: My name is John, nice to meet you. Now what is your name?
pause
echo.
echo %playername%: %playername%.
pause
echo.
echo John: Cool.
pause
goto talkq2

:talk2a3
cls
echo ???: Alright.
pause
echo.
echo John: My name is John, nice to meet you. Now what is your name?
pause
echo.
echo %playername%: %playername%.
pause
echo.
echo John: Cool.
pause
goto talkq2

:talkq2
cls
echo John: I guess you got banished here for trying to take that quiz. The person who runs it actually kidnaps people, not give them money.
pause
echo.
echo John: What made you take the quiz?
cmdMenuSel f870 "Money" "Fun"
if %ERRORLEVEL% == 1 goto talkq2a1
if %ERRORLEVEL% == 2 goto talkq2a2

:talk2a1
cls
echo John: Must be poor, or greedy? I don't care really.
pause
goto enddialogue

:enddialogue
cls
echo John: Well, we made it to my base. Go ahead, and get some sleep.
pause
goto end

:end
cls
echo Thanks for playing the Remake! Please let me know if you want me to continue on with this.
pause
exit