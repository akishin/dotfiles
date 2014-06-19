@set DOTFILES=%USERPROFILE%\dotfiles
for %%i in (.vimrc, .gvimrc) do (
  if not exist %USERPROFILE%\%%i (
    mklink %USERPROFILE%\%%i %DOTFILES%\%%i
  )
)

@rem $HOME/vimfiles が存在しなければ作成
if not exist %USERPROFILE%\vimfiles (
  md %USERPROFILE%\vimfiles
) else if not exist %USERPROFILE%\.vim (
  @rem $HOME/vimfiles のシンボリックリンクとして $HOME/.vim を作成
  mklink /D %USERPROFILE%\.vim %USERPROFILE%\vimfiles
)

@rem $HOME/vimfiles/ftplugin がなかったら作成し ftplugin のシンボリックリンクを貼る
if not exist %USERPROFILE%\vimfiles\ftplugin (
  md %USERPROFILE%\vimfiles\ftplugin
  mklink %USERPROFILE%\vimfiles\ftplugin\ruby.vim %DOTFILES%\.vim\ftplugin\ruby.vim
)

@rem Vim のバックアップファイル用ディレクトリが存在しなければ作成
if not exist %USERPROFILE%\tmp (
  md %USERPROFILE%\tmp
)

@pause
