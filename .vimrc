scriptencoding utf-8

set number                     " 行番号表示
set ruler                      " ルーラー表示
set nowrap                     " 折り返さない
set autoindent                 " 自動で一つ前の行と同じインデント
set smartindent                " 高度な自動インデント
set cindent                    " より高度なC 言語スタイルのインデント
set tabstop=4                  " tab 挿入時のインデント文字数
set shiftwidth=4               " autoindent 時のインデント文字数
set expandtab                  " ソフト tab(タブ文字の代わりに半角スペース)
set autoread                   " 変更されたファイルを自動で再読み込み
set modeline                   " モードライン有効
set showmode                   " 現在のモードを表示
set showmatch                  " 対応する括弧を表示
set showcmd                    " 入力中のコマンドを右下に表示
" set incsearch                " インクリメンタルサーチ
set hlsearch                   " 検索結果のハイライト表示
set laststatus=2               " 常にステータスラインを表示
set hidden                     " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start " backspace キーの動作を指定
set notitle                    " 端末のウインドウタイトルを変更しない
set textwidth=0                " 行の自動折り返しをしない
set formatoptions=lmoq         " テキスト整形オプション
set vb t_vb=                   " ビープ音を鳴らさないようにする
set noerrorbells               " エラー時のビープ音をオフ
set colorcolumn=80             " 80文字目を色を変えて表示
set history=1024               " コマンドの履歴保持数
set mouse=a                    " ターミナルでマウスを有効
set guioptions+=a              " GUI 時にマウスでのビジュアル選択有効
set ttymouse=xterm2            " ターミナルでのマウスの動作を指定
set clipboard+=unnamed         " OS のクリップボードを使用
" set autochdir                  " 開いたファイルのディレクトリに自動で移動
" set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set splitbelow                 " sp で分割時新しいウィンドウを下に開く
set splitright                 " vsp で分割時新しいウィンドウを右に開く
set diffopt=vertical           " diff を常に縦分割

if version >= 704
    set regexpengine=1         " 旧正規表現エンジンを使う
endif

" KaoriYa 版 Vim(GVim,MacVim) でコマンドモードに戻る際に IME を OFF
" set imdisable
" 矩形選択で行末を超えてブロックを選択できるようにする
set virtualedit+=block

" 不可視文字表示
set list
" 不可視文字の表示形式
" set listchars=tab:>.,trail:_,extends:>,precedes:<,eol:↲
set listchars=tab:>.,trail:_,extends:>,precedes:<
" 印字不可能文字を16進数で表示
set display=uhex

" 改行
set ffs=unix,dos,mac
" 日本語自動判別
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

" grep コマンドにオプションを指定
set grepprg=grep\ -nH

if isdirectory($HOME . '/tmp')
    "set nobackup " バックアップを取らない
    " バックアップディレクトリを変更
    set backupdir=$HOME/tmp
    "set noswapfile " スワップファイルを作らない
    " スワップファイルディレクトリを変更
    set directory=$HOME/tmp
    "set noundofile " Undo ファイルを作らない
    " Undo ファイルディレクトリを変更
    set undodir=$HOME/tmp
endif

" シンタックスハイライト有効
syntax on
" シンタックスハイライトを適用する一行内の文字数の最大値
set synmaxcol=256
" ファイルタイプ判定を有効
filetype plugin on
" ファイルタイプにあわせたインデントを利用する
filetype indent on

if $RSENSE_HOME == ''
    " vim-ruby のオムニ補完設定(ft-ruby-omni)
    let g:rubycomplete_rails = 1
    let g:rubycomplete_buffer_loading = 1
    let g:rubycomplete_classes_in_global = 1
    let g:rubycomplete_include_object = 1
    let g:rubycomplete_include_object_space = 1
endif

" 取り敢えず自分用の augroup は一個にしてみた
" 細かい粒度でグループ定義するのとどっちがいいのか？
augroup MyVimrc
    autocmd!
    " ファイルタイプ設定
    " NeoBundleLazy してる場合に読込時にシンタックスハイライトが効かないので設定
    autocmd BufNewFile,BufRead *_spec.rb  set filetype=ruby.rspec
    autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby
    autocmd BufNewFile,BufRead Guardfile  set filetype=ruby
    autocmd BufNewFile,BufRead .pryrc     set filetype=ruby
    autocmd BufNewFile,BufRead *.md       set filetype=markdown
    autocmd BufNewFile,BufRead /etc/nginx/nginx.conf        set filetype=nginx
    autocmd BufNewFile,BufRead /etc/nginx/conf.d/*          set filetype=nginx
    autocmd BufNewFile,BufRead /etc/nginx/sites-available/* set filetype=nginx
    autocmd BufNewFile,BufRead *.less   set filetype=less
    autocmd BufNewFile,BufRead *.coffee set filetype=coffee
    autocmd BufNewFile,BufRead *.coffee setlocal tabstop=2 shiftwidth=2 fileencoding=utf-8
    autocmd BufNewFile,BufRead *.slim   set filetype=slim
    autocmd BufNewFile,BufRead *.go     set filetype=go
    autocmd BufNewFile,BufRead *.psgi   set filetype=perl
    autocmd BufNewFile,BufRead *.cr setlocal tabstop=2 shiftwidth=2 fileencoding=utf-8

    autocmd FileType html       setlocal tabstop=2 shiftwidth=2 fileencoding=utf-8
    autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 fileencoding=utf-8

    " 以下のファイルは UTF-8
    autocmd FileType go        setlocal fileencoding=utf-8
    autocmd FileType ruby      setlocal fileencoding=utf-8
    autocmd FileType gitcommit setlocal fileencoding=utf-8
    autocmd FileType markdown  setlocal fileencoding=utf-8

    " PHP の場合はカーソル下の単語に「$」を含める
    autocmd FileType php setl iskeyword+=$

    " Perl の場合はカーソル下の単語に「$,%,@」を含める
    autocmd FileType perl setl iskeyword+=$,%,@-@

    " Ruby の場合はカーソル下の単語に「?」を含める
    autocmd FileType ruby setl iskeyword+=?

    " テキストの自動改行を OFF が上書きされないようにする
    autocmd FileType * setlocal textwidth=0

    " 改行時に自動でコメント行が継続されないようにする
    autocmd FileType * setlocal formatoptions-=ro

    " 前回終了したカーソル行に移動
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

    " git のコミットログ編集時はバックアップを作らない
    autocmd FileType gitcommit setlocal nobackup noundofile noswapfile

    " help のバッファを q で終了できるように
    autocmd FileType help nnoremap <buffer> <silent> q :<C-u>close<CR>

    " 保存時に行末の空白を除去する
    " これやっちゃうと Markdown で改行がなくなっちゃう
    "autocmd BufWritePre * :%s/\s\+$//ge

    " grep 後に自動で Quickfix ウィンドウを開く
    autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

    " 全角空白を半角空白に変換
    if exists('##InsertCharPre')
        autocmd InsertCharPre <buffer> if v:char == '　' | let v:char = " " | endif
    endif
augroup END

" 文字コードを変えて開き直す
command! Utf8 e ++enc=utf-8
command! Euc  e ++enc=euc-jp
command! Sjis e ++enc=cp932
command! Jis  e ++enc=iso-2022-jp

" vimrc を編集反映
command! Ev edit $MYVIMRC
" vimrc を再読込み
command! Rv source $MYVIMRC

" 日本語入力ON時のカーソルの色を設定
if has('multi_byte_ime') || has('xim')
    highlight CursorIM guibg=LightCyan guifg=NONE
endif

" 全角スペースの表示
" highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
" match ZenkakuSpace / /

" カレントウィンドウのみ現在行ハイライト
set cursorline
augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorline
    autocmd WinEnter,BufRead * set cursorline
augroup END
hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine term=reverse cterm=reverse ctermbg=black ctermfg=242

" タグファイルの指定
" set tags=$HOME/tags/ruby/ruby.tags,$HOME/tags/ruby/gems.tags

" <C-]>でタグジャンプ時にタグが複数あったらリスト表示
nnoremap <C-]> g<C-]>zz

" Escの2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" 挿入モードで Ctrl-p でクリップボード内容を貼り付け
imap <C-p> <ESC>"*pa

" CTRL-hjkl でウインドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
" 前のバッファ
noremap <C-Tab> :bp<CR>
" 次のバッファ
noremap <C-S-Tab> :bn<CR>

" ビジュアルモードでインデント変更後も選択を維持する
vnoremap < <gv
vnoremap > >gv

" あまり使わない全角記号を半角記号に変換
inoremap ＊ *
inoremap ＝ =
inoremap （ (
inoremap ） )

" <C-Space>でomni補完
imap <C-Space> <C-x><C-o>

" 文字列選択してから「*」で選択した文字列で検索
vnoremap * "zy:let @/ = @z<CR>n

" Space-s,s で英語のスペルチェック切換え
nnoremap [Show] <Nop>
nmap <Space>s [Show]
nnoremap [Show]s  :<C-u>setl spell!<CR>

" for neobundle
if filereadable(expand("~/dotfiles/.vimrc.neobundle"))
    source ~/dotfiles/.vimrc.neobundle
endif

" for Plugin settings
if filereadable(expand("~/dotfiles/.vimrc.plugins"))
    source ~/dotfiles/.vimrc.plugins
endif

" OS 別 .vimrc
if has('mac') || has('macunix')
    " Mac
    source ~/dotfiles/.vimrc.mac
elseif has("unix")
    " Linux
    source ~/dotfiles/.vimrc.linux
elseif has("win32") || has("win64")
    " Windows
    source ~/dotfiles/.vimrc.win
endif

" for Local settings
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
