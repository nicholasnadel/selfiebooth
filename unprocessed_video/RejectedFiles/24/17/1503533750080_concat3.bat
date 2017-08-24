REM REMOVE WHITESPACE FROM FILENAMES
REM @echo off
Setlocal enabledelayedexpansion

Set "Pattern= "
Set "Replace=_"

For %%a in (*.mov) Do (
    Set "File=%%~a"
    Ren "%%a" "!File:%Pattern%=%Replace%!"
)

For %%a in (*.mp4) Do (
    Set "File=%%~a"
    Ren "%%a" "!File:%Pattern%=%Replace%!"
)


REM ENSURE ALL VIDEOS ARE MP4 FORMAT AND MOVE ORIGINALS TO BACKUP FOLDER
for %%A IN (*.MOV) DO .\ffmpeg\bin\ffmpeg -i "%%A" "%%A.mp4"


for %%A IN (*.MOV) DO move %%A .\backups

REM CREATE INTRO VIDEO FOLDER
If not exist .\intro_video  (
(mkdir .\intro_video)
for %%A IN (*.) DO .\ffmpeg\bin\ffmpeg -i "intro.mp4"
REM forfiles /M .\intro_video\*.mp4 /C "cmd /c rename @file \"@fname intro.mp4""
msg * "Created intro_video folder. If you want to create an intro video, please add 'intro'.mp4 to it. Note that the filename is 'intro' and the filetype is mp4. The name is NOT 'intro.mp4'!"
)

rename ".\intro_video\*" intro.mp4

REM ADD INTRO VIDEO TO CONCAT FILE
echo file '.\intro_video\intro.mp4' > mylist.txt

REM ADD 360 VIDEO TO CONCAT FILE, CONCATENATE, AND CREATE PROCESSED VIDEO
If not exist .\processed_video  (
  (mkdir .\processed_video)
  )

for %%i in (*.mp4) do @echo file '%%i' >> mylist.txt && .\ffmpeg\bin\ffmpeg -f concat -safe 0 -i mylist.txt -c copy .\processed_video\%%i

REM ATTEMPTING .H264 ENCODING
for %%i in (.\processed_video\*.mp4) do .\ffmpeg\bin\ffmpeg -i %%i -movflags faststart -acodec copy -vcodec .\processed_video\%%i
REM for %i in (.\processed_video\*.mp4) do .\ffmpeg\bin\ffmpeg -i %i -movflags faststart -acodec copy -vcodec copy .\processed_video\compressed\%i
for %%i in (.\processed_video\*.mp4) do .\ffmpeg\bin\ffmpeg -i %%i -c:v libx264 -preset slow -s 1024x576 -an -b:v 370K homepage.mp4
for %i in (\processed_video\*.mp4) do .\ffmpeg\bin\ffmpeg -i %i -c:v libx264 -preset slow -s 1024x576 -an -b:v 370K \processed_video\%i-compressed

REM for %i in (*.mp4) do @echo file '%i' >> mylist.txt && .\ffmpeg\bin\ffmpeg -f concat -safe 0 -i mylist.txt -c copy .\processed_video\%i

REM BACKUP AND MOVE ORIGINAL VIDEO FILE
If not exist .\backups (
(mkdir .\backups)
)
for %%i in (*.mp4) do move %%i .\backups

REM del mylist.txt
REM && if not exist ".\backups" mkdir ".\backups" && for %%i in (*.mp4) do move %%i .\backups
