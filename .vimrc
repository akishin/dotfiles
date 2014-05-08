set number
set nowrap
set autoindent
set smartindent
set cindent
set tabstop=4
set shiftwidth=4
set expandtab
set noerrorbells
set showmode
set showmatch
set showcmd
set hlsearch
set laststatus=2
" set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set hid
set term=builtin_linux
set ttytype=builtin_linux
set backspace=indent,eol,start
set formatoptions=lmoq
set vb t_vb=
set colorcolumn=80
" set mouse=a
" set guioptions+=a
" set ttymouse=xterm2

syntax on

if isdirectory($HOME . '/tmp')
    " バックアップディレクトリを変更
    set backupdir=$HOME/tmp
    "set nobackup
    " スワップファイルディレクトリを変更
    set directory=$HOME/tmp
endif

" デフォルト UTF-8
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf8

set ffs=unix,dos,mac

" 日本語自動判別
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

" 文字コードを変えて開き直す
command! Utf8 e ++enc=utf-8
command! Euc  e ++enc=euc-jp
command! Sjis e ++enc=cp932
command! Jis  e ++enc=iso-2022-jp

" 以下のファイルは UTF-8
autocmd FileType ruby      :set fileencoding=utf-8
autocmd FileType gitcommit :set fileencoding=utf-8

" RSpec のファイルタイプを設定
augroup RSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

" markdown のファイルタイプを設定
augroup markdown
  autocmd!
  autocmd BufRead,BufNewFile *.md set filetype=markdown
augroup END

" nginx.conf のファイルタイプを設定
augroup nginx
  autocmd!
  autocmd BufRead,BufNewFile /etc/nginx/nginx.conf        set filetype=nginx
  autocmd BufRead,BufNewFile /etc/nginx/conf.d/*          set filetype=nginx
  autocmd BufRead,BufNewFile /etc/nginx/sites-available/* set filetype=nginx
augroup END

" vimrc を編集反映
command! Ev edit $MYVIMRC
" vimrc を再読込み
command! Rv source $MYVIMRC

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" grep コマンドにオプションを指定
set grepprg=grep\ -nH
" grep 後に自動で Quickfix ウィンドウを開く
au QuickfixCmdPost make,grep,grepadd,vimgrep copen

" ファイルタイプの検索を有効にする
filetype plugin on

" そのファイルタイプにあわせたインデントを利用する
filetype indent on

" 改行時に自動でコメント行が継続されないようにする
autocmd FileType * setlocal formatoptions-=ro

" 保存時に行末の空白を除去する
" これやっちゃうと Markdown で改行がなくなっちゃう
"autocmd BufWritePre * :%s/\s\+$//ge

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

" 矩形選択で行末を超えてブロックを選択できるようにする
set virtualedit+=block

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

" 不可視文字表示
set list
" 不可視文字の表示形式
" set listchars=tab:>.,trail:_,extends:>,precedes:<,eol:↲
set listchars=tab:>.,trail:_,extends:>,precedes:<
" 印字不可能文字を16進数で表示
set display=uhex

" 開いたファイルのディレクトリに自動で移動
" set autochdir

" CTRL-hjkl でウインドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
" 前のバッファ
noremap <C-Tab> :bp<CR>
" 次のバッファ
noremap <C-S-Tab> :bn<CR>

" あまり使わない全角記号を半角記号に変換
inoremap ＊ *
inoremap ＝ =
inoremap （ (
inoremap ） )
if exists('##InsertCharPre')
    autocmd InsertCharPre <buffer> if v:char == '　' | let v:char = " " | endif
endif

" <C-Space>でomni補完
imap <C-Space> <C-x><C-o>

" Rubyのオムニ補完を設定(ft-ruby-omni)
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" git のコミットログ編集時はバックアップを作らない
autocmd FileType gitcommit setlocal nobackup noundofile noswapfile

" help のバッファを q で終了できるように
autocmd FileType help nnoremap <buffer> <silent> q :<C-u>close<CR>

" Space-s,s で英語のスペルチェック切換え
nnoremap [Show] <Nop>
nmap <Space>s [Show]
nnoremap [Show]s  :<C-u>setl spell!<CR>

" for golang
if $GOROOT != ''
  " :Import, :Fmt, :Godoc などが使用可能になる
  set rtp+=$GOROOT/misc/vim

  if $GOPATH != ''
    " gocode
    if isdirectory($GOPATH . "/src/github.com/nsf/gocode/vim")
      set rtp+=$GOPATH/src/github.com/nsf/gocode/vim
    endif
    " golint
    if isdirectory($GOPATH . "/src/github.com/golang/lint/misc/vim")
      set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
    endif
  endif

  augroup golang
    " *.go ファイル保存時に自動フォーマットを行う
    auto BufWritePre *.go Fmt
  augroup END
endif

" for vundle
if filereadable(expand("~/dotfiles/.vimrc.vundle"))
  source ~/dotfiles/.vimrc.vundle
endif

" for neobundle
if filereadable(expand("~/dotfiles/.vimrc.neobundle"))
  source ~/dotfiles/.vimrc.neobundle
endif

" for Plugin settings
if filereadable(expand("~/dotfiles/.vimrc.plugins"))
    source ~/dotfiles/.vimrc.plugins
endif

" for Local settings
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
