
echo file 'C:\Users\Nicholas\Desktop\360\intro_video\intro.mp4' > mylist.txt && for %%i in (*.mp4) do @echo file '%%i' >> mylist.txt && ffmpeg -f concat -safe 0 -i mylist.txt -c copy C:\Users\Nicholas\Desktop\360\processed_video\%%i-360.mp4

:: WORKING
REM echo file 'C:\Users\Nicholas\Desktop\360\intro_video\intro.mp4' > mylist.txt && for %%i in (*.mp4) do @echo file '%%i' >> mylist.txt && ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.mp4

REM echo file 'C:\Users\Nicholas\Desktop\360\intro_video\intro.mp4' > mylist.txt && for %%i in (*.mp4) do @echo file '%%i' >> mylist.txt && ffmpeg -f concat -safe 0 -i mylist.txt -c copy C:\Users\Nicholas\Desktop\360\processed_video\%%i-360
REM echo file 'C:\Users\Nicholas\Desktop\360\intro_video\intro.mp4' > mylist.txt && for %%i in (*.mp4) do @echo file '%%i' >> mylist.txt && ffmpeg -f concat -safe 0 -i mylist.txt -c copy C:\Users\Nicholas\Desktop\360\processed_video\%%i-360

REM for %i in (*.mp4) do @echo file '%i' >> mylist.txt
REM ffmpeg -f concat -safe 0 -i mylist.txt -c copy C:\Users\Nicholas\Desktop\360\processed_video\%i-360.mp4 & if not exist ".\backups" mkdir ".\backups" & for %i in (*.mp4) do move %i ".\backups\"%i.mp4
