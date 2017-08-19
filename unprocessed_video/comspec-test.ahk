#NoEnv
SetBatchlines -1
SendMode Input
setworkingdir, %a_scriptdir%

FFMPEG= C:\Users\Nicholas\Desktop\360\unprocessed_video\ffmpeg\bin\ffmpeg.exe
FFARGS=(echo file 'C:\Users\Nicholas\Desktop\360\intro_video\intro.mp4' && for `%i in (*.mp4) do @echo file `%i ') > "C:\Users\Nicholas\Desktop\360\unprocessed_video\mylist.txt && ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.mp4

; runwait,%comspec% /k %ffmpeg% -i "%ALF%" %FFARGS% "%out%\%name_no_ext%"
;
; runwait,%comspec% /k echo C:\Users\Nicholas\Desktop\360\unprocessed_video\ffmpeg\bin\ffmpeg.exe %FFARGS%
runwait,%comspec% /k echo file 'C:\Users\Nicholas\Desktop\360\intro_video\intro.mp4' > mylist.txt & for %i in (*.mp4) do @echo file '%i' >> mylist.txt & ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.mp4


; for %%A IN (*.mp4) DO @echo file "%%A" >> mylist.txt & ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.mp4
