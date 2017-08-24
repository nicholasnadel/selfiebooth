(echo file 'C:\Users\Nicholas\Desktop\360\intro_video\intro.mp4' & for %i in (*.mp4) do @echo file '%i') > mylist.txt & ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.mp4
