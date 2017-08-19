echo file 'C:\Users\Nicholas\Desktop\360\intro_video\intro.mp4' > mylist.txt
for %%i in (*.mp4) do @echo file '%%i' >> mylist.txt && ffmpeg -f concat -safe 0 -i mylist.txt -c copy C:\Users\Nicholas\Desktop\360\processed_video\%%i

IF not exist .\backups (mkdir .\backups)
for %%i in (*.mp4) do move %%i .\backups
REM echo nul>mylist.txt
REM && if not exist ".\backups" mkdir ".\backups" && for %%i in (*.mp4) do move %%i .\backups
