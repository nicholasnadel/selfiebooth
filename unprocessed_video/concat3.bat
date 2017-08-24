del mylist.txt
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
for %%A IN (*.MOV) DO .\ffmpeg\bin\ffmpeg -i "%%~A" "%%~A.mp4"


for %%A IN (*.MOV) DO move %%A .\backups


REM CREATE INTRO VIDEO FOLDER AND SUBSEQUENT FOLDERS
If not exist .\intro_video  (
(mkdir .\intro_video)
for %%A IN (*.) DO .\ffmpeg\bin\ffmpeg -i "intro.mp4"
REM forfiles /M .\intro_video\*.mp4 /C "cmd /c rename @file \"@fname intro.mp4""
msg * "Created intro_video folder. If you want to create an intro video, please add 'intro'.mp4 to it. Note that the filename is 'intro' and the filetype is mp4. The name is NOT 'intro.mp4'!"
)

If not exist .\processed_video  (
  (mkdir .\processed_video)
  )

If not exist .\uncompressed  (
  (mkdir .\uncompressed)
  )


rename ".\intro_video\*" intro.mp4

REM ADD INTRO VIDEO TO CONCAT FILE
echo file '.\intro_video\intro.mp4' > mylist.txt

REM ADD 360 VIDEO TO CONCAT FILE, CONCATENATE, AND CREATE PROCESSED VIDEO

for %%i in (*.mp4) do @echo file '%%i' >> mylist.txt && .\ffmpeg\bin\ffmpeg -f concat -safe 0 -i mylist.txt -c copy .\uncompressed\%%i

REM ATTEMPTING .H264 ENCODING
REM for %%i in (.\processed_video\*.mp4) do .\ffmpeg\bin\ffmpeg -i %%i -movflags faststart -acodec copy -vcodec .\processed_video\%%i
REM for %i in (.\processed_video\*.mp4) do .\ffmpeg\bin\ffmpeg -i %i -movflags faststart -acodec copy -vcodec copy .\processed_video\compressed\%i


REM for %i in (*.mp4) do .\ffmpeg\bin\ffmpeg -i %i -c:v libx264 -preset slow -crf 22 %i


for %%i in (.\uncompressed\*.mp4) do .\ffmpeg\bin\ffmpeg -i %%i -c:v libx264 -crf 25 -b:v 1M -c:a aac .\processed_video\%%i

for %f .\processed_video\ %f in (*.MOV) do (
echo %~nf
)
REM for %i in (*.mp4) do @echo file '%i' >> mylist.txt && .\ffmpeg\bin\ffmpeg -f concat -safe 0 -i mylist.txt -c copy .\processed_video\%i

REM BACKUP AND MOVE ORIGINAL VIDEO FILE
If not exist .\backups (
(mkdir .\backups)
)
for %%i in (*.mp4) do move %%i .\backups

del mylist.txt
REM && if not exist ".\backups" mkdir ".\backups" && for %%i in (*.mp4) do move %%i .\backups
