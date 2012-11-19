@echo off

echo .* * *W A R N I N G * * *

echo .

echo .The File(s)/Folders(s) Will Be Permanently Deleted!

echo .

echo .Press CTRL-C to Abort and Terminate Batch Job Or...

echo .

pause

sdelete -p 4 -s %1
