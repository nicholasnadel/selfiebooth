#NoEnv
SetBatchlines -1
SendMode Input
setworkingdir, %a_scriptdir%
#SingleInstance force
#Persistent

FFMPEG=C:\Users\Nicholas\Desktop\360\unprocessed_video\ffmpeg\bin\ffmpeg.exe
; FFARGS= echo file 'C:\Users\Nicholas\Desktop\360\intro_video\intro.mp4' > mylist.txt & for %i in (*.mp4) do @echo file '%i' >> mylist.txt & ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.mp4


REC=C:\Users\Nicholas\Desktop\360\unprocessed_video   ;-- put video files here
 IfNotExist, %REC%
   FileCreateDir, %REC%

OUT=C:\Users\Nicholas\Desktop\360\processed_video  ;-- created audio files
 IfNotExist, %out%
   FileCreateDir, %out%

   MP4toMP3OUT:
      Loop,%REC%\*.*,0,1
         {
         ALF= %A_LoopFileFullPath%
         SplitPath, ALF, name, dir, ext, name_no_ext, drive
         if (ext="mp4")
            {
            ; runwait,%comspec% /c %ffmpeg% -i "%ALF%" -ab 192k "%out%\%name_no_ext%.mp3", , Hide
            ; runwait,%comspec% /k type concat.bat
            run, concat3.bat

            ; FileMove, %ALF%, %OUT%, 1
            }
         }
      Sleep 5000

   return
