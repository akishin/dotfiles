" 縦幅
set lines=60

" 横幅
set columns=160

" クリップボード共有
set clipboard=unnamed

" ツールバーを削除
set guioptions-=T

" gvim は UTF-8
set encoding=utf8

" 無名レジスタに入るデータを、*レジスタにも入れる
set clipboard+=unnamed

" for NERDTree
" GUI の時は初期状態でサイドバー表示
if isdirectory($HOME . '/.vim/bundle/The-NERD-tree')
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
endif

" for Wombat
if isdirectory($HOME . '/.vim/bundle/Wombat')
    colorscheme wombat
endif

" OS 別 .gvimrc
if has("unix")
    " Linux
    source ~/dotfiles/.gvimrc.linux
elseif has('mac') || has('macunix')
    " Mac
    source ~/dotfiles/.gvimrc.mac
elseif has("win32") || has("win64")
    " Windows
    source ~/dotfiles/.gvimrc.win
endif

