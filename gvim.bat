rem ��������Ⱦ���ػ�����vim
@echo off
set tmpstr=%~dp0
rem set VIM=%tmpstr:~0,-1%
set A=""
for %%x in (%1) do set A=%%~sx
start %VIM%\gvim.exe -u %VIM%\.vimrc --remote-tab-silent "%A%"
@echo on

