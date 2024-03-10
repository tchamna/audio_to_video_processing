@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:: Navigate to your repository's directory (if not already there)
REM cd /d "G:\Engineering\Systems Engineering\Training, Tutorials and HOWTO\Python Scripts-Codes\ModbusFaulAnalysis\ModbusFaultAnalysis_New"
REM REM daily_report_pipeline_including_faults
REM rtchamna
REM daily_report_pipeline_including_faults


REM git remote add origin https://github.com/rtchamna/daily_report_pipeline_including_faults.git
echo.
echo Make sure you start this script from the local directory of the project you want to push on github...
echo.

set /p username=Enter your GitHub username: 
set /p repository=Enter the name of your GitHub repository: 

echo.

echo The GitHub repository URL you will be pushing data to is: 
echo https://github.com/%username%/%repository%.git
echo.

set repo_url=https://github.com/%username%/%repository%.git

pause

set /p branch_name=Enter your branch name (e.g. master or main): 

:: Variables
REM SET "repo_url=https://github.com/rtchamna/daily_report_pipeline_including_faults.git"

set /p commit_message=Enter your commit message: 

REM SET "commit_message=Initial commit"
REM SET "branch_name=master" 

REM set /p "token=Enter your GitHub token: "



:: Initialize a new Git repository if not already done
IF NOT EXIST ".git" (
    git init
)

:: Add all files to the repository
git add .

:: Commit the files
git commit -m "%commit_message%"

:: Add the remote GitHub repository (if not already added)
REM git remote add origin %repo_url% 2>nul || git remote set-url origin %repo_url%


REM If "origin" does not exist, add it
if errorlevel 1 (
    git remote add origin %repo_url%
    echo "Origin remote added successfully."
) else (
    echo "Origin remote already exists."
)

:: Set the branch to push to
SET "remote_branch=origin %branch_name%"

:: Push the commit to the GitHub repository
echo.
echo Pushing to GitHub...
git push --force %remote_branch%

:: If you encounter issues with SSL verification, use the following line instead
:: git -c http.sslVerify=false push --force %remote_branch%

:: End
echo.
echo Done!
pause

ENDLOCAL
