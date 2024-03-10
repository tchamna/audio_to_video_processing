echo off 

REM To use this Script, you first need to:
REM - go to your Github Account, 
REM - Create a Github Access Token 
REM - Grant rights (push repository, delete repository, etc)

REM Create Repos
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::     CREATE GITHUB REPOSITORY
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

echo.

set /p "user=Enter your GitHub username: "
set /p "repo=Enter the repository name to create: "
set /p "token=Enter your GitHub token: "

echo.

echo You are about to Create the GitHub repository: %user%/%repo%
set /p "confirm=Are you sure you want to create this repository? (y/n): "

echo. 

if /i "%confirm%" neq "y" (
    echo Operation cancelled by user.
    pause
    exit /b
)

curl -H "Authorization: token %token%" ^
     -d "{\"name\":\"%repo%\", \"private\":true}" ^
     https://api.github.com/user/repos

echo your repository  %user%/%repo% has been created 
pause 
pause 
REM ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
REM ::     DELETE GITHUB REPOSITORY
REM :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
REM set /p "user=Enter your GitHub username: "
REM set /p "repo=Enter the repository name to delete: "
REM set /p "token=Enter your GitHub token: "

REM echo You are about to delete the GitHub repository: %user%/%repo%
REM set /p "confirm=Are you sure you want to delete this repository? (y/n): "

REM if /i "%confirm%" neq "y" (
    REM echo Operation cancelled by user.
    REM exit /b
REM )

REM curl -X DELETE -H "Authorization: token %token%" https://api.github.com/repos/%user%/%repo%

REM echo Repository deleted.



echo pause 

