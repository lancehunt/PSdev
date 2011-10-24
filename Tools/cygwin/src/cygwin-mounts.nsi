# cygwin-mounts.nsi restores cygwin1.dll mounts to c:/cygwin
#    Copyright (C) 2001 Joshua Daniel Franklin
#
#    This is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
Name "cygwin-mounts"
ComponentText "This will install." 
OutFile cygwin-mounts.exe
SilentInstall silent
InstallDir $DESKTOP

CRCCheck on
InstType Default

Section "Default"
InstallDirRegKey HKEY_LOCAL_MACHINE "SOFTWARE\Cygnus Solutions" ""
WriteRegStr HKEY_LOCAL_MACHINE "SOFTWARE\Cygnus Solutions\Cygwin\Program Options" "" ""
WriteRegDWord HKEY_LOCAL_MACHINE "SOFTWARE\Cygnus Solutions\Cygwin\mounts v2\/" "flags" "00000008"
WriteRegStr HKEY_LOCAL_MACHINE "SOFTWARE\Cygnus Solutions\Cygwin\mounts v2\/" "native" "C:/cygwin"
WriteRegDWord HKEY_LOCAL_MACHINE "SOFTWARE\Cygnus Solutions\Cygwin\mounts v2\/usr/bin" "flags" "00000008"
WriteRegStr HKEY_LOCAL_MACHINE "SOFTWARE\Cygnus Solutions\Cygwin\mounts v2\/usr/bin" "native" "C:/cygwin/bin"
WriteRegDWord HKEY_LOCAL_MACHINE "SOFTWARE\Cygnus Solutions\Cygwin\mounts v2\/usr/lib" "flags" "00000008"
WriteRegStr HKEY_LOCAL_MACHINE "SOFTWARE\Cygnus Solutions\Cygwin\mounts v2\/usr/lib" "native" "C:/cygwin/lib"
