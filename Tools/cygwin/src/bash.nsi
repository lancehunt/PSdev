#bash.nsi for use with Nullsoft NSIS installer Free software 
#	with documentation from <http://www.nullsoft.com/free>
#
# Copyright (C) 2001 Joshua Daniel Franklin
# 
#    This is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
Name "cygwin-1.1.8-2 Lite"
ComponentText "This will install Cygwin-Lite on your computer."
LicenseText "You must read the following license before installing."
LicenseData src\gpl.txt
DirText "NOTICE: If you have a previous Cygwin installation, installing Cygwin-Lite will overwrite your mount table." 
OutFile cygwin-lite-1-1-8-2.exe
InstallDir $PROGRAMFILES\cygwin
UninstallText "This will uninstall Cygwin-Lite from your system."
UninstallExeName uninst-cygwin.exe
EnabledBitmap src\enabled.bmp
DisabledBitmap src\disabled.bmp
Icon src\cygwin.ico
CRCCheck on
InstType Normal
InstType Minimal

Section "cygwin-1.1.8-2 and GNU tools"
InstallDirRegKey HKEY_LOCAL_MACHINE "SOFTWARE\Cygnus Solutions" ""
WriteRegStr HKEY_LOCAL_MACHINE "SOFTWARE\Cygnus Solutions\Cygwin\Program Options" "" ""
WriteRegDWord HKEY_LOCAL_MACHINE "SOFTWARE\Cygnus Solutions\Cygwin\mounts v2\/" "flags" "00000008"
WriteRegStr HKEY_LOCAL_MACHINE "SOFTWARE\Cygnus Solutions\Cygwin\mounts v2\/" "native" "$INSTDIR"
WriteRegDWord HKEY_LOCAL_MACHINE "SOFTWARE\Cygnus Solutions\Cygwin\mounts v2\/usr/bin" "flags" "00000008"
WriteRegStr HKEY_LOCAL_MACHINE "SOFTWARE\Cygnus Solutions\Cygwin\mounts v2\/usr/bin" "native" "$INSTDIR\bin"
WriteRegDWord HKEY_LOCAL_MACHINE "SOFTWARE\Cygnus Solutions\Cygwin\mounts v2\/usr/lib" "flags" "00000008"
WriteRegStr HKEY_LOCAL_MACHINE "SOFTWARE\Cygnus Solutions\Cygwin\mounts v2\/usr/lib" "native" "$INSTDIR\lib"
WriteRegStr HKEY_LOCAL_MACHINE "Software\Microsoft\Windows\CurrentVersion\Uninstall\cygwin-lite" "DisplayName" "Cygwin-Lite (remove only)"
WriteRegStr HKEY_LOCAL_MACHINE "Software\Microsoft\Windows\CurrentVersion\Uninstall\cygwin-lite" "UninstallString" '"$INSTDIR\uninst-cygwin.exe"'
SetOutPath $INSTDIR
File bash.pif
SetOutPath $INSTDIR\src
File src\bashrc
File src\bash95.pif
File src\bashNT.pif
File src\cygwin.ico
File src\gpl.txt
File src\setup.bat
File src\setup.pif
File src\setup.sh
SetOutPath $INSTDIR\bin
File bin\bash.exe
File bin\cat.exe
File bin\cp.exe
File bin\cygwin1.dll
File bin\du.exe
File bin\find.exe
File bin\grep.exe
File bin\less.exe
File bin\ls.exe
File bin\mkdir.exe
File bin\mount.exe
File bin\mv.exe
File bin\rm.exe
File bin\rmdir.exe
File bin\sed.exe
File bin\sh.exe
File bin\sort.exe
File bin\umount.exe
File bin\wc.exe
File bin\xargs.exe
SetOverwrite off
SetOutPath $INSTDIR\etc
SetOutPath $INSTDIR\home
SetOutPath $INSTDIR\home\cygwin-lite
SetOutPath $INSTDIR\lib
SetOutPath $INSTDIR\tmp
SetOutPath $INSTDIR
Exec '$INSTDIR\src\setup.bat "$INSTDIR"'

Section "Source scripts"
SectionIn 12
SetOverwrite on
SetOutPath $INSTDIR\src
File src\readme.txt
File src\bash.nsi
File src\buildleft.plx
File src\convert.sh
File src\cygwin-mounts.nsi
File src\dirlisting
File src\disabled.bmp
File src\enabled.bmp
File src\notice.txt
File src\nsislister.sh

Section "Start Menu Group"
SectionIn 12
SetOutPath $SMPROGRAMS\Cygwin-Lite
SetOutPath $INSTDIR\html
File html\right.html
SetOutPath $INSTDIR
CreateShortCut "$DESKTOP\bash.lnk" "$INSTDIR\bash.pif" "" "$INSTDIR\src\cygwin.ico" 0
CreateShortCut "$QUICKLAUNCH\bash.lnk" "$INSTDIR\bash.pif" "" "$INSTDIR\src\cygwin.ico" 0
CreateShortCut "$SMPROGRAMS\Cygwin-Lite\bash.lnk" "$INSTDIR\bash.pif" "" "$INSTDIR\src\cygwin.ico" 0
CreateShortCut "$SMPROGRAMS\Cygwin-Lite\User's Guide.lnk" "$INSTDIR\html\right.html" "" "" 0
CreateShortCut "$SMPROGRAMS\Cygwin-Lite\Uninstall Cygwin-Lite.lnk" "$INSTDIR\uninst-cygwin.exe" "" "" 0

Section "Vi IMproved: vim, vimtutor"
SectionIn 1
SetOutPath $INSTDIR\bin
File bin\vim.exe
File bin\vimtutor
SetOutPath $INSTDIR\usr\share\vim\vim57\tutor
File usr\share\vim\vim57\tutor\tutor
SetOutPath $INSTDIR\usr\share\vim\vim57\syntax
File usr\share\vim\vim57\syntax\syntax.vim
File usr\share\vim\vim57\syntax\synload.vim
File usr\share\vim\vim57\syntax\nosyntax.vim

Section "Compression: tar, gzip"
SectionIn 1
SetOutPath $INSTDIR\bin
File bin\gzip.exe
File bin\tar.exe

Section "HTML manual documentation"
SectionIn 1
SetOutPath $INSTDIR\html
File html\bash.html
File html\cp.html
File html\cat.html
File html\du.html
File html\find.html
File html\grep.html
File html\Guide.html
File html\gzip.html
File html\index.html
File html\less.html
File html\left.html
File html\ls.html
File html\mkdir.html
File html\mount.html
File html\mv.html
File html\right.html
File html\rm.html
File html\rmdir.html
File html\sed.html
File html\sh.html
File html\sort.html
File html\tar.html
File html\umount.html
File html\vi.html
File html\wc.html
File html\xargs.html
CreateShortCut "$INSTDIR\User's Guide.lnk" "$INSTDIR\html\guide.html" "" "" 0
CreateShortCut "$STARTMENU\Programs\Cygwin-Lite\User's Guide.lnk" "$INSTDIR\html\Guide.html" "" "" 0

Section -post
Exec '"explorer" "$INSTDIR\"'
Exec '"notepad" "$INSTDIR\src\gpl.txt"'

Section Uninstall
DeleteRegKey HKEY_LOCAL_MACHINE "Software\Microsoft\Windows\CurrentVersion\Uninstall\cygwin-lite"
DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\Cygnus Solutions"
DeleteRegKey HKEY_CURRENT_USER  "SOFTWARE\Cygnus Solutions"
Delete $STARTMENU\Programs\Cygwin-Lite\*
RMDir $STARTMENU\Programs\Cygwin-Lite
Delete $DESKTOP\bash.lnk
Delete $DESKTOP\bash.pif
Delete $QUICKLAUNCH\bash.lnk
Delete $QUICKLAUNCH\bash.pif
Delete "$INSTDIR\User's Guide.lnk"
Delete $INSTDIR\gpl.txt
Delete $INSTDIR\bash.pif
Delete $INSTDIR\bash.lnk
Delete $INSTDIR\bash.bat
Delete $INSTDIR\bashrc
Delete $INSTDIR\.bash_history
Delete $INSTDIR\bin\*.*
Delete $INSTDIR\etc\*.*
Delete $INSTDIR\html\*.*
Delete $INSTDIR\src\*.*
Delete $INSTDIR\tmp\*.*
Delete $INSTDIR\usr\share\vim\vim57\tutor\*.*
Delete $INSTDIR\usr\share\vim\vim57\syntax\*.*
RMDir $INSTDIR\usr\share\vim\vim57\tutor
RMDir $INSTDIR\usr\share\vim\vim57\syntax
RMDir $INSTDIR\usr\share\vim\vim57
RMDir $INSTDIR\usr\share\vim\
RMDir $INSTDIR\usr\share
RMDir $INSTDIR\usr
RMDir $INSTDIR\tmp
RMDir $INSTDIR\src
RMDir $INSTDIR\lib
RMDir $INSTDIR\html
RMDir $INSTDIR\home\cygwin-lite
RMDir $INSTDIR\home
RMDir $INSTDIR\etc
RMDir $INSTDIR\bin
Delete $INSTDIR\uninst-cygwin.exe
RMDir $INSTDIR\
