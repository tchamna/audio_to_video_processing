@echo off
for /F "tokens=*" %%i in (requirements__reduced_311.txt) do (
    pip install %%i
)
