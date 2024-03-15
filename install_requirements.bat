@echo off
for /F "tokens=*" %%i in (requirements_video_production.txt) do (
    pip install %%i
)
