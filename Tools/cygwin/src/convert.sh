#!/bin/bash
# a very messy script for converting standard man pages to HTML using man2html
#  the man pages must be in the current directory
#    default cygwin manpath is /usr/man--try copying from there first
#    if you're on a different system (i.e. SuSE, Caldera) try 'echo $MANPATH'
#    you can copy them all with a short script like:
#		for i in $(find /usr/man -name "*"); do
#			eval cp $i ./
#		done
#    however, I don't recommend this as there are probably a lot of man pages!
#  output is to ./html/ which is created if it does not exist
#  man2html is normally used remotely; since this is for local use, 
#    the cgi-bin stuff is stripped
#  section number extentions are stripped (i.e., bash.1 -> bash.html) 
#    this will be trouble if you want pages from two sections
# 
#    Copyright (C) 2001 Joshua Daniel Franklin
#
#    This is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
if [ ! -d /tmp/TMPDIR$$ ]; then
	mkdir /tmp/TMPDIR$$
fi 
if [ ! -d ./html ]; then
	mkdir ./html
fi 
for i in ./*.? ; do
	filename=${i%.*}.html
	man2html $i > "/tmp/TMPDIR$$/$i.html"
	sed -e 's/http:\/\/localhost\/cgi-bin\/man\/man2html">/.\/index.html">/' /tmp/TMPDIR$$/$i.html > /tmp/TMPDIR$$/$itmp.html 
	sed -e 's/http:\/\/localhost\/cgi-bin\/man\/man2html.*+\(.*\)">/.\/\1.html">/' /tmp/TMPDIR$$/$itmp.html > ./html/$filename
done
if [ -f html/vim.html ]; then
  mv html/vim.html html/vi.html			#links are to vi, not vim
fi
rm /tmp/TMPDIR$$/.html				#I ought to figure out why
rm /tmp/TMPDIR$$/*				#this happens, but I'm lazy
rmdir /tmp/TMPDIR$$
