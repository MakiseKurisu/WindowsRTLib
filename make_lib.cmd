@echo	off

::VS2013
call	"%VS120COMNTOOLS%\..\..\VC\vcvarsall.bat" x86_arm > NUL

if	"%VisualStudioVersion%" == "" (
	echo	You should run this script under Visual Studio ARM cross tools command prompt.
	pause
	goto	eof
	)

echo	This script uses "dll2lib" made by Peter Nelson
echo	See more informations at https://github.com/peterdn/dll2lib

:: kernel32

for	%%i in (System32\*.dll) do call :dll2lib %%i
copy	System32\*.lib Lib\
del	System32\*.def
del	System32\*.exp
del	System32\*.lib

pause
goto	eof
:dll2lib
::Using Windows RT libraries
::Download link: http://www.microsoft.com/en-us/download/details.aspx?id=40810
echo	%1
dll2lib	%1 > NUL
goto	eof
:eof