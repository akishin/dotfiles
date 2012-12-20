" for vundle
if filereadable(expand("~/dotfiles/.vimrc.vundle"))
  source ~/dotfiles/.vimrc.vundle
endif

" for neobundle
if filereadable(expand("~/dotfiles/.vimrc.neobundle"))
  source ~/dotfiles/.vimrc.neobundle
endif

set number
set nowrap
set autoindent
set smartindent
set cindent
set tabstop=4
set shiftwidth=4
set expandtab
set noerrorbells
" set mouse=a
set showmode
set showmatch
set showcmd
set hlsearch
set laststatus=2
" set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set hid
set fileencoding=utf8
set term=builtin_linux
set ttytype=builtin_linux
syntax on

" 日本語自動判別
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

" バックアップディレクトリを変更
set backupdir=$HOME/tmp
"set nobackup
" スワップファイルディレクトリを変更
set directory=$HOME/tmp

" grep コマンドにオプションを指定
set grepprg=grep\ -nH
" grep 後に自動で Quickfix ウィンドウを開く
au QuickfixCmdPost make,grep,grepadd,vimgrep copen

if has("autocmd")
" ファイルタイプの検索を有効にする
filetype plugin on
" そのファイルタイプにあわせたインデントを利用する
filetype indent on
endif

" 保存時に行末の空白を除去する
" これやっちゃうと Markdown で改行がなくなっちゃう
"autocmd BufWritePre * :%s/\s\+$//ge

" <C-Space>でomni補完
imap <C-Space> <C-x><C-o>

" Rubyのオムニ補完を設定(ft-ruby-omni)
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" タグファイルの指定
" set tags=$HOME/tags/ruby/ruby.tags,$HOME/tags/ruby/gems.tags
" <C-]>でタグジャンプ時にタグが複数あったらリスト表示
nnoremap <C-]> g<C-]>zz

" 日本語入力ON時のカーソルの色を設定
if has('multi_byte_ime') || has('xim')
  highlight CursorIM guibg=LightCyan guifg=NONE
endif

" 全角スペースの表示
" highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
" match ZenkakuSpace / /

" Escの2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" カレントウィンドウのみ現在行ハイライト
set cursorline
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine term=reverse cterm=reverse ctermbg=black ctermfg=242

" for Plugin settings
source ~/dotfiles/.vimrc.plugins

