@echo off
color 0b
title pizza

:pizzaquestion1
echo -------------------------------------
echo [            PIZZA [1.7]            ]
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
pause
cls
echo Hello, what is your name?
set /p name=
echo.
echo Hello, %name%, do you want to load a Checkpoint or start from the beginning?
echo.
cmdMenuSel f870 "New Game" "Load Game" 
if %ERRORLEVEL% == 1 goto pizzainfo
if %ERRORLEVEL% == 2 goto pizzaloadresponce

:pizzaloadresponce
cls
echo Alright, let's Load into a Checkpoint. Please enter your Checkpoint code.
set /p checkpointcode=
if "%checkpointcode%" == "46212" goto tbleave

:loadfail
echo.
echo The Load failed or you entered the wrong code.

:pizzainfo
cls
echo Alright, we're starting from the beginning. Anyways, This is a quiz and a Question and Answer, if you get all the questions right, you get something special. After the quiz, we will move on to the Question and Answer. Alright %name%, press any key to continue. 
pause
goto pizzaquiz1

:pizzas1
cls
echo %name%, huh? That sounds like one of my friends username. Anyway, This is a quiz and a Question and Answer, if you get all the questions right, you get something special. After the quiz, we will move on to the Question and Answer. Alright %name%, press any key to continue. 
pause
set 
goto pizzaquiz1

:pizzaquiz1
cls
set quizanswer1=Incorrect
echo What is a pineapple, %name%?
echo.
cmdMenuSel f870 "The pineapple is a tropical plant with an edible fruit and the most economically significant plant in the family Bromeliaceae. The pineapple is indigenous to South America, where it has been cultivated for many centuries." "A Fruit" 
if %ERRORLEVEL% == 1 goto pizzaquiz2
if %ERRORLEVEL% == 2 set quizanswer1=Correct
goto pizzaquiz2

:pizzaquiz2
cls
set quizanswer2=Incorrect
echo Is Red Sus????????????????????????
echo.
cmdMenuSel f870 "YES, RED IS SUS!!!!!!!!!!!!" "No" 
if %ERRORLEVEL% == 1 set quizanswer1=Correct
if %ERRORLEVEL% == 2 goto pizzaquiz3
goto pizzaquiz3

:pizzaquiz3
cls
set quizanswer3=Incorrect
echo Who is the guy who made this quote: "What are you doing in my swamp?!"
echo.
cmdMenuSel f870 "IDK" "My Ass" "Shrek" "Creepy Man"
if %ERRORLEVEL% == 1 goto pizzaquiz4
if %ERRORLEVEL% == 2 goto pizzaquiz4
if %ERRORLEVEL% == 3 set quizanswer3=Correct
if %ERRORLEVEL% == 4 goto pizzaquiz4
goto pizzaquiz4

:pizzaquiz4
cls
set quizanswer4=Incorrect
echo What kind of file is this?
echo.
cmdMenuSel f870 "batch file" "cmd file" 
if %ERRORLEVEL% == 1 goto pizzaquiz5
if %ERRORLEVEL% == 2 set quizanswer4=Correct
goto pizzaquiz5

:pizzaquiz5
cls
set quizanswer5=Incorrect
echo I know where you live.
echo.
cmdMenuSel f870 "My House" "You do?!" "Cool" 
if %ERRORLEVEL% == 1 set quizanswer5=Correct
if %ERRORLEVEL% == 2 goto pizzaquizanswers
if %ERRORLEVEL% == 3 goto pizzaquizanswers
goto pizzaquizanswers

:pizzaquizanswers
cls
echo Here are the questions you got right!
echo Question 1: %quizanswer1%
echo Question 2: %quizanswer2%
echo Question 3: %quizanswer3%
echo Question 4: %quizanswer4%
echo Question 5: %quizanswer5% 
pause
echo.
echo Alright, %name%, do you mind if I ask you some questions?
cmdMenuSel f870 "Yes" "No" 
if %ERRORLEVEL% == 1 goto pizzaresponceyes
if %ERRORLEVEL% == 2 goto pizzaresponceno

:pizzaresponceyes
cls
echo %name%: Sure, why not?
pause
echo.
echo Great! Let's continue.
pause
echo.
echo Oh yeah, you won't be getting out of here. *%name% gets knocked out by the man.*
pause
goto heywakeup

:pizzaresponceno
cls
echo %name%: Nah, I think I'm good.
pause
echo.
echo Oh, alright. Well, goodnight.
pause
echo.
echo *%name% gets knocked out by the man.*
pause

:heywakeup
cls
echo %name% wakes up in a cave.
pause
echo.
echo %name%: God dang it, I shouldn't have took that quiz, now I'm trapped down here.
pause
echo.
echo ???: Don't worry, I got trapped down here too.
pause
echo.
echo %name%: Who said that?
pause
echo.
echo ???: Hey, don't be shy. If you want to stop him, you will have to beat the monsters.
pause
echo.
echo %name%: How do I do that?
pause
echo.
echo John: It's simple, follow me. Oh I forgot to tell you my name. My name is John. Anyways, follow me.
pause
echo.
echo %name% follows John.
pause
echo.
echo John: See that monster? Go fight it, and I'll tell you what to do.
pause
echo.
echo %name%: Got it.
pause
goto tutorialbattle

:tutorialbattle
cls
set hp1=1
set hp2=1
set mhp1=1
echo %name% started a battle with a Level 0 Goblin!
echo Goblin: }:)[-[
echo.
echo Goblin HP: %mhp1%
echo Your HP: %hp1% %hp2%
echo.
echo John: So, your health bar is marked with 1's, and the farther you go, the more HP you will have, and so will the monsters. Now, select "Fight" so that you can kill the monster.
cmdMenuSel f870 "Fight" "Run" 
if %ERRORLEVEL% == 1 goto tbq1
if %ERRORLEVEL% == 2 goto tbno

:tbno
cls
echo I'm not ready to talk to you about this yet.
pause
goto tutorialbattle

:tbq1
cls
echo What's an apple?
echo John: Here's where you have to answer a question to do damage. Answer the question correctly to do 1HP of damage.
cmdMenuSel f870 "A Fruit" "A Vegetable" 
if %ERRORLEVEL% == 1 set mhp1=0
if %ERRORLEVEL% == 2 goto tbqi
goto tb2

:tbqi
cls
echo.
echo John: Usually you would take damage, but I won't let that happen.
pause
goto tbqi 

:tb2
cls
echo };)[-[
echo Goblin HP: %mhp1%
echo Your HP: %hp1% %hp2%
echo.
echo John: Good job, you killed the monster, but you took some damage, from the monster hitting you before you defeated it, now, select run, and I will bandage you up.
cmdMenuSel f870 "Fight" "Run" 
if %ERRORLEVEL% == 1 goto tbno2
if %ERRORLEVEL% == 2 goto tbleave

:tbno2
echo.
echo John: You already killed the monster, why are you trying to attack it?
pause
goto tb2

:tbleave
cls
echo Checkpoint Code 46212
echo John: Alright, what I need you to do is rest while I work on this wound.
pause
echo.
echo %name% lays down, and falls asleep.
pause
echo.
echo John: Hey, wake up
pause
echo.
echo %name% wakes up.
pause
echo.
echo %name%: What is it?
pause
echo.
echo John: I found a piece of paper that should give us info.
pause
echo.
echo %name%: Alright, hand it over.
pause
echo.
echo John gives the paper to %name% and %name% starts to view the page.
pause
cls
echo  ------------------
echo  :          Goblin:
echo  :  }:)[-[        :
echo  :                :
echo  :                :
echo  :                :
echo  :Goblins are the : 
echo  :easiest mob to  :
echo  :fight           :
echo  :Question Skill: :
echo  :1-2             :
echo  :                :
echo  ------------------
pause
cls
echo %name%: This is interesting, thanks!
pause
echo.
echo John: Your welcome.
pause
cls
echo Thanks for playing the 1.7 demo! Pizza 2.0 will be coming soon. Please come back when 2.0 is released.
pause
exit