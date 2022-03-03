@echo off
Color 0A & Mode 136,10
Title GET ( MD2, MD4, MD5, SHA1, SHA256, SHA384, SHA512 ) HASHES from file by drag and drop using Certutil 
Set ScriptName=%~nx0
if "%~1"=="" goto error
Set LogFile=%~nx1_HASHES.txt
If Exist "%LogFile%" Del "%LogFile%"
echo(
SetLocal EnableDelayedExpansion
for %%a in (MD2 MD4 MD5 SHA1 SHA256 SHA384 SHA512) do (
     for /f "skip=1 delims=" %%H in ('CertUtil -hashfile "%~1" %%a ^| findstr /i /v "CertUtil"') do ( set H=%%H)
( echo %%a=!H!)
( echo %%a=!H!)>> "!LogFile!"
)
EndLocal
Timeout /T 1 /NoBreak>nul & Start "" "%LogFile%" & Exit
REM --------------------------------------------------------------------------------------
:Error
Color 0C & Mode 104,5
echo( & echo(
echo               You should drag and drop a file over this batch file "%ScriptName%"
Timeout /T 5 /nobreak>nul & exit
REM --------------------------------------------------------------------------------------