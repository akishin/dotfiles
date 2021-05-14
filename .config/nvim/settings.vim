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
set hlsearch                   " 検索結果のハイライト表示
set laststatus=2               " 常にステータスラインを表示
set cursorline                 "カーソル行を可視化
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
set clipboard+=unnamedplus     " OS のクリップボードを使用
set splitbelow                 " sp で分割時新しいウィンドウを下に開く
set splitright                 " vsp で分割時新しいウィンドウを右に開く
set diffopt=vertical           " diff を常に縦分割
set nostartofline              " 移動コマンド使用時行頭に移動しない
set ambiwidth=double
set termguicolors

" 矩形選択で行末を超えてブロックを選択できるようにする
set virtualedit+=block

" 改行
set ffs=unix,dos,mac
" 日本語自動判別
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set encoding=utf-8
set fileencoding=utf-8

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

" シンタックスハイライト有効
syntax on
" ファイルタイプ判定を有効
filetype plugin on
" ファイルタイプにあわせたインデントを利用する
filetype indent on
