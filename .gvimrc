" 縦幅
set lines=60

" 横幅
set columns=160

" font は Ricty Diminished
set guifont=Ricty\ Diminished\ 10

" クリップボード共有
set clipboard=unnamed

" ツールバーを削除
set guioptions-=T

" gvim は UTF-8
set encoding=utf8

" 無名レジスタに入るデータを、*レジスタにも入れる
set clipboard+=unnamed

" for NERDTree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" MacVim の場合 .vimrc で指定しても上書きされるのでここで再度指定
" for Wombat
if isdirectory($HOME . '/.vim/bundle/Wombat')
    colorscheme wombat
endif
