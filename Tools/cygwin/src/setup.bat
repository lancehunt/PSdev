@echo off
cd %1
echo @echo off > bash.bat
echo cd %1 >> bash.bat
echo bin\bash --rcfile etc\bashrc >> bash.bat
echo exit >> bash.bat
bin\sh.exe src\setup.sh
