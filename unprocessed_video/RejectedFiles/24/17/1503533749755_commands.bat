:: convert tp MOV to MP4
FOR /F "tokens=*" %G IN ('dir /b *.mov') DO ffmpeg -i "%G" "%~nG.mp4"

::WORKING - NEED TO STRING TOGETHER
echo file 'C:\Users\Nicholas\Desktop\360\intro_video\intro.mp4' > mylist.txt
for %i in (*.mp4) do @echo file '%i' >> mylist.txt
ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.mp4
::END



:: concat intro and 360 video
(echo file 'C:\Users\Nicholas\Desktop\360\intro_video\intro.mp4' & for %i in (*.mp4) do @echo file '%i') > mylist.txt & ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.mp4



::watermark
ffmpeg -i output.mp4 -i watermark.png -filter_complex "overlay=10:10" output-watermak.mp4
