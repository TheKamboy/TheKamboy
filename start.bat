@echo off
title Path Game
color 07

:mainmenu
cls
echo CHOOSE YOUR PATH
if EXIST "saveforpt2.dlb" echo Part 1 Completed :]
echo.
echo A game by TheKamboy.
echo.
echo Options:
echo.
echo 1) Start
echo 2) Info
echo 3) Exit
echo.
set /p input=">"
if "%input%" == "1" goto startpath
if "%input%" == "2" goto maininfo
if "%input%" == "3" exit
goto mainmenu

:maininfo
cls
echo CHOOSE YOUR PATH is well, a path game. You can grab items and go on different paths.
pause
goto mainmenu

:startpath
cls
echo You woke up in a weird building, that looked like it was built in the 1800's. You check if you have anything on you, and you find a phone. But, it's dead. You start looking around to find a way out.
pause
goto setitems

:setitems
set newspaper=0
set phone=1
set phonebat=0
set lockpick=0
set charger=0
set newspaperontable=1
set 2rkey=0
set checkdrawer2l=1
set matches=0
set woodwall=Hit Wall
set woodwalltext=0
set doorunlock=0

:mainstart
set area=ms
cls
echo You are in the main room. It looks like there are some other rooms.
echo.
echo 1) Move to Left Room
echo 2) Move to Right Room
echo 3) Move Forward
echo 4) Check Inventory
echo.
set /p input=">"
if "%input%" == "1" goto mainleft
if "%input%" == "2" goto mainright
if "%input%" == "3" goto 2-forward
if "%input%" == "4" goto inventory
goto mainstart

:inventory
cls

:inventory2
echo To interact with items, type its name. Type "back" to exit Inventory.
echo.
echo Items:
echo.
if "%newspaper%" == "1" echo Newspaper
if "%phone%" == "1" echo Phone
if "%lockpick%" geq "1" echo Lockpick
if "%charger%" == "1" echo Phone Charger
if "%2rkey%" == "1" echo Exit Key
if "%matches%" == "1" echo Matches
echo.
set /p input=">"
if "%input%" == "newspaper" goto checknewspaper
if "%input%" == "phone" goto checkphone
if "%input%" == "lockpick" goto uselockpick
if "%input%" == "phone charger" goto usephonecharger
if "%input%" == "exit key" goto useexitkey
if "%input%" == "matches" goto usematches
if "%input%" == "back" (
if "%area%" == "ms" goto mainstart
if "%area%" == "ml" goto mainleft
if "%area%" == "mr" goto mainright
if "%area%" == "2f" goto 2-forward
if "%area%" == "3s" goto 3-stairs
if "%area%" == "3f" goto 3-forward
if "%area%" == "4m" goto 4-main
if "%area%" == "4m2" goto 4-main2
if "%area%" == "4lw" goto 4lhitwall
)
goto noitemin

:usematches
if "%matches%" == "0" goto noitemin
if "%area%" == "4lw" goto usematches2
cls
echo These matches are useful. If this is here, there must be something I can burn here.
pause
goto inventory

:usematches2
cls
echo Well, the wall has been set alight, and it has revealed another room.
pause
set woodwallcheck=1
set woodwall=Enter Room
set matches=0
set keytext=1
goto 4-left

:mainleft
set area=ml
cls
echo There is a calculator on the desk. It looks like it was glued on for some reason.
echo.
echo 1) Use Calculator
echo 2) Check Inventory
echo 3) Leave
echo.
set /p input=">"
if "%input%" == "1" goto mlcalc
if "%input%" == "2" goto inventory
if "%input%" == "3" goto mainstart
goto mainleft

:mlcalc
cls
echo It looks like the calculator is still working. What should I put in?
echo (Type "back" to exit.)
echo.
set /p eq=">"
if "%eq%" == "back" goto mainleft
set /a math=%eq%
echo.
echo The answer is %math%.
pause
goto mlcalc

:mainright
set area=mr
cls
if "%newspaperontable%" == "1" echo It looks like there is a newspaper on this stool, and a mirror.
if "%newspaperontable%" == "0" echo It's just a stool, and a mirror.
echo.
echo 1) Look at Newspaper
echo 2) Look at yourself in the mirror
echo 3) Check Inventory
echo 4) Leave
set /p input=">"
if "%input%" == "1" goto mrnewspaper
if "%input%" == "2" goto mrmirror
if "%input%" == "3" goto inventory
if "%input%" == "4" goto mainstart
goto mainright

:mrnewspaper
if "%newspaper%" == "1" goto mrnewspapergone
cls
echo The newspaper reads: The world is about to be exploded by a big nuke! We better enjoy this last day on Earth to its fullest.
echo.
echo Well, that sucks.
echo.
echo 1) Take Newspaper
echo 2) Leave Newspaper
echo.
set /p input=">"
if "%input%" == "1" (
set newspaperontable=0
set newspaper=1
goto mainright
)
if "%input%" == "2" goto mainright
goto mrnewspaper

:mrnewspapergone
cls
echo The Newspaper isn't on the table anymore. Check your Inventory.
pause
goto mainright

:mrmirror
cls
echo Wow, I look dirty. Maybe I could find something to clean my self with.
pause
goto mainright

:noitemin
cls
echo That item is not in your inventory!
echo.
goto inventory2

:checknewspaper
if "%newspaper%" == "0" goto noitemin
cls
echo The newspaper reads: The world is about to be exploded by a big nuke! We better enjoy this last day on Earth to its fullest.
pause
goto inventory

:checkphone
cls
if "%phonebat%" == "1" goto checkphone2
echo The Phone is dead. I can't use it.
pause
goto inventory

:2-forward
set area=2f
cls
echo It looks like there is a left or right path. I better choose carefully.
echo.
echo 1) Move to the Left
echo 2) Move to the Right
echo 3) Move Back
echo 4) Check Inventory
echo.
set /p input=">"
if "%input%" == "1" goto 2-left
if "%input%" == "2" goto 2-right
if "%input%" == "3" goto mainstart
if "%input%" == "4" goto inventory
goto 2-forward

:2-right
set area=2r
cls
echo There is a door here.
echo.
echo 1) Open Door
echo 2) Leave
echo 3) Check Inventory
echo.
set /p input=">"
if "%input%" == "1" goto 2rdoorlock
if "%input%" == "2" goto 2-forward
if "%input%" == "3" goto inventory
goto 2-right

:2rdoorlock
set area=2rd
cls
echo The door is locked.
echo.
echo 1) Check Inventory
echo 2) Leave
echo.
set /p input=">"
if "%input%" == "1" goto inventory
if "%input%" == "2" goto 2-right
goto 2-right

:useexitkey
if "%2rkey%" == "1" goto useexitkey2
goto noitemin

:useexitkey2
if "%area%" == "2rd" goto endchoice
cls
echo It's a key that could be used to leave. May have to back track to get outta here.
pause
goto inventory

:endchoice
cls
echo (You break through the door to find not the outside, but a bright room.)
pause
echo.
echo Ugh, god dang it.
pause
cls
echo Thanks for playing! Once you exit pause, a file will be made called "saveforpt2.dlb". This will be used for when Part 2 is made. There will be intructions in the ReadMe for Part 2 on how to get it to load the file. Again, thanks for playing.
pause
set part2=part2start
(
echo %part2%
)>saveforpt2.dlb
goto mainmenu

:2-left
cls
echo It looks like there is stairs here. There's a drawer here too, maybe holding something?
echo.
echo 1) Go up stairs
echo 2) Check Drawer
echo 3) Check Inventory
echo 4) Go Back
echo.
set /p input=">"
if "%input%" == "1" goto 3-stairs
if "%input%" == "2" goto 2ldrawercheck
if "%input%" == "3" goto inventory
if "%input%" == "4" goto 2-forward
goto 2-left

:2ldrawercheck
if "%checkdrawer2l%" == "0" goto 2ldrawerempty
cls
echo There is only a box of matches. Take it?
echo.
echo 1) Take it
echo 2) Leave it
echo.
set /p input=">"
if "%input%" == "1" (
set checkdrawer2l=0
set matches=1
goto 2-left
)

:2ldrawerempty
cls
echo The drawer is empty.
pause
goto 2-left

:3-stairs
set area=3s
cls
echo There is a room in front and another on the right.
echo.
echo 1) Move Forward
echo 2) Move Right
echo 3) Move Back
echo 4) Inventory
echo.
set /p input=">"
if "%input%" == "1" goto 3-forward
if "%input%" == "2" goto 3-right
if "%input%" == "3" goto 2-left
if "%input%" == "4" goto inventory
goto 3-stairs

:3-forward
set area=3f
cls
echo There is a computer on the desk, this room looks like a office.
echo.
echo 1) Examine Computer Desk
echo 2) Check Inventory
echo 3) Go Back
echo.
set /p input=">"
if "%input%" == "1" goto 3fdesk
if "%input%" == "2" goto inventory
if "%input%" == "3" goto 3-stairs

:3fdesk
cls
echo There is a sticky note on the desk, and of course, a computer.
echo.
echo 1) View Sticky Note
echo 2) Use Computer
echo 3) Leave Computer Desk
echo.
set /p input=">"
if "%input%" == "1" goto 3fdstickynote
if "%input%" == "2" goto 3fdcomp
if "%input%" == "3" goto 3-forward
goto 3fdesk

:3fdstickynote
cls
echo The Sticky Note says:
echo.
echo PASSWORD: lit0531
echo.
pause
goto 3fdesk

:3fdcomp
cls
echo Please enter password.
echo.
set /p password="Password: "
if "%password%" == "lit0531" goto compdesk

:3fdcomp2
echo.
echo Incorrect Password.
echo.
echo 1) Reenter Password
echo 2) Exit Computer
echo.
set /p input=">"
if "%input%" == "1" goto 3fdcomp
if "%input%" == "2" goto 3fdesk
goto 3fdcomp2

:compdesk
cls
echo Apps:
echo.
echo Notepad
echo Door Manager
echo.
echo Open Apps:
echo Notepad
echo.
echo --------------
echo.
echo 1) Open Notepad
echo 2) Open Door Manager
echo 3) Turn Off Computer
echo.
set /p input=">"
if "%input%" == "1" goto compnotepad
if "%input%" == "2" goto compdoor
if "%input%" == "3" goto 3fdesk
goto compdesk

:compnotepad
cls
echo check-20.txt
echo --------------------------------------------------------------------
echo LOG FILE
echo.
echo Nuke lands, Earth almost destroyed.
echo 12/22/21 10:33:43
echo.
echo Found a alive person, bringing them into base to try to kill later.
echo 12/22/21 11:20:11
echo --------------------------------------------------------------------
echo.
echo 1) Exit Notepad
echo.
set /p input=">"
if "%input%" == "1" goto compdesk
goto compnotepad

:compdoor
cls
echo You currently have one door availible here.
echo.
echo Unlock it?
echo.
echo 1) Yes
echo 2) No
echo.
set /p input=">"
if "%input%" == "1" set doorunlock=1
if "%input%" == "2" goto compdesk
goto compdesk

:3-right
cls
echo There is a door here.
echo.
echo 1) Open Door
echo 2) Check Inventory
echo 3) Go Back
echo.
set /p input=">"
if "%input%" == "1" goto 3rdoorcheck
if "%input%" == "2" goto inventory
if "%input%" == "3" goto 3-stairs
goto 3-right

:3rdoorcheck
if "%doorunlock%" == "1" goto 4-main
cls
echo The door is locked.
pause
goto 3-right

:4-main
set area=4m
cls
echo It looks like I'm in a hall. Looks like there is a map here.
echo.
echo 1) Look at map
echo 2) Move Forward
echo 3) Check Inventory
echo 4) Go Back
echo.
set /p input=">"
if "%input%" == "1" goto 4mmap
if "%input%" == "2" goto 4-main2
if "%input%" == "3" goto inventory
if "%input%" == "4" goto 3-right
goto 4-main

:4mmap
cls
echo --------------------
echo [  Y=You O=Object  ]
echo --------------------
echo [                  ]
echo [     o    o       ]
echo [ Y                ]
echo [                  ]
echo [                  ]
echo --------------------
pause
goto 4-main

:4-main2
set area=4m2
cls
echo It looks like I can go to the Left.
echo.
echo 1) Move Left
echo 2) Check Inventory
echo 3) Go Back
echo.
set /p input=">"
if "%input%" == "1" goto 4-left
if "%input%" == "2" goto inventory
if "%input%" == "3" goto 4-main
goto 4-main2

:4-left
set area=4l
cls
if "%woodwalltext%" == "0" echo There is a wood wall here.
if "%woodwalltext%" == "1" echo There is an opening here.
echo.
echo 1) %woodwall%
echo 2) Check Inventory
echo 3) Go Back
echo.
set /p input=">"
if "%input%" == "1" goto 4lhitwall
if "%input%" == "2" goto inventory
if "%input%" == "3" goto 4-main2
goto 4-left

:4lhitwall
set area=4lw
if "%woodwallcheck%" == "1" goto 4lenterwall
cls
echo The wood sounds hollow, there is something behind it.
echo.
echo 1) Check Inventory
echo 2) Leave
echo.
set /p input=">"
if "%input%" == "1" goto inventory
if "%input%" == "2" goto 4-left
goto 4lhitwall

:4lenterwall
cls
if "%keytext%" == "1" echo There is a key here.
if "%keytext%" == "0" echo There isn't a key here.
echo.
echo 1) Take Key
echo 2) Leave Room
echo.
set /p input=">"
if "%input%" == "1" goto 4ltakekey
if "%input%" == "2" goto 4-left
goto 4lenterwall

:4ltakekey
if "%2rkey%" == "1" goto 4lnokey
cls
echo You grab the key, time to backtrack!
pause
set keytext=0
goto 4lenterwall

:4lnokey
cls
echo There isn't a key now.
pause
goto 4lenterwall
