@set DOTFILES=%USERPROFILE%\dotfiles
for %%i in (.vimrc, .gvimrc) do (
  if not exist %USERPROFILE%\%%i (
    mklink %USERPROFILE%\%%i %DOTFILES%\%%i
  )
)

@rem $HOME/vimfiles �����݂��Ȃ���΍쐬
if not exist %USERPROFILE%\vimfiles (
  md %USERPROFILE%\vimfiles
) else if not exist %USERPROFILE%\.vim (
  @rem $HOME/vimfiles �̃V���{���b�N�����N�Ƃ��� $HOME/.vim ���쐬
  mklink /D %USERPROFILE%\.vim %USERPROFILE%\vimfiles
)

@rem $HOME/vimfiles/ftplugin ���Ȃ�������쐬�� ftplugin �̃V���{���b�N�����N��\��
if not exist %USERPROFILE%\vimfiles\ftplugin (
  md %USERPROFILE%\vimfiles\ftplugin
  mklink %USERPROFILE%\vimfiles\ftplugin\ruby.vim %DOTFILES%\.vim\ftplugin\ruby.vim
)

@rem Vim �̃o�b�N�A�b�v�t�@�C���p�f�B���N�g�������݂��Ȃ���΍쐬
if not exist %USERPROFILE%\tmp (
  md %USERPROFILE%\tmp
)

@pause
