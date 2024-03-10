@echo off

:: Open your favorite command line and type the name of this script Z_create_virtual_environment.bat 
:: follow by the name of the folder you want to create the virtual environement in
:: Example: Z_create_virtual_environment FAULT_DETECTION


:: Check if a folder name argument was provided
if "%~1"=="" (
	echo.
	echo Please provide a folder name.
	echo.
	echo Type the name of the batch script followed by 
	echo the name of the folder you want to create to host your new project.
	echo.
	echo Example: Z_create_virtual_environment   Nufi
	echo where Nufi is the project name.
	
    exit /b 1
)

:: Create the specified folder and navigate to it
mkdir %1 && cd %1
echo.
echo activating your environment ...
echo.
echo after the env is activated, you should see (venv)
echo.
echo if you want to deactivate the venv, just type deactivate 


:: Create a virtual environment inside the folder
python -m venv venv
venv\Scripts\activate

REM echo installing libraries ...

:: Install required libraries using pip within the virtual environment
call venv\Scripts\pip install dash pandas


REM :: Prompt the user to press any key to continue
REM echo Press any key to continue...
REM @pause
REM pause



