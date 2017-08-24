
for %i in (.\processed_video\*.mp4) do .\ffmpeg\bin\ffmpeg -i .\compress\example.mp4 -movflags faststart -acodec copy -vcodec copy .\processed_video\example-compressed.mp4
