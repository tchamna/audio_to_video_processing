echo off 

REM To use this Script, you first need to:
REM - go to your Github Account, 
REM - Create a Github Access Token 
REM - Grant rights (push repository, delete repository, etc)


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::     DELETE GITHUB REPOSITORY
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
set /p "user=Enter your GitHub username: "
set /p "repo=Enter the repository name to delete: "
set /p "token=Enter your GitHub token: "

echo You are about to delete the GitHub repository: %user%/%repo%
set /p "confirm=Are you sure you want to delete this repository? (y/n): "

if /i "%confirm%" neq "y" (
    echo Operation cancelled by user.
    pause
    exit /b
)

curl -X DELETE -H "Authorization: token %token%" https://api.github.com/repos/%user%/%repo%

echo Repository deleted.


pause 
pause 

