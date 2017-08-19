for %f in (*.mp4) do echo file '%~nxf' >>%~dpf\concat.txt
ffmpeg -f concat -safe 0 -i mylist.txt -c copy output
