@set DOTFILES=%USERPROFILE%\dotfiles\windows
for /F "usebackq" %%i in (`dir %DOTFILES% /A-D /b`) do (
  mklink %USERPROFILE%\%%i %DOTFILES%\%%i
)
@pause
