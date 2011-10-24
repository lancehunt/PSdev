#!/bin/sh
#  usage: sh setup.sh
#   determines whether OS is Win95 or WinNT by finding command interpreter
#   also copies bashrc to proper location
#  
#  Copyright (C) 2001 Joshua Daniel Franklin
#  
#  This is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
PATH=/bin
mkdir /Windows
mount $WINDIR /Windows
if [ -f /Windows/COMMAND.COM ]; then
	cp /src/bash95.pif /bash.pif
elif [ -f /Windows/System32/CMD.EXE ]; then
	cp /src/bashNT.pif /bash.pif
else echo "Fatal Error: Commmand Interpreter not found. You must edit /bash.pif manually (use /src/bash95.pif or /src/bashNT.pif as a model)"
fi
umount /Windows
rmdir /Windows
cp /src/bashrc /etc
