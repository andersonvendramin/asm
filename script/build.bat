@ECHO OFF

CD %~dp0
IF NOT EXIST "..\build" (MD "..\build")
CD ..\build
nasm -f win64 ..\source\x64\nasm\hello_world.asm -o .\hello_world.o
ld .\hello_world.o -o .\hello_world.exe -e main -luser32 -l kernel32
CD %~dp0