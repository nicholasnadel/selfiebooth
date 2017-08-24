
ffmpeg -i intro.mp4 \
-c:v libx264 -crf 19 -level 3.1 -preset slow -tune film \
-filter:v scale=-1:720 -sws_flags lanczos \
-c:a libfdk_aac -vbr 5 \
output.mp4
