@echo	off
set	dotnet=C:\Windows\Microsoft.NET\Framework
for /f	"delims=" %%v in ('dir /ad /b %dotnet%\v?.*') do (
	if exist "%dotnet%\%%v\csc.exe" set csc="%dotnet%\%%v\csc.exe"
	if exist "%dotnet%\%%v\vbc.exe" set vbc="%dotnet%\%%v\vbc.exe"
	if exist "%dotnet%\%%v\jsc.exe" set jsc="%dotnet%\%%v\jsc.exe"
	)

%csc%	dll2lib.cs
pause