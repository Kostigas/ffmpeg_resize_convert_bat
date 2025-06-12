@echo off
pushd "%~dp0"
setlocal enabledelayedexpansion

for %%f in (*.mp4 *.mov) do (
    set "filename=%%~nf"
    set "extension=.mp4"  REM Output will always be .mp4
    ffmpeg -i "%%f" -c:v libx264 -preset fast -crf 28 -bufsize 2M -c:a aac -b:a 128k -movflags +faststart -vf scale=2560:-2 "!filename!2k!extension!"
)

popd
echo Done!
pause
