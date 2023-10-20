" 縦幅
set lines=60

" 横幅
set columns=160

" ツールバーを削除
set guioptions-=T

" メニューバーを削除
set guioptions-=m

" gvim は UTF-8
set encoding=utf8

" GUI 時にマウスでのビジュアル選択有効
set guioptions+=a

" 無名レジスタに入るデータを、*レジスタにも入れる
" http://nanasi.jp/articles/howto/editing/clipboard.html
set clipboard+=unnamed

" for NERDTree
" GUI の時は初期状態でサイドバー表示
if dein#tap('nerdtree')
    " 隠しファイルを表示
    let NERDTreeShowHidden = 1
    " 起動時に NERDTree を表示
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
endif

" for Wombat
if dein#tap('vim-wombat-scheme')
    colorscheme wombat
endif

" OS 別 .gvimrc
if has('mac') || has('macunix')
    " Mac
    source ~/dotfiles/.gvimrc.mac
elseif has("unix")
    " Linux
    source ~/dotfiles/.gvimrc.linux
elseif has("win32") || has("win64")
    " Windows
    source ~/dotfiles/.gvimrc.win
endif

" for Local settings
if filereadable(expand("~/.gvimrc.local"))
    source ~/.gvimrc.local
endif

