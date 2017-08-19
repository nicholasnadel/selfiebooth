IF not exist .\backups (mkdir .\backups)
for %%i in (*.mp4) do move %%i .\backups
